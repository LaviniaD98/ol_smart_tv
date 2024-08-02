import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/cards/topic_list.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_image.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/tag/duration_tag.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';

class ExploreCarouselItem extends StatefulWidget {
  const ExploreCarouselItem({
    super.key,
    required this.item,
  });

  final LearningObjectModel item;

  @override
  State<ExploreCarouselItem> createState() => _ExploreCarouselItemState();
}

class _ExploreCarouselItemState extends State<ExploreCarouselItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: OLColors.backgroundCard,
      child: Stack(
        children: [
          Positioned.fill(
            child: OLImage(
              imageURL: widget.item.coverPublicURL,
              cacheWidth: 100,
              height: 100,
              width: 100,
            ),
          ),
          // CachedNetworkImage(
          //   imageUrl: widget.item.coverPublicURL!,
          //   imageBuilder: (context, imageProvider) => Container(
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: imageProvider,
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //   ),
          //   errorWidget: (context, url, error) => DecoratedBox(
          //     decoration: BoxDecoration(
          //       color: AppColors.white.withOpacity(.05),
          //     ),
          //   ),
          // ),
          Container(
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.symmetric(vertical: 110, horizontal: 96),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimens.radius),
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [
                  ColorManager().getColorGradient05Start(),
                  ColorManager().getColorGradient05End(),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  widget.item.title ?? 'No title',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextTheme.body(
                    weight: FontWeight.w700,
                    size: 48,
                    color: ColorManager().getColorTextPrimary(),
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  widget.item.shortDescription ?? '',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextTheme.body(
                    weight: FontWeight.w500,
                    size: 24,
                    color: ColorManager().getColorTextPrimary(),
                  ),
                ),
                if ((widget.item.topicTags ?? []).isNotEmpty) ...[
                  const SizedBox(height: 40),
                  TopicList(
                    widget.item.topicTags ?? [],
                    color: ColorManager()
                        .getColorSystemSecondary05()
                        .withOpacity(.6),
                  ),
                ],
                _durationTag(),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _durationTag() {
    if (widget.item.duration == null) {
      return const SizedBox.shrink();
    }
    Color? color;
    if (widget.item.iconStatus == IconStatus.completed) {
      color = ColorManager().getColorBackgroundDisabled();
    }

    //print('widget.item: ${widget.item.expirationDate}');

    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: DurationTag.fromMinutes(
        widget.item.duration ?? 0,
        color: color,
        iconSize: 24,
        textOnly: true,
        textStyle: AppTextTheme.body(
          weight: FontWeight.w400,
          size: 15,
          color: ColorManager().getColorTextPrimary(),
        ),
      ),
    );
  }
}
