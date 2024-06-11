import 'package:open_learning_smart_tv/domain/entities/strip/calendar/smart_learning_slots_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../color_management/color_manager.dart';
import '../../../../../domain/entities/strip/row/strip_row.dart';
import '../../../../../domain/enums/types.dart';
import '../../../../../remote_theming/labels/labels_manager.dart';
import '../../../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../../../theme/app_theme.dart';
import '../../../../common/widgets/dialog/calendar/ol_calendar_dialog.dart';
import '../../../../common/widgets/dialog/ol_download_dialog.dart';
import '../../../../wall/wall_strip_content_page.dart';
import '../cubit/calendar_strip_cubit.dart';

class SmartLearningActivity extends StatelessWidget {
  static const _iconSize = 20.0;

  final SmartLearningSlotsModel model;
  final DateTime date;

  const SmartLearningActivity({
    super.key,
    required this.model,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final res = await context.pushNamed<bool?>(
          WallStripContentPage.routeName,
          extra: WallStripContentPageArgs(
            StripRow.smartLearning(
              id: model.id,
              title: LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.smart_learning_wall_title),
              apiPath:
                  '/learning-catalogue/{corporateId}/{initiativeId}/learnersSmartLearningObjects?startTime={startTime}&endTime={endTime}&pageNumber={pageNumber}&pageSize={pageSize}&topics=',
              preSelected: false,
              startTime: model.startTime,
              endTime: model.endTime,
            ),
          ),
        );

        if (context.mounted && res != null && res) {
          context.read<CalendarStripCubit>().refresh();
        }
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
              color: ColorManager().getColorSystemSecondary04(),
              width: 2,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox.square(
                  dimension: _iconSize,
                  child: SvgPicture.asset(
                    'assets/icons/creative_writing.svg',
                    width: _iconSize,
                    height: _iconSize,
                    colorFilter: ColorFilter.mode(
                        ColorManager().getColorSystemSecondary04(),
                        BlendMode.srcIn),
                  ),
                ),
                const SizedBox(width: Dimens.spacingS),
                Expanded(
                  child: Text(
                    LabelsManager()
                        .getRemoteStringFromLabelKeys(
                            RemoteLabelKeys.smart_learning_item_title)
                        .toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextTheme.caption(
                      weight: FontWeight.w700,
                      color: ColorManager().getColorSystemSecondary04(),
                    ),
                  ),
                ),
                if (model.startTime != null && model.endTime != null)
                  SizedBox.square(
                    dimension: _iconSize,
                    child: InkWell(
                      onTap: () async {
                        context.pushNamed(
                          OlCalendarDialog.routeName,
                          extra: OlCalendarDialogArgs(
                            type: AgendaEventType.eventSmartLearning,
                            smartLearningSlotsModel: model,
                          ),
                        );
                      },
                      child: SvgPicture.asset(
                        "assets/icons/download.svg",
                        colorFilter: ColorFilter.mode(
                            ColorManager().getColorSystemSecondary04(),
                            BlendMode.srcIn),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: Dimens.spacingXXS),
            Text(
              LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.smart_learning_item_subtitle),
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
                _getTime,
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
      ),
    );
  }

  String get _getTime {
    final dateFormat = DateFormat(DateFormat.HOUR24_MINUTE);
    return '${dateFormat.format(model.startTime!)}-${dateFormat.format(model.endTime!)}';
  }
}
