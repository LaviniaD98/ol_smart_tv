import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:open_learning_smart_tv/core/utils/nav.dart';

import '../../../../../color_management/color_manager.dart';
import '../../../../../domain/entities/detail/detail_page_model.dart';
import '../../../../../domain/entities/strip/learning_object/learning_object_model.dart';
import '../../../../../domain/enums/types.dart';
import '../../../../../theme/app_theme.dart';
import '../../../../course_detail/detail_page.dart';
import '../../tag/duration_tag.dart';
import '../../tag/status_tag.dart';

class LearningCardWall extends StatelessWidget {
  final LearningObjectModel data;
  final LearningCardWallType type;
  final DetailPageModel? parentModel;
  final VoidCallback? onRemove;
  final String? parentId;
  final String? grandParentId;

  const LearningCardWall(
    this.data, {
    super.key,
    this.onRemove,
    this.parentId,
    this.grandParentId,
    this.parentModel,
    this.type = LearningCardWallType.standard,
  }) : assert(
          (type != LearningCardWallType.favourite && onRemove == null) ||
              (type == LearningCardWallType.favourite && onRemove != null),
          'Favourite card need to onRemove method',
        );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Nav.push(
          context,
          screen: DetailPage(
            args: DetailPageArgs(
              id: data.id.toString(),
              typology: data.learningObjectTypology,
              parent: parentModel,
              parentId: parentId ?? data.parentId?.toString(),
              grandParentId: grandParentId ?? data.grandParentId?.toString(),
            ),
          ),
        );
      },
      child: SizedBox(
        height: (MediaQuery.of(context).size.width * .32) *
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
                      child: CachedNetworkImage(
                        imageUrl: data.coverPublicURL ?? '',
                        fit: BoxFit.cover,
                        height: double.infinity,
                        errorWidget: (context, url, error) => Container(
                            color: AppColors.white.withValues(alpha: .05)),
                      ),
                    ),
                  ),
                  const SizedBox(width: Dimens.spacingL),
                  Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: RichText(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: data.learningObjectType
                                          .getTranslatedValue()
                                          .toUpperCase(),
                                      style: AppTextTheme.caption(
                                        weight: FontWeight.w700,
                                        color: ColorManager()
                                            .getColorTextMandatory(),
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' | ',
                                      style: AppTextTheme.caption(
                                          weight: FontWeight.w700,
                                          color: ColorManager()
                                              .getColorTextPrimary()),
                                    ),
                                    TextSpan(
                                      text: data.learningObjectTypology
                                          .getTranslatedValue()
                                          .toUpperCase(),
                                      style: AppTextTheme.caption(
                                          weight: FontWeight.w700,
                                          color: ColorManager()
                                              .getColorTextPrimary()),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: Dimens.spacingM),
                            if (data.duration != null) _durationTag(),
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
                                    data.title ?? 'No title',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextTheme.subtitle(
                                        weight: FontWeight.w700,
                                        color: ColorManager()
                                            .getColorTextPrimary()),
                                  ),
                                  const SizedBox(height: Dimens.spacingXXS),
                                  Text(
                                    data.shortDescription ?? '',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextTheme.caption(
                                        color: ColorManager()
                                            .getColorTextPrimary()),
                                  ),
                                ],
                              ),
                            ),
                            if (type == LearningCardWallType.favourite) ...[
                              const SizedBox(width: Dimens.spacingM),
                              InkWell(
                                onTap: onRemove,
                                child: SvgPicture.asset(
                                    "assets/icons/favourites.svg",
                                    width: 24,
                                    height: 24,
                                    colorFilter: ColorFilter.mode(
                                        ColorManager()
                                            .getColorBackgroundPrimaryCta(),
                                        BlendMode.srcIn)),
                              ),
                            ],
                          ],
                        ),
                      ],
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

  Widget _durationTag() {
    Color? color;
    if (data.iconStatus == IconStatus.completed) {
      color = ColorManager().getColorBackgroundDisabled();
    }
    return DurationTag.fromMinutes(
      data.duration!,
      color: color,
      collapseDisplay: true,
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

enum LearningCardWallType { standard, favourite }
