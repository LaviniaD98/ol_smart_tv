import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/core/utils/utility.dart';
import 'package:open_learning_smart_tv/domain/entities/detail/detail_page_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/cards/topic_list.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_button.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/icon_text.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/tag/status_tag.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../theme/app_theme.dart';

class ForYouCard extends StatefulWidget {
  final LearningObjectModel data;
  final DetailPageModel? parentDetailPageModel;
  final String? parentId;
  final String? grandParentId;
  final bool enable;
  final bool isGridViewItem;
  final VoidCallback? returnFromDetailCallback;
  final void Function(bool)? onFocusChange;

  const ForYouCard({
    super.key,
    required this.data,
    this.parentDetailPageModel,
    this.parentId,
    this.grandParentId,
    this.enable = true,
    this.isGridViewItem = false,
    this.returnFromDetailCallback,
    this.onFocusChange,
  });

  @override
  State<ForYouCard> createState() => _ForYouCardState();
}

class _ForYouCardState extends State<ForYouCard> {
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
            margin: widget.isGridViewItem
                ? EdgeInsets.zero
                : const EdgeInsets.only(bottom: 10, right: 24, left: 5),
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
                            object: widget.data,
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
                          Row(
                            children: [
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      /// Type Label
                                      TextSpan(
                                        text: 'Digitale'.toUpperCase(),
                                        style: AppTextTheme.body(
                                          color: ColorManager()
                                              .getColorTextMandatory(),
                                          weight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' | ',
                                        style: AppTextTheme.body(
                                          color: ColorManager()
                                              .getColorTextPrimary(),
                                          weight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: widget.data.learningObjectType
                                            .getTranslatedValue()
                                            .toUpperCase(),
                                        style: AppTextTheme.body(
                                          color: ColorManager()
                                              .getColorTextPrimary(),
                                          weight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            (widget.data.title ?? 'No title').toUpperCase(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextTheme.body(
                              color: ColorManager().getColorTextPrimary(),
                              weight: FontWeight.bold,
                              size: 32,
                            ),
                          ),
                          if ((widget.data.topicTags ?? []).isNotEmpty) ...[
                            const SizedBox(height: 32),
                            TopicList(
                              widget.data.topicTags ?? [],
                              color: ColorManager()
                                  .getColorSystemSecondary05()
                                  .withOpacity(.6),
                            ),
                          ],
                          const SizedBox(height: 32),
                          // descrizione
                          Text(
                            widget.data.shortDescription ?? 'No description',
                            style: TextStyle(
                              color: ColorManager().getColorTextPrimary(),
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 32),
                          buildDurationTag(),
                          const Spacer(),
                          Row(
                            children: [
                              FocusTraversalOrder(
                                order: const NumericFocusOrder(0),
                                child: OLButton(
                                  debugLabel: 'START-BUTTON-0',
                                  title: 'Inizia',
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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

  Widget buildDurationTag() {
    if (widget.data.duration == null) {
      return const SizedBox.shrink();
    }

    return IconText(
      bkColor: ColorManager().getColorTextPrimary(),
      text: convertMinutesToHours(widget.data.duration ?? 0),
      textColor: ColorManager().getColorTextPrimary(),
      icon: Icons.watch_later_outlined,
      iconSize: 16,
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
