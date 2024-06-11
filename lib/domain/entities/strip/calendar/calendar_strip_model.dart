import 'package:open_learning_smart_tv/data/models/responses/strip/wrapper/calendar_strip_dto.dart';

import '../learning_object/learning_object_model.dart';
import 'activity/calendar_activity.dart';
import 'days_to_highlight_model.dart';
import 'smart_learning_slots_model.dart';

class CalendarStripModel {
  CalendarStripModel({
    required this.activities,
    required this.daysToHighlight,
  });

  factory CalendarStripModel.fromDto(CalendarStripDto dto) {
    final learningObjects = dto.learningObjects?.map((e) {
          final model = LearningObjectModel.fromDto(e);
          final startTime = _timeFormat(model.startTime);
          final startDate = model.startDate?.add(
              Duration(hours: startTime?.$1 ?? 0, minutes: startTime?.$2 ?? 0));
          return CalendarActivity.learningObject(date: startDate, model: model);
        }).toList() ??
        [];

    final smartLearningSlots = dto.smartLearningSlots?.map((e) {
          final model = SmartLearningSlotsModel.fromDto(e);
          return CalendarActivity.smartLearningObject(
              date: model.startTime, model: model);
        }).toList() ??
        [];
    final activities = [...learningObjects, ...smartLearningSlots];
    return CalendarStripModel(
      activities: activities
        ..sort((a, b) {
          if (a.date == null && b.date == null) {
            return 0;
          } else if (b.date == null) {
            return 1;
          } else if (a.date == null) {
            return -1;
          } else {
            return a.date!.compareTo(b.date!);
          }
        }),
      daysToHighlight: dto.daysToHighlight
              ?.map((e) => DaysToHighlightModel.fromDto(e))
              .toList() ??
          [],
    );
  }

  final List<CalendarActivity> activities;
  final List<DaysToHighlightModel> daysToHighlight;

  static (int, int)? _timeFormat(String? value) {
    if (value == null) return null;
    final hours = value.split(':').first;
    final minutes = value.split(':').last;
    return (int.parse(hours), int.parse(minutes));
  }
}
