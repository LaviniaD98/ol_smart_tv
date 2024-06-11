import 'package:open_learning_smart_tv/domain/entities/detail/detail_page_model.dart';
import 'package:open_learning_smart_tv/domain/entities/download/downloaded_item.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/ol_okcancel_dialog.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/detail_page.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/widgets/download_button/cubit/download_item_cubit.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../theme/app_theme.dart';
import '../../../common/widgets/dialog/ol_alert_dialog.dart';

class DownloadButton extends StatelessWidget {
  const DownloadButton({
    super.key,
    required this.detailPageModel,
    required this.parentId,
    required this.buildContext,
    required this.args,
  });

  final DetailPageModel detailPageModel;
  final String parentId;
  final BuildContext buildContext;
  final DetailPageArgs args;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DownloadItemCubit, DownloadItemState>(
      buildWhen: (previous, current) => current.maybeMap(
        error: (_) => false,
        orElse: () => true,
      ),
      builder: (context, state) => AnimatedSize(
        alignment: Alignment.centerLeft,
        duration: const Duration(milliseconds: 160),
        child: state.maybeWhen(
          loading: () => _loading,
          initial: () =>
              _buttonInitial(detailPageModel, parentId, context, args),
          inprogress: (percentage, taskId, status, downloadedItem) =>
              _buttonInProgress(
                  percentage, taskId, status, downloadedItem, context),
          finished: (taskId, downloadedItem, downloadTaskStatus) =>
              _buttonFinished(
                  taskId, downloadedItem, downloadTaskStatus, context),
          orElse: () => const SizedBox.shrink(),
        ),
      ),
      listenWhen: (previous, current) => current.maybeMap(
        error: (_) => true,
        orElse: () => false,
      ),
      listener: (context, state) => state.whenOrNull(
        error: () async {
          await context.read<DownloadItemCubit>().refreshDownloadList();
          if (context.mounted) {
            return ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(LabelsManager().getRemoteStringFromLabelKeys(
                      RemoteLabelKeys.download_error)),
                ),
              );
          }
        },
      ),
    );
  }
}

Widget get _loading {
  return Padding(
    padding: const EdgeInsets.only(right: Dimens.spacingM),
    child: ElevatedButton(
        key: const ValueKey('in_loading'),
        style: AppButtonStyle.outlined,
        onPressed: () {},
        child: Text(
          LabelsManager().getRemoteStringFromLabelKeys(
              RemoteLabelKeys.download_file_check),
          style: AppTextTheme.button(
              color: ColorManager().getColorTextPrimaryCta()),
        )),
  );
}

Widget _buttonInitial(DetailPageModel detailPageModel, String parentId,
    BuildContext buildContext, DetailPageArgs args) {
  return Padding(
    padding: const EdgeInsets.only(right: Dimens.spacingM),
    child: OutlinedButton.icon(
        key: ValueKey('${detailPageModel.id}-initial'),
        icon: SvgPicture.asset("assets/icons/detail/ic_downloadable.svg",
            colorFilter: ColorFilter.mode(
                ColorManager().getColorBackgroundPrimaryCta(),
                BlendMode.srcIn)),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          backgroundColor: Colors.transparent,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          side: BorderSide(
              width: 1.0, color: ColorManager().getColorSystemPrimary02()),
        ),
        onPressed: () {
          if (detailPageModel.downloadFlag == true) {
            buildContext
                .read<DownloadItemCubit>()
                .scheduleDownload(detailPageModel, parentId, args);
          } else {
            OlAlertDialog.show(buildContext,
                title: LabelsManager()
                    .getRemoteStringFromLabelKeys(RemoteLabelKeys.error),
                message: LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.details_no_download),
                actionLabel: LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.continue_button),
                barrierDismissible: false);
          }
        },
        label: Text(
          LabelsManager()
              .getRemoteStringFromLabelKeys(RemoteLabelKeys.download_stard),
          style: AppTextTheme.button(
              color: ColorManager().getColorTextPrimaryCta()),
        )),
  );
}

Widget _buttonInProgress(
    double percentage,
    String? taskId,
    DownloadTaskStatus downloadTaskStatus,
    DownloadedItem? downloadedItem,
    BuildContext buildContext) {
  return Padding(
    padding: const EdgeInsets.only(right: Dimens.spacingM),
    child: OutlinedButton.icon(
        key: ValueKey('$taskId-inProgress'),
        icon: SizedBox(
          height: 16,
          width: 16,
          child: CircularProgressIndicator(
              value: percentage,
              strokeWidth: 2,
              backgroundColor: ColorManager().getColorSystemDisabled(),
              color: ColorManager().getColorSystemPrimary02()),
        ),
        style: AppButtonStyle.outlined,
        onPressed: () {
          if (taskId != null) {
            OlOkCancelDialog.show(
              buildContext,
              title: LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.download_cancel),
              message: LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.download_cancel_message),
              okActionLabel: LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.download_cancel_popup_yes),
              cancelActionLabel: LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.download_cancel_popup_no),
              okCallback: () {
                buildContext
                    .read<DownloadItemCubit>()
                    .cancelDownload(taskId, downloadedItem, true);
              },
              cancelCallback: () {},
            );
          }
        },
        label: Text(
          downloadTaskStatus == DownloadTaskStatus.enqueued
              ? LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.download_progress_queued)
              : LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.download_progress_running),
          style: AppTextTheme.button(
              color: ColorManager().getColorTextPrimaryCta()),
        )),
  );
}

Widget _buttonFinished(String? taskId, DownloadedItem? downloadedItem,
    DownloadTaskStatus downloadTaskStatus, BuildContext buildContext) {
  return Padding(
    padding: const EdgeInsets.only(right: Dimens.spacingM),
    child: OutlinedButton.icon(
        key: ValueKey('$taskId-finished'),
        icon: SvgPicture.asset("assets/icons/detail/ic_completed.svg",
            colorFilter: ColorFilter.mode(
                ColorManager().getColorBackgroundPrimaryCta(),
                BlendMode.srcIn)),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          backgroundColor: Colors.transparent,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          side: BorderSide(
              width: 1.0, color: ColorManager().getColorSystemPrimary02()),
        ),
        onPressed: () {
          if (taskId != null) {
            OlOkCancelDialog.show(
              buildContext,
              title: LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.download_delete),
              message: LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.download_delete_message),
              okActionLabel: LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.download_cancel_popup_yes),
              cancelActionLabel: LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.download_cancel_popup_no),
              okCallback: () {
                buildContext
                    .read<DownloadItemCubit>()
                    .cancelDownload(taskId, downloadedItem, true);
              },
              cancelCallback: () {},
            );
          }
        },
        label: Text(
          downloadTaskStatus == DownloadTaskStatus.complete
              ? LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.download_finished)
              : LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.download_progress_error),
          style: AppTextTheme.button(
              color: ColorManager().getColorTextPrimaryCta()),
        )),
  );
}
