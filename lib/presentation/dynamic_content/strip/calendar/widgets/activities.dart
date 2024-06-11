import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../color_management/color_manager.dart';
import '../../../../../domain/entities/strip/calendar/activity/calendar_activity.dart';
import '../../../../../remote_theming/labels/labels_manager.dart';
import '../../../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../../../theme/app_theme.dart';
import 'activity_item_alert.dart';
import 'grid_activities.dart';

class Activities extends StatefulWidget {
  final List<CalendarActivity> items;
  final bool hasError;
  final DateTime date;

  const Activities({
    super.key,
    required this.items,
    required this.date,
    required this.hasError,
  });

  @override
  State<Activities> createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  late List<CalendarActivity> elements = widget.items;
  bool expanded = false;

  @override
  void initState() {
    if (widget.items.length > 2) {
      elements = widget.items.sublist(0, 2);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                _getDayLabel,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextTheme.caption(
                  color: ColorManager().getColorTextPrimary(),
                ),
              ),
            ),
            const SizedBox(width: Dimens.spacingM),
            if (widget.items.length > 2)
              InkWell(
                onTap: () {
                  setState(() {
                    if (expanded) {
                      elements = widget.items.sublist(0, 2);
                    } else {
                      elements = widget.items;
                    }
                    expanded = !expanded;
                  });
                },
                child: Text(
                  expanded
                      ? LabelsManager().getRemoteStringFromLabelKeys(
                          RemoteLabelKeys.show_less)
                      : '${LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.show_all)} (+${widget.items.length - 2})',
                  style: AppTextTheme.caption(
                    color: ColorManager().getColorTextPrimaryCta(),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: Dimens.spacingL),
        _contentHandler,
      ],
    );
  }

  Widget get _contentHandler {
    if (widget.hasError) {
      return ActivityItemAlert(
        color: ColorManager().getColorTextError(),
        message: LabelsManager()
            .getRemoteStringFromLabelKeys(RemoteLabelKeys.error_occurred),
      );
    } else if (widget.items.isEmpty) {
      return ActivityItemAlert(
        color: ColorManager().getColorTextPrimary(),
        message: LabelsManager()
            .getRemoteStringFromLabelKeys(RemoteLabelKeys.no_scheduled_event),
      );
    } else {
      return GridActivities(
        items: elements,
        date: widget.date,
      );
    }
  }

  /// Label day
  String get _getDayLabel {
    if (widget.date.day == DateTime.now().day) {
      return LabelsManager()
          .getRemoteStringFromLabelKeys(RemoteLabelKeys.today);
    }
    return DateFormat(DateFormat.MONTH_WEEKDAY_DAY)
        .format(widget.date)
        .capitalize;
  }
}
