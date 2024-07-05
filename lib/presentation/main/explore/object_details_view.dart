import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/tag/duration_tag.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/widgets/image/faded_banner_image.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';

class ObjectDetailsView extends StatelessWidget {
  const ObjectDetailsView({super.key, this.value});

  final LearningObjectModel? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 411,
      color: OLColors.backgroundPrimary,
      child: value != null
          ? Stack(
              fit: StackFit.expand,
              children: [
                Row(
                  children: [
                    Expanded(child: Container()),
                    Expanded(
                      child: FadedBannerImage(urlImage: value!.coverPublicURL!),
                    ),
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 110, horizontal: 96),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        value!.title ?? 'No title',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextTheme.body(
                          weight: FontWeight.w700,
                          size: 32,
                          color: ColorManager().getColorTextPrimary(),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        value!.shortDescription ?? '',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextTheme.body(
                          weight: FontWeight.w500,
                          size: 20,
                          color: ColorManager().getColorTextPrimary(),
                        ),
                      ),
                      // if ((value!.topicTags ?? []).isNotEmpty) ...[
                      //   const SizedBox(height: 40),
                      //   TopicList(
                      //     value!.topicTags ?? [],
                      //     color: ColorManager()
                      //         .getColorSystemSecondary05()
                      //         .withOpacity(.6),
                      //   ),
                      // ],
                      // _durationTag(value!),
                      // const SizedBox(height: 8),
                    ],
                  ),
                ),
              ],
            )
          : const SizedBox.shrink(),
    );
  }

  Widget _durationTag(LearningObjectModel value) {
    if (value.duration == null) {
      return const SizedBox.shrink();
    }
    Color? color;
    if (value.iconStatus == IconStatus.completed) {
      color = ColorManager().getColorBackgroundDisabled();
    }

    //print('value: ${value.expirationDate}');

    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: DurationTag.fromMinutes(
        value.duration ?? 0,
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
