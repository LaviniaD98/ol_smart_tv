import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
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
import 'package:open_learning_smart_tv/presentation/course_detail/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/widgets/image/faded_banner_image.dart';

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
  late FocusScopeNode focusNode;

  @override
  void initState() {
    super.initState();

    focusNode = FocusScopeNode(debugLabel: '${widget.grandParentId} ----- 1');
  }

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      node: focusNode,
      onFocusChange: (value) {
        widget.onFocusChange?.call(value);
        setState(() {});
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
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
                        grandParentId: widget.grandParentId?.isNotEmpty == true
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 140),
                  child: FadedBannerImage(
                    urlImage: widget.data.coverPublicURL,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: Dimens.hViewPadding,
                    right: Dimens.hViewPadding,
                    bottom: 100,
                    top: 80,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      iconByCardStatus(),
                      const SizedBox(height: 6),
                      Text(
                        (widget.data.title ?? 'No title').toUpperCase(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextTheme.body(
                          color: ColorManager().getColorTextPrimary(),
                          weight: FontWeight.bold,
                          size: 56,
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
                        widget.data.shortDescription ?? '',
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
    );
  }

  Color getBorderFocusColor() {
    if (widget.data.iconStatus != IconStatus.idle) {
      return widget.data.iconStatus.color;
    }

    return OLColors.textPrimary;
  }

  Widget buildDurationTag() {
    return Row(
      children: [
        if (widget.data.duration != null) ...[
          IconText(
            bkColor: ColorManager().getColorTextPrimary(),
            text: convertMinutesToHours(widget.data.duration ?? 0),
            textColor: ColorManager().getColorTextPrimary(),
            image: 'assets/icons/clock.svg',
            iconSize: 24,
          ),
          const SizedBox(width: 24),
        ],
        if (widget.data.expirationDate != null) ...[
          IconText(
            bkColor: ColorManager().getColorTextPrimary(),
            text: DateFormat('dd/MM/yyyy').format(widget.data.expirationDate!),
            textColor: ColorManager().getColorTextPrimary(),
            image: 'assets/icons/calendar.svg',
            iconSize: 24,
          ),
          const SizedBox(width: 24),
        ],
      ],
    );
  }

  Widget iconByCardStatus() {
    if (widget.data.iconStatus == IconStatus.idle) {
      return const SizedBox.shrink();
    }
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
          decoration: BoxDecoration(
            color: widget.data.iconStatus.color,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(4),
              bottomRight: Radius.circular(4),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                SvgPicture.asset(
                  widget.data.iconStatus.svgPath!,
                  height: 18,
                  width: 18,
                  colorFilter: ColorFilter.mode(
                    ColorManager().getColorBackgroundPrimary(),
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  widget.data.iconStatus.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextTheme.caption(
                    weight: FontWeight.w500,
                    color: ColorManager().getColorBackgroundPrimary(),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        RichText(
          text: TextSpan(
            children: [
              /// Type Label
              TextSpan(
                text: 'Digitale'.toUpperCase(),
                style: AppTextTheme.body(
                  color: ColorManager().getColorTextMandatory(),
                  weight: FontWeight.bold,
                  size: 20,
                ),
              ),
              TextSpan(
                text: ' | ',
                style: AppTextTheme.body(
                  color: ColorManager().getColorTextPrimary(),
                  weight: FontWeight.bold,
                  size: 20,
                ),
              ),
              TextSpan(
                text: widget.data.learningObjectType
                    .getTranslatedValue()
                    .toUpperCase(),
                style: AppTextTheme.body(
                  color: ColorManager().getColorTextPrimary(),
                  weight: FontWeight.bold,
                  size: 20,
                ),
              ),
            ],
          ),
          maxLines: 1,
        ),
      ],
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
