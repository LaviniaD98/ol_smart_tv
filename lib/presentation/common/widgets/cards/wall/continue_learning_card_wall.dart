import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_learning_smart_tv/core/utils/nav.dart';

import '../../../../../domain/entities/strip/learning_object/learning_object_model.dart';
import '../../../../../domain/enums/types.dart';
import '../../../../../theme/app_theme.dart';
import '../../../../course_detail/detail_page.dart';
import '../../glow_progress_bar/glow_progress_bar.dart';
import '../../tag/status_tag.dart';

class ContinueLearningCardWall extends StatelessWidget {
  final LearningObjectModel data;
  const ContinueLearningCardWall(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Nav.push(
          context,
          screen: DetailPage(
            args: DetailPageArgs(
              id: data.id.toString(),
              typology: data.learningObjectTypology,
              parentId: data.parentId?.toString(),
              grandParentId: data.grandParentId?.toString(),
            ),
          ),
        );
      },
      child: SizedBox(
        height: (MediaQuery.of(context).size.width * .3) *
            MediaQuery.of(context).textScaleFactor,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(Dimens.radius),
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: data.coverPublicURL ?? '',
                            fit: BoxFit.cover,
                            height: double.infinity,
                            errorWidget: (context, url, error) => Container(
                                color: AppColors.white.withOpacity(.05)),
                          ),
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    stops: const [
                                  .5,
                                  1
                                ],
                                    colors: [
                                  AppColors.primaryFaded.withOpacity(.8),
                                  AppColors.primaryFaded.withOpacity(.0),
                                ])),
                            child: SvgPicture.asset(
                              "assets/icons/play.svg",
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: Dimens.spacingL),
                  Expanded(
                    flex: 7,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: Dimens.spacingXS),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  data.title ?? 'No title',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextTheme.subtitle(
                                      weight: FontWeight.w700),
                                ),
                              ),

                              /// Waiting for release
                              // const SizedBox(width: Dimens.spacingM),
                              // InkWell(
                              //   onTap: () {
                              //   //TODO
                              //   },
                              //   child: SvgPicture.asset(
                              //     "assets/icons/cross_circled.svg",
                              //     height: 24,
                              //     width: 24,
                              //     colorFilter: ColorFilter.mode(
                              //         ColorManager().getColorSystemPrimary01(),
                              //         BlendMode.srcIn
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                          const SizedBox(height: Dimens.spacingXXS),
                          const Spacer(),
                          Text(
                            data.shortDescription ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextTheme.caption(),
                          ),
                          const SizedBox(height: Dimens.spacingM),
                          GlowProgressBar(
                              percentage: double.tryParse(
                                      (data.percentageOfCompletion ?? '0.0')
                                          .replaceAll('%', '')) ??
                                  0.0),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            if (data.iconStatus != IconStatus.idle)
              Positioned(
                top: 8,
                left: 0,
                child: _iconByCardStatus,
              ),
          ],
        ),
      ),
    );
  }

  Widget get _iconByCardStatus {
    switch (data.iconStatus) {
      case IconStatus.mandatory:
      case IconStatus.completed:
      case IconStatus.expired:
      case IconStatus.suggestedAI:
      case IconStatus.suggestedHR:
        return StatusTag.svg(
          backgroundColor: data.iconStatus.color,
          svgPath: data.iconStatus.svgPath ?? '',
        );
      case IconStatus.idle:
        return const SizedBox();
    }
  }
}
