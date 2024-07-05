import 'package:flutter/material.dart';

import '../../../../../domain/entities/strip/calendar/activity/calendar_activity.dart';
import '../../../../../theme/app_theme.dart';
import 'learning_object_activity.dart';
import 'smart_learning_activity.dart';

class GridActivities extends StatelessWidget {
  final DateTime date;
  final List<CalendarActivity> items;
  const GridActivities({
    super.key,
    required this.date,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _gridHeight,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        itemCount: items.length,
        semanticChildCount: items.length ~/ 2,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: items.length > 1 ? 2 : 1,
          mainAxisExtent: Dimens.calendarActivityItem,
          mainAxisSpacing: Dimens.spacingM,
        ),
        itemBuilder: (context, index) {
          return items[index].map(
            learningObject: (e) => LearningObjectActivity(
            model: e.model,
              date: date,
            ),
            smartLearningObject: (e) => SmartLearningActivity(
              model: e.model,
              date: date,
            ),
          );
        },
      ),
    );
  }

  double get _gridHeight => (Dimens.calendarActivityItem * (items.length/2).round()) + ((items.length/2).round() * Dimens.spacingM);
}
