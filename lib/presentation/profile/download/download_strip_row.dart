import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/core/dependency_injection/dependency_injection.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/cards/download/cubit/local_card_cubit.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/cards/download/download_card.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/cards/download/download_card_status/cubit/local_card_status_cubit.dart';
import 'package:open_learning_smart_tv/presentation/profile/download/cubit/download_strip_cubit.dart';
import 'package:open_learning_smart_tv/presentation/profile/download/wall/download_wall_strip_page.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../theme/app_theme.dart';

class DownloadStripRow extends StatefulWidget {
  const DownloadStripRow({super.key});

  @override
  State<DownloadStripRow> createState() => _DownloadStripRowState();
}

class _DownloadStripRowState extends State<DownloadStripRow> {
  static const _padding = EdgeInsets.fromLTRB(12.0, 16.0, 16.0, 0.0);

  @override
  void initState() {
    context.read<DownloadStripCubit>().fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DownloadStripCubit, DownloadStripState>(
      listener: (contexts, state) => state.mapOrNull(
        fetch: (_) => context.read<DownloadStripCubit>().fetch(),
      ),
      listenWhen: (previous, current) => current.maybeMap(
        fetch: (_) => true,
        orElse: () => false,
      ),
      buildWhen: (previous, current) => current.maybeMap(
        fetch: (_) => false,
        orElse: () => true,
      ),
      builder: (context, state) => state.maybeWhen(
        loading: () => _shimmerLoader,
        error: () => const SizedBox.shrink(),
        success: (downloadItems) => downloadItems?.isNotEmpty == true
            ? AspectRatio(
                aspectRatio: Dimens.learningCardRatio,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 4.0,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              LabelsManager().getRemoteStringFromLabelKeys(
                                  RemoteLabelKeys.download),
                              style: AppTextTheme.subtitle(
                                weight: FontWeight.w700,
                                color: ColorManager().getColorTextPrimary(),
                              ),
                            ),
                          ),
                          const SizedBox(width: Dimens.spacingM),
                          GestureDetector(
                              onTap: () async {
                                await context
                                    .pushNamed(DownloadWallStripPage.routeName);
                                if (context.mounted) {
                                  context.read<DownloadStripCubit>().fetch();
                                }
                              },
                              child: Transform.scale(
                                  scale: 0.9999,
                                  child: SvgPicture.asset(
                                      "assets/icons/right_arrow.svg",
                                      colorFilter: ColorFilter.mode(
                                          ColorManager().getColorTextPrimary(),
                                          BlendMode.srcIn)))),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimens.learningCardHeight,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: _padding,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: Dimens.spacingXS),
                        itemCount: downloadItems?.length ?? 0,
                        itemBuilder: (context, index) {
                          return downloadItems?[index] != null
                              ? BlocProvider(
                                  create: (_) => getIt<LocalCardCubit>()
                                    ..init(downloadItems![index], context),
                                  child: const DownloadCard())
                              : Text(
                                  downloadItems?[index].downloadedItem?.title ??
                                      "no file name",
                                  style: AppTextTheme.subtitle(
                                    weight: FontWeight.w700,
                                  ),
                                );
                        },
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
        orElse: () => const SizedBox(),
      ),
    );
  }

  Widget get _shimmerLoader {
    return Shimmer.fromColors(
      baseColor: AppColors.white.withOpacity(.09),
      highlightColor: AppColors.primaryFaded,
      period: const Duration(seconds: 2),
      child: AspectRatio(
        aspectRatio: Dimens.learningCardRatio,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20.0, 4.0, 16.0, 4.0),
              width: (MediaQuery.of(context).size.width /
                      Dimens.learningCardRatio) *
                  .7,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.3),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            SizedBox(
              height: Dimens.learningCardHeight,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: _padding,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) =>
                    const SizedBox(width: Dimens.spacingXS),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return const DownloadCardShimmer();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
