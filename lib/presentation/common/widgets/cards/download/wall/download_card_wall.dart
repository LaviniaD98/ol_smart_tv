import 'dart:io';
import 'dart:math';

import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/core/dependency_injection/dependency_injection.dart';
import 'package:open_learning_smart_tv/domain/entities/download/downloaded_item_wall.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/cards/download/cubit/local_card_cubit.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/cards/download/download_card_status/cubit/local_card_status_cubit.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/cards/download/download_card_status/local_card_status.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

class DownloadCardWall extends StatelessWidget {
  final VoidCallback deleteCallback;
  final VoidCallback tapCallback;

  const DownloadCardWall(
    this.tapCallback,
    this.deleteCallback, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalCardCubit, LocalCardState>(
      builder: (context, state) => state.when(
        done: (data, parentContext) => _buildCard(data, context),
        loading: () => const DownloadCardWallShimmer(),
      ),
    );
  }

  Widget _buildCard(DownloadedItemExtended data, BuildContext context) {
    return SizedBox(
      height: (MediaQuery.of(context).size.width * .25) *
          MediaQuery.of(context).textScaleFactor,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 8.0, bottom: 8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: GestureDetector(
                    onTap: () {
                      tapCallback.call();
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(Dimens.radius),
                      child: _getStackedImages(data),
                    ),
                  ),
                ),
                const SizedBox(width: Dimens.spacingL),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              data.downloadedItem?.title ?? 'No title',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextTheme.subtitle(
                                  weight: FontWeight.w700,
                                  color: ColorManager().getColorTextPrimary()),
                            ),
                          ),
                          const SizedBox(width: Dimens.spacingM),
                          SizedBox(
                              width: 24.0,
                              height: 24.0,
                              child: getDownloadedItemIcon(data)),
                          const SizedBox(width: Dimens.spacingM),
                          GestureDetector(
                              onTap: () {
                                deleteCallback.call();
                              },
                              child: SizedBox(
                                width: 24.0,
                                height: 24.0,
                                child: Transform.scale(
                                    scale: 0.9999,
                                    child: SvgPicture.asset(
                                      "assets/icons/ic_trash.svg",
                                      colorFilter: ColorFilter.mode(
                                          ColorManager()
                                              .getColorSystemPrimary01(),
                                          BlendMode.srcIn),
                                    )),
                              )),
                        ],
                      ),
                      const SizedBox(height: Dimens.spacingXS),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  getFileSizeString(
                                      bytes: data.downloadedItem?.size,
                                      decimals: 2),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextTheme.caption(
                                      weight: FontWeight.w400,
                                      color:
                                          ColorManager().getColorTextPrimary()),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          BlocProvider(
              create: (_) =>
                  getIt<LocalCardStatusCubit>()..init(data.downloadedItem),
              child: const LocalCardStatus())
        ],
      ),
    );
  }

  Stack _getStackedImages(DownloadedItemExtended data) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.dstATop),
              image: FileImage(
                File(data.downloadedItem?.coverLocalPath ?? ""),
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        data.status == DownloadTaskStatus.complete && data.progress == 100
            ? Align(
                alignment: Alignment.center,
                child: Transform.scale(
                    scale: 0.9999,
                    child: SvgPicture.asset("assets/icons/ic_play.svg",
                        width: 16.0,
                        height: 20.0,
                        colorFilter: ColorFilter.mode(
                            ColorManager().getColorTextPrimary(),
                            BlendMode.srcIn))),
              )
            : const SizedBox()
      ],
    );
  }

  String getFileSizeString({int? bytes, int decimals = 0}) {
    if (bytes == null) {
      return "N.A.";
    }
    const suffixes = ["b", "Kb", "Mb", "Gb", "Tb"];
    if (bytes == 0) return '0${suffixes[0]}';
    var i = (log(bytes) / log(1024)).floor();
    return "${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}";
  }

  Widget getDownloadedItemIcon(DownloadedItemExtended item) {
    if (item.status == DownloadTaskStatus.complete) {
      return Transform.scale(
          scale: 0.9999,
          child: SvgPicture.asset("assets/icons/detail/ic_completed.svg",
              colorFilter: ColorFilter.mode(
                  ColorManager().getColorBackgroundPrimaryCta(),
                  BlendMode.srcIn)));
    }
    if (item.status == DownloadTaskStatus.running) {
      double perc = item.progress / 100;
      return CircularProgressIndicator(
          value: perc,
          backgroundColor: ColorManager().getColorSystemDisabled(),
          color: ColorManager().getColorSystemPrimary02());
    }
    if (item.status == DownloadTaskStatus.enqueued) {
      double perc = 0.0;
      return CircularProgressIndicator(
          value: perc,
          backgroundColor: ColorManager().getColorSystemDisabled(),
          color: ColorManager().getColorSystemPrimary02());
    }
    return Transform.scale(
        scale: 0.9999,
        child: SvgPicture.asset("assets/icons/detail/ic_completed.svg",
            colorFilter: ColorFilter.mode(
                ColorManager().getColorBackgroundPrimaryCta(),
                BlendMode.srcIn)));
  }
}

class DownloadCardWallShimmer extends StatelessWidget {
  const DownloadCardWallShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: AppColors.white.withOpacity(.09),
        highlightColor: AppColors.primaryFaded,
        period: const Duration(seconds: 2),
        child: SizedBox(
          height: (MediaQuery.of(context).size.width * .25) *
              MediaQuery.of(context).textScaleFactor,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white.withOpacity(.2),
                ),
                margin: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white.withOpacity(.2),
                        ),
                      ),
                    ),
                    const SizedBox(width: Dimens.spacingL),
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextTheme.subtitle(
                                      weight: FontWeight.w700,
                                      color:
                                          ColorManager().getColorTextPrimary()),
                                ),
                              ),
                              const SizedBox(width: Dimens.spacingM),
                              const SizedBox(width: 24.0, height: 24.0),
                              const SizedBox(width: Dimens.spacingM),
                              SizedBox(
                                  width: 24.0,
                                  height: 24.0,
                                  child: Transform.scale(
                                      scale: 0.9999,
                                      child: SvgPicture.asset(
                                        "assets/icons/ic_trash.svg",
                                        colorFilter: ColorFilter.mode(
                                            ColorManager()
                                                .getColorTextPrimary(),
                                            BlendMode.srcIn),
                                      )))
                            ],
                          ),
                          const SizedBox(height: Dimens.spacingXS),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextTheme.caption(
                                          weight: FontWeight.w400,
                                          color: ColorManager()
                                              .getColorTextPrimary()),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

enum LearningCardWallType { standard, favourite }
