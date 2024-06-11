import 'dart:io';

import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/core/dependency_injection/dependency_injection.dart';
import 'package:open_learning_smart_tv/domain/entities/download/downloaded_item_wall.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/cards/download/cubit/local_card_cubit.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/cards/download/download_card_status/cubit/local_card_status_cubit.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/cards/download/download_card_status/local_card_status.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/ol_alert_dialog.dart';
import 'package:open_learning_smart_tv/presentation/offline_state/offline_cubit.dart';
import 'package:open_learning_smart_tv/presentation/profile/download/cubit/download_strip_cubit.dart';
import 'package:open_learning_smart_tv/presentation/video_player/offline/video_player_offline_page.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../../../../theme/app_theme.dart';
import '../../tag/duration_tag.dart';

class DownloadCard extends StatelessWidget {
  const DownloadCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalCardCubit, LocalCardState>(
      builder: (context, state) => state.when(
        done: (data, parentContext) => _buildCard(data, parentContext, context),
        loading: () => const DownloadCardShimmer(),
      ),
    );
  }

  Widget _buildCard(DownloadedItemExtended data, BuildContext parentContext,
      BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DownloadTask? downloadTask = await parentContext
            .read<DownloadStripCubit>()
            .getDownloadTask(data);
        if (downloadTask != null && context.mounted) {
          data.updateTask = downloadTask;
          data.status == DownloadTaskStatus.complete && data.progress == 100
              ? startPlayer(context, data, parentContext)
              : {
                  OlAlertDialog.show(
                    context,
                    title: LabelsManager().getRemoteStringFromLabelKeys(
                        RemoteLabelKeys.download_dialog_notavailable_title),
                    message: LabelsManager().getRemoteStringFromLabelKeys(
                        RemoteLabelKeys.download_dialog_notavailable_body),
                    actionLabel: LabelsManager().getRemoteStringFromLabelKeys(
                        RemoteLabelKeys.download_dialog_notavailable_oklabel),
                  )
                };
        }
      },
      child: AspectRatio(
        aspectRatio: Dimens.learningCardRatio,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 8.0),
              decoration: _decorationBackground(data),
              child: Container(
                padding: const EdgeInsets.fromLTRB(24.0, 8.0, 16.0, 16.0),
                decoration: BoxDecoration(
                  // border: _borderForeground,
                  borderRadius: BorderRadius.circular(8.0),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      ColorManager().getColorGradient05Start(),
                      ColorManager().getColorGradient05End(),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (data.downloadedItem?.duration != null)
                      _durationTag(data),
                    const Spacer(),
                    RichText(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: data.downloadedItem?.learningObjectTypology
                                .getTranslatedValue()
                                .toUpperCase(),
                            style: AppTextTheme.caption(
                              weight: FontWeight.w700,
                              color: ColorManager().getColorTextMandatory(),
                            ),
                          ),
                          TextSpan(
                            text: ' | ',
                            style: AppTextTheme.caption(
                                weight: FontWeight.w700,
                                color: ColorManager().getColorTextPrimary()),
                          ),
                          TextSpan(
                            text: data.downloadedItem?.learningObjectType
                                .getTranslatedValue()
                                .toUpperCase(),
                            style: AppTextTheme.caption(
                                weight: FontWeight.w700,
                                color: ColorManager().getColorTextPrimary()),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      data.downloadedItem?.title ?? 'No title',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextTheme.body(
                          weight: FontWeight.w700,
                          color: ColorManager().getColorTextPrimary()),
                    ),
                  ],
                ),
              ),
            ),
            BlocProvider(
                create: (_) =>
                    getIt<LocalCardStatusCubit>()..init(data.downloadedItem),
                child: const LocalCardStatus())
          ],
        ),
      ),
    );
  }

  startPlayer(BuildContext context, DownloadedItemExtended data,
      BuildContext parentContext) async {
    WakelockPlus.enable();
    await context.pushNamed<bool?>(
      VideoPlayerOfflinePage.routeName,
      extra: VideoPlayerOfflinePageArgs(
        id: data.downloadedItem?.id ?? 0,
        title: data.downloadedItem?.title ?? 'No title',
        typology: data.downloadedItem?.learningObjectTypology ??
            LearningObjectTypology.externalRes,
        type: data.downloadedItem?.learningObjectType ??
            LearningObjectType.unknown,
        brightcoveId: data.taskId,
        downloadedItemExtended: data,
      ),
    );
    WakelockPlus.disable();
    if (context.mounted) {
      await context.read<OfflineCubit>().checkOfflineStatements();
      if (parentContext.mounted) {
        parentContext.read<DownloadStripCubit>().init();
      }
    }
  }

  Widget _durationTag(DownloadedItemExtended data) {
    Color? color = ColorManager().getColorBackgroundDisabled();
    return Align(
      alignment: Alignment.topRight,
      child: DurationTag.fromMinutes(data.downloadedItem?.duration ?? 0,
          color: color),
    );
  }

  BoxDecoration _decorationBackground(DownloadedItemExtended data) {
    if (data.downloadedItem?.coverLocalPath != null &&
        data.downloadedItem?.coverLocalPath?.isNotEmpty == true) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: FileImage(
            File(data.downloadedItem?.coverLocalPath ?? ""),
          ),
        ),
      );
    }
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      color: AppColors.white.withOpacity(.05),
    );
  }
}

class DownloadCardShimmer extends StatelessWidget {
  const DownloadCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: AppColors.white.withOpacity(.09),
        highlightColor: AppColors.primaryFaded,
        period: const Duration(seconds: 2),
        child: AspectRatio(
          aspectRatio: Dimens.learningCardRatio,
          child: Container(
            margin: const EdgeInsets.only(left: 8.0),
            padding: const EdgeInsets.fromLTRB(24.0, 8.0, 16.0, 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white.withOpacity(.2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: (MediaQuery.of(context).size.width /
                            Dimens.learningCardRatio) *
                        .4,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.5),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  width: (MediaQuery.of(context).size.width /
                          Dimens.learningCardRatio) *
                      .5,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.5),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  width: (MediaQuery.of(context).size.width /
                          Dimens.learningCardRatio) *
                      .6,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.5),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
