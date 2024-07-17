import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../color_management/color_manager.dart';
import '../../../../../theme/app_theme.dart';
import '../../../../common/widgets/dialog/calendar/ol_calendar_dialog.dart';

class LearningObjectActivity extends StatelessWidget {
  final LearningObjectModel model;
  final DateTime date;

  const LearningObjectActivity({
    super.key,
    required this.model,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          context.pushNamed(DetailPage.routeName,
              extra: DetailPageArgs(
                id: model.id.toString(),
                object: model,
                typology: model.learningObjectTypology,
                parentId: model.parentId?.toString(),
                grandParentId: model.grandParentId?.toString(),
              ));
        },
        child: Container(
          padding: const EdgeInsets.all(Dimens.spacingS),
          constraints: const BoxConstraints(
            minHeight: Dimens.calendarActivityItem,
            maxHeight: Dimens.calendarActivityItem,
          ),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: _getColor(model, date),
                width: 2,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                            text: model.learningObjectTypology
                                .getTranslatedValue()
                                .toUpperCase(),
                            style: AppTextTheme.caption(
                              weight: FontWeight.w700,
                              color: _getColor(model, date),
                            ),
                          ),
                          TextSpan(
                            text: ' | ',
                            style:
                                AppTextTheme.caption(weight: FontWeight.w700),
                          ),
                          TextSpan(
                            text: model.learningObjectType
                                .getTranslatedValue()
                                .toUpperCase(),
                            style:
                                AppTextTheme.caption(weight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox.square(
                    dimension: 20,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          context.pushNamed(
                            OlCalendarDialog.routeName,
                            extra: OlCalendarDialogArgs(
                              type: AgendaEventType.eventLearningObject,
                              learningObjectModel: model,
                              date: date,
                            ),
                          );
                        },
                        child: SvgPicture.asset(
                          "assets/icons/download.svg",
                          colorFilter: ColorFilter.mode(
                              _getColor(model, date), BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Dimens.spacingXXS),
              Text(
                model.title ?? 'No Title',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextTheme.caption(
                  color: ColorManager().getColorTextPrimary(),
                  weight: FontWeight.w500,
                ),
              ),
              if (model.startTime != null && model.endTime != null) ...[
                const SizedBox(height: Dimens.spacingXXS),
                Text(
                  '${model.startTime!} - ${model.endTime!}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextTheme.caption(
                    color: ColorManager().getColorTextPrimary(),
                    weight: FontWeight.w400,
                  ),
                ),
              ],
            ],
          ),
        ));
  }

  Color _getColor(LearningObjectModel data, DateTime date) {
    if (data.isMandatory != null &&
        data.isMandatory! &&
        (data.learningObjectType == LearningObjectType.async ||
            data.learningObjectType == LearningObjectType.async) &&
        data.expirationDate != null &&
        data.expirationDate!.isSameDate(date)) {
      return ColorManager().getColorTextWarning();
    }
    return ColorManager().getColorSystemSecondary01();
  }
}
