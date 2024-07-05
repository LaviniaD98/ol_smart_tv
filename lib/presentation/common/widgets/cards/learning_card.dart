import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
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

class LearningCard extends StatefulWidget {
  final LearningObjectModel data;
  final DetailPageModel? parentDetailPageModel;
  final String? parentId;
  final String? grandParentId;
  final bool enable;
  final VoidCallback? returnFromDetailCallback;
  final void Function(bool)? onFocusChange;

  const LearningCard({
    super.key,
    required this.data,
    this.parentDetailPageModel,
    this.parentId,
    this.grandParentId,
    this.enable = true,
    this.returnFromDetailCallback,
    this.onFocusChange,
  });

  @override
  State<LearningCard> createState() => _LearningCardState();
}

class _LearningCardState extends State<LearningCard> {
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode(debugLabel: '${widget.grandParentId} ----- 1');
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: focusNode,
      onFocusChange: (value) {
        widget.onFocusChange?.call(value);
        setState(() {});
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10, right: 24, left: 5),
            clipBehavior: Clip.none,
            decoration: BoxDecoration(
              color: OLColors.backgroundCard,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: focusNode.hasFocus
                    ? getBorderFocusColor()
                    : OLColors.border,
                width: focusNode.hasFocus ? 5 : 1,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: widget.enable
                  ? () async {
                      await context.pushNamed(DetailPage.routeName,
                          extra: DetailPageArgs(
                            id: widget.data.id.toString(),
                            typology: widget.data.learningObjectTypology,
                            parentId: widget.parentId?.isNotEmpty == true
                                ? widget.parentId
                                : widget.data.parentId?.toString(),
                            grandParentId:
                                widget.grandParentId?.isNotEmpty == true
                                    ? widget.grandParentId
                                    : widget.data.grandParentId?.toString(),
                            parent: widget.parentDetailPageModel,
                          ));
                      if (context.mounted &&
                          widget.returnFromDetailCallback != null) {
                        widget.returnFromDetailCallback?.call();
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
                          const Spacer(),
                          ((widget.data.isTest == null ||
                                      widget.data.isSurvey == null) ||
                                  (widget.data.isTest == false &&
                                      widget.data.isSurvey == false))
                              ? RichText(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: widget.data.learningObjectType
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
                                        text: widget.data.learningObjectTypology
                                            .getTranslatedValue()
                                            .toUpperCase(),
                                        style: AppTextTheme.caption(
                                            weight: FontWeight.w700,
                                            color: ColorManager()
                                                .getColorTextPrimary()),
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
                                        widget.data.isTest == true
                                            ? "assets/icons/test_survey.svg"
                                            : "assets/icons/survey.svg",
                                      ),
                                    ),
                                    RichText(
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: widget.data.isTest == true
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
                          const SizedBox(height: 8),
                          Text(
                            widget.data.title ?? 'No title',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextTheme.body(
                                weight: FontWeight.w700,
                                size: 24,
                                color: ColorManager().getColorTextPrimary()),
                          ),
                          if ((widget.data.topicTags ?? []).isNotEmpty) ...[
                            const SizedBox(height: 8),
                            TopicList(
                              widget.data.topicTags ?? [],
                              color: ColorManager()
                                  .getColorSystemSecondary05()
                                  .withOpacity(.6),
                            ),
                          ],
                        ],
                      ),
                    ),
                    Positioned(
                      top: 16,
                      right: 24,
                      child: _durationTag(),
                    )
                  ],
                ),
              ),
            ),
          ),
          if (widget.data.iconStatus != IconStatus.idle) ...[
            Positioned(
              top: 22,
              left: 0,
              child: iconByCardStatus(),
            ),
          ],
        ],
      ),
    );
  }

  Color getBorderFocusColor() {
    if (widget.data.iconStatus != IconStatus.idle) {
      return widget.data.iconStatus.color;
    }

    return OLColors.textPrimary;
  }

  Widget _durationTag() {
    if (widget.data.duration == null) {
      return const SizedBox.shrink();
    }
    Color? color;
    if (widget.data.iconStatus == IconStatus.completed) {
      color = ColorManager().getColorBackgroundDisabled();
    }
    return Align(
      alignment: Alignment.topRight,
      child: DurationTag.fromMinutes(widget.data.duration ?? 0, color: color),
    );
  }

  Widget get _backgroundImage {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: OLColors.backgroundCard,
        borderRadius: BorderRadius.circular(12),
      ),
      child: widget.data.coverPublicURL != null &&
              widget.data.coverPublicURL!.isNotEmpty
          ? CachedNetworkImage(
              imageUrl: widget.data.coverPublicURL!,
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
    );
  }

  Border? get _borderForeground {
    double width = 1.0;
    switch (widget.data.iconStatus) {
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
      backgroundColor: widget.data.iconStatus.color,
      svgPath: widget.data.iconStatus.svgPath!,
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
        clipBehavior: Clip.none,
        margin: const EdgeInsets.only(bottom: 10, right: 24, left: 5),
        padding: const EdgeInsets.fromLTRB(24.0, 8.0, 16.0, 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white.withOpacity(.2),
          border: Border.all(
            color: OLColors.border,
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
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
