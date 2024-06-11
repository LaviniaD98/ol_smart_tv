import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../smart_learning_slots_model.dart';
part 'calendar_activity.freezed.dart';

@freezed
class CalendarActivity with _$CalendarActivity {
  const factory CalendarActivity.learningObject({
    DateTime? date,
    DateTime? endDate,
    required LearningObjectModel model,
  }) = ActivityLearningObject;
  const factory CalendarActivity.smartLearningObject({
    DateTime? date,
    required SmartLearningSlotsModel model,
  }) = ActivitySmartLearningObject;
}
