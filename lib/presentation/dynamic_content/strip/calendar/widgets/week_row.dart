import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/calendar/days_to_highlight_model.dart';
import 'package:flutter/material.dart';
import 'week_row_item.dart';
import 'package:collection/collection.dart';

class WeekRow extends StatelessWidget {
  final List<DaysToHighlightModel> highlighted;
  final DateTime date;
  final OnDayTap onTap;

  const WeekRow({
    super.key,
    required this.date,
    required this.highlighted,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: days.map(
        (e) {
          return Expanded(
            child: WeekRowItem(
              onTap: onTap,
              selected: date.isSameDate(e),
              date: e,
              type: _activityType(
                  highlighted.firstWhereOrNull((el) => el.day == e.day)),
            ),
          );
        },
      ).toList(),
    );
  }

  List<DateTime> get days {
    final firstDayOfWeek = date.subtract(Duration(days: date.weekday - 1));
    return List.generate(7, (index) => index)
        .map((value) => firstDayOfWeek.add(Duration(days: value)))
        .toList();
  }

  DayType _activityType(DaysToHighlightModel? highlighted) {
    if (highlighted != null) {
      if (highlighted.areThereMandatoryLO == true) {
        return DayType.mandatory;
      } else if (highlighted.areThereLiveLO == true) {
        return DayType.live;
      } else if (highlighted.areThereSmartSlots == true) {
        return DayType.smart;
      }
    }
    return DayType.empty;
  }
}
