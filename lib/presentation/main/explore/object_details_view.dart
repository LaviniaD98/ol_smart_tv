import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_prograss_bar.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/icon_text.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/tag/duration_tag.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/common/course_logic.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/widgets/image/faded_banner_image.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';

class ObjectDetailsView extends StatelessWidget {
  const ObjectDetailsView({super.key, this.value});

  final LearningObjectModel? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 421,
      color: OLColors.backgroundPrimary,
      child: value != null
          ? Stack(
              fit: StackFit.expand,
              children: [
                Row(
                  children: [
                    Expanded(child: Container()),
                    SizedBox(
                      width: 1200,
                      child: FadedBannerImage(
                        key: ValueKey(
                            value?.videoPublicURL ?? value?.coverPublicURL),
                        urlImage: value?.coverPublicURL,
                        urlVideo: value?.videoPublicURL,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 710,
                    padding: const EdgeInsets.only(
                      top: 80,
                      bottom: 60,
                      left: Dimens.hViewPadding,
                      right: Dimens.hViewPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        iconByCardStatus(),
                        const SizedBox(height: 20),
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
                        const SizedBox(height: 16),
                        Text(
                          value!.shortDescription ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextTheme.body(
                            weight: FontWeight.w500,
                            size: 20,
                            color: ColorManager().getColorTextPrimary(),
                          ),
                        ),
                        const SizedBox(height: 18),
                        const Spacer(),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Builder(
                            builder: (context) {
                              final percentage = CourseLogic()
                                  .getCompletionPercentageFromString(
                                value?.percentageOfCompletion,
                              );
                              return OlProgressBar(
                                percentage: percentage,
                                width: 530,
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: Row(
                            children: [
                              _durationTag(value!),
                              if (value?.expirationDate != null &&
                                  value?.expirationDate?.year != 9999) ...[
                                IconText(
                                  bkColor: ColorManager().getColorTextPrimary(),
                                  text:
                                      'Scadenza: ${DateFormat('dd/MM/yyyy').format(value!.expirationDate!)}',
                                  textColor:
                                      ColorManager().getColorTextPrimary(),
                                  image: 'assets/icons/calendar.svg',
                                  iconSize: 24,
                                  textStyle: AppTextTheme.body(
                                    weight: FontWeight.w400,
                                    size: 15,
                                    color: ColorManager().getColorTextPrimary(),
                                  ),
                                ),
                                const SizedBox(width: 24),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
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
      padding: const EdgeInsets.only(right: 24),
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

  Widget iconByCardStatus() {
    if (value?.iconStatus == IconStatus.idle) {
      return const SizedBox.shrink();
    }
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
          decoration: BoxDecoration(
            color: value?.iconStatus.color,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(4),
              bottomRight: Radius.circular(4),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                if (value?.iconStatus.svgPath != null) ...[
                  SvgPicture.asset(
                    value!.iconStatus.svgPath!,
                    height: 18,
                    width: 18,
                    colorFilter: ColorFilter.mode(
                      ColorManager().getColorBackgroundPrimary(),
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
                Text(
                  value?.iconStatus.name ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextTheme.caption(
                    weight: FontWeight.w500,
                    size: 20,
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
                text: value?.learningObjectType
                    .getTranslatedValue()
                    .toUpperCase(),
                style: AppTextTheme.body(
                  color: value?.iconStatus.color,
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
                text: value?.learningObjectTypology
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
