import 'dart:ui';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/glow_progress_bar/glow_progress_bar.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/tag/status_tag.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_glow/flutter_glow.dart';
import 'package:flutter_svg/svg.dart';

import '../../../color_management/color_manager.dart';
import '../../../domain/enums/types.dart';
import '../../../theme/app_theme.dart';

class ContinueCard extends StatelessWidget {
  final LearningObjectModel data;
  final int index;
  final Function(int) onButtonPressed;

  const ContinueCard({
    super.key,
    required this.data,
    required this.index,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 40;
    double imageWidth = width * 0.15;
    double wPadding = 20;
    double insideMargin = 8;
    double glowPercentage = double.tryParse(
            (data.percentageOfCompletion ?? "0.0").replaceAll("%", "")) ??
        0.0;
    double glowbarPos =
        (width - 2 * wPadding) * clampDouble(glowPercentage, 0, 100) / 100;

    return GestureDetector(
        onTap: () => onButtonPressed(index),
        child: Container(
            width: width,
            decoration: BoxDecoration(
                gradient: AppTheme.greyGradient,
                borderRadius: BorderRadius.circular(Dimens.radius)),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        left: wPadding,
                        right: wPadding,
                        top: 0.8 * wPadding,
                        bottom: 1.5 * wPadding),
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(4.0),
                            child: SizedBox(
                              width: imageWidth,
                              height: double.infinity,
                              child: Stack(fit: StackFit.expand, children: [
                                ClipRRect(
                                  clipBehavior: Clip.hardEdge,
                                  borderRadius:
                                      BorderRadius.circular(Dimens.radius),
                                  child: data.coverPublicURL != null &&
                                          data.coverPublicURL!.isNotEmpty
                                      ? CachedNetworkImage(
                                          imageUrl: data.coverPublicURL!,
                                          fit: BoxFit.cover,
                                          errorWidget: (context, url, error) =>
                                              DecoratedBox(
                                            decoration: BoxDecoration(
                                              color: AppColors.white
                                                  .withOpacity(.05),
                                            ),
                                          ),
                                        )
                                      : DecoratedBox(
                                          decoration: BoxDecoration(
                                            color: AppColors.white
                                                .withOpacity(.05),
                                            borderRadius: BorderRadius.circular(
                                                Dimens.radius),
                                          ),
                                        ),
                                ),
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        ColorManager()
                                            .getColorGradient05Start(),
                                        ColorManager().getColorGradient05End(),
                                      ],
                                    ),
                                  ),
                                ),
                                Center(
                                    child: SvgPicture.asset(
                                  "assets/icons/play.svg",
                                  width: 16,
                                  height: 20,
                                ))
                              ]),
                            )),
                        SizedBox(
                          width: insideMargin,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                data.title ?? '',
                                overflow: TextOverflow.ellipsis,
                                style: AppTextTheme.subtitle(
                                    color: ColorManager().getColorTextPrimary(),
                                    weight: FontWeight.bold),
                                maxLines: 2,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                data.shortDescription ?? '',
                                overflow: TextOverflow.ellipsis,
                                style: AppTextTheme.caption(
                                    color:
                                        ColorManager().getColorTextPrimary()),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                /* Removed, functionality is missing.
                Positioned(
                  top: 16,
                  right: 16,
                  child: SvgPicture.asset(
                    "assets/icons/cross_circled.svg",
                    height: 24,
                    width: 24,
                    colorFilter: ColorFilter.mode(
                        ColorManager().getColorSystemPrimary01(),
                        BlendMode.srcIn
                    ),
                  )
                ), */
                Positioned(
                  bottom: 16,
                  left: wPadding,
                  child: Container(
                    width: width - 2 * wPadding,
                    height: 4.0,
                    decoration: BoxDecoration(
                      color: ColorManager().getColorSystemPrimary01(),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(1),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: wPadding,
                  child: Container(
                    //offset: const Offset(0, 0),
                    //blurRadius: 4,
                    width: glowbarPos,
                    height: 4.0,
                    //glowColor: ColorManager().getColorSystemSecondary01(),
                    color: ColorManager().getColorSystemSecondary01(),
                    // borderRadius: const BorderRadius.all(
                    //   Radius.circular(1),
                    // ),
                  ),
                ),
                if (data.iconStatus != IconStatus.idle)
                  Positioned(top: 24, left: 0, child: _iconByCardStatus)
              ],
            )));
  }

  Widget get _iconByCardStatus {
    switch (data.iconStatus) {
      case IconStatus.mandatory:
        return StatusTag.svg(
          backgroundColor: ColorManager().getColorBorderAccent(),
          svgPath: IconStatus.mandatory.svgPath ?? '',
        );
      case IconStatus.completed:
        return StatusTag.svg(
          backgroundColor: ColorManager().getColorSystemSecondary02(),
          svgPath: IconStatus.completed.svgPath ?? '',
        );
      case IconStatus.expired:
        return StatusTag.svg(
          backgroundColor: ColorManager().getColorBackgroundWarning(),
          svgPath: IconStatus.expired.svgPath ?? '',
        );
      case IconStatus.suggestedAI:
        return StatusTag.svg(
          backgroundColor: ColorManager().getColorSystemSecondary02(),
          svgPath: IconStatus.suggestedAI.svgPath ?? '',
        );
      case IconStatus.suggestedHR:
        return StatusTag.svg(
          backgroundColor: ColorManager().getColorSystemSecondary02(),
          svgPath: IconStatus.suggestedHR.svgPath ?? '',
        );
      case IconStatus.idle:
      default:
        return const SizedBox();
    }
  }
}

class ContinueCardShimmer extends StatelessWidget {
  const ContinueCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 40;
    double imageWidth = width * 0.15;
    double wPadding = 20;
    double insideMargin = 8;

    return Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white.withOpacity(.2),
        ),
        child: Stack(
          children: [
            Padding(
                padding: EdgeInsets.only(
                    left: wPadding,
                    right: wPadding,
                    top: 0.8 * wPadding,
                    bottom: 1.5 * wPadding),
                child: Row(
                  children: [
                    Container(
                        width: imageWidth,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white.withOpacity(.5),
                        )),
                    SizedBox(
                      width: insideMargin,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.white.withOpacity(.5),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.white.withOpacity(.5),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
            Positioned(
              bottom: 16,
              left: wPadding,
              child: Container(
                  width: width - 2 * wPadding,
                  height: 4.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white.withOpacity(.5),
                  )),
            ),
          ],
        ));
  }
}
