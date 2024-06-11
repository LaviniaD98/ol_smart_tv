import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/domain/entities/detail/detail_page_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/cards/topic_list.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../remote_theming/labels/labels_manager.dart';
import '../../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../../theme/app_theme.dart';
import '../tag/status_tag.dart';
import '../tag/duration_tag.dart';

class LearningCard extends StatelessWidget {
  final LearningObjectModel data;
  final DetailPageModel? parentDetailPageModel;
  final String? parentId;
  final String? grandParentId;
  final bool enable;
  final VoidCallback? returnFromDetailCallback;

  const LearningCard({
    super.key,
    required this.data,
    this.parentDetailPageModel,
    this.parentId,
    this.grandParentId,
    this.enable = true,
    this.returnFromDetailCallback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: enable
          ? () async {
              await context.pushNamed(DetailPage.routeName,
                  extra: DetailPageArgs(
                    id: data.id.toString(),
                    typology: data.learningObjectTypology,
                    parentId: parentId?.isNotEmpty == true
                        ? parentId
                        : data.parentId?.toString(),
                    grandParentId: grandParentId?.isNotEmpty == true
                        ? grandParentId
                        : data.grandParentId?.toString(),
                    parent: parentDetailPageModel,
                  ));
              if (context.mounted && returnFromDetailCallback != null) {
                returnFromDetailCallback?.call();
              }
            }
          : null,
      child: AspectRatio(
        aspectRatio: Dimens.learningCardRatio,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _backgroundImage,
            Container(
              margin: const EdgeInsets.only(left: Dimens.spacingXS),
              child: Container(
                clipBehavior: Clip.hardEdge,
                padding: const EdgeInsets.fromLTRB(Dimens.spacingXL,
                    Dimens.spacingXS, Dimens.spacingM, Dimens.spacingM),
                decoration: BoxDecoration(
                  border: _borderForeground,
                  borderRadius: BorderRadius.circular(Dimens.radius),
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
                    data.duration != null ? _durationTag() : const SizedBox(),
                    const Spacer(),
                    ((data.isTest == null || data.isSurvey == null) ||
                            (data.isTest == false && data.isSurvey == false))
                        ? RichText(
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
                                    color:
                                        ColorManager().getColorTextMandatory(),
                                  ),
                                ),
                                TextSpan(
                                  text: ' | ',
                                  style: AppTextTheme.caption(
                                      weight: FontWeight.w700,
                                      color:
                                          ColorManager().getColorTextPrimary()),
                                ),
                                TextSpan(
                                  text: data.learningObjectTypology
                                      .getTranslatedValue()
                                      .toUpperCase(),
                                  style: AppTextTheme.caption(
                                      weight: FontWeight.w700,
                                      color:
                                          ColorManager().getColorTextPrimary()),
                                ),
                              ],
                            ),
                          )
                        : Row(
                            children: [
                              SizedBox(
                                  width: 24.0,
                                  height: 24.0,
                                  child: SvgPicture.asset(
                                    data.isTest == true
                                        ? "assets/icons/test_survey.svg"
                                        : "assets/icons/survey.svg",
                                    //colorFilter: ColorFilter.mode(ColorManager().getColorTextPrimary(), BlendMode.srcIn),
                                  )),
                              RichText(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: data.isTest == true
                                          ? LabelsManager()
                                              .getRemoteStringFromLabelKeys(
                                                  RemoteLabelKeys.test)
                                          : LabelsManager()
                                              .getRemoteStringFromLabelKeys(
                                                  RemoteLabelKeys.survey),
                                      style: AppTextTheme.caption(
                                        weight: FontWeight.w700,
                                        color: ColorManager()
                                            .getColorSystemSecondary01(),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                    Text(
                      data.title ?? 'No title',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextTheme.body(
                          weight: FontWeight.w700,
                          color: ColorManager().getColorTextPrimary()),
                    ),
                    if (data.topicTags != null && data.topicTags!.isNotEmpty)
                      TopicList(
                        data.topicTags!,
                        color: ColorManager()
                            .getColorSystemSecondary05()
                            .withOpacity(.6),
                      ),
                  ],
                ),
              ),
            ),
            if (data.iconStatus != IconStatus.idle)
              Positioned(
                top: 8,
                left: 0,
                child: iconByCardStatus(),
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
    return Align(
      alignment: Alignment.topRight,
      child: DurationTag.fromMinutes(data.duration ?? 0, color: color),
    );
  }

  Widget get _backgroundImage {
    return Container(
      padding: const EdgeInsets.only(left: Dimens.spacingXS),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimens.radius),
        child: data.coverPublicURL != null && data.coverPublicURL!.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: data.coverPublicURL!,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(.05),
                  ),
                ),
              )
            : DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(.05),
                ),
              ),
      ),
    );
  }

  Border? get _borderForeground {
    double width = 1.0;
    switch (data.iconStatus) {
      case IconStatus.mandatory:
        return Border.all(
          width: width,
          color: ColorManager().getColorBorderAccent(),
        );
      case IconStatus.completed:
        return Border.all(
          width: width,
          color: ColorManager().getColorBorderSecondaryComplete(),
        );
      case IconStatus.expired:
        return Border.all(
          width: width,
          color: ColorManager().getColorBorderWarning(),
        );
      case IconStatus.suggestedAI:
      case IconStatus.suggestedHR:
        return Border.all(
          width: width,
          color: ColorManager().getColorBorderSecondaryComplete(),
        );
      case IconStatus.idle:
      default:
        return null;
    }
  }

  Widget iconByCardStatus() {
    return StatusTag.svg(
      backgroundColor: data.iconStatus.color,
      svgPath: data.iconStatus.svgPath!,
    );
  }
}

class LearningCardShimmer extends StatelessWidget {
  const LearningCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
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
    );
  }
}
