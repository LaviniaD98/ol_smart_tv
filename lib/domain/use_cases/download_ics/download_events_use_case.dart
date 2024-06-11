import 'package:open_learning_smart_tv/domain/entities/download_ics/events_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/repositories/download_ics/download_ics_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../../data/models/failure.dart';
import '../../entities/strip/calendar/activity/calendar_activity.dart';
import '../../entities/strip/calendar/smart_learning_slots_model.dart';

@lazySingleton
class DownloadEventsUseCase {
  final DownloadIcsRepository _repository;

  DownloadEventsUseCase(this._repository);

  Future<Either<Failure, String>> downloadEvents(
      List<CalendarActivity> calendarActivities) async {
    final List<EventsModel> events = calendarActivities.map((e) {
      if (e.model is LearningObjectModel) {
        final event = e.model as LearningObjectModel;
        return EventsModel(event.id, event.learningObjectType.apiValue);
      } else {
        final event = e.model as SmartLearningSlotsModel;
        return EventsModel(event.id, '${event.objectType}');
      }
    }).toList();

    return await _repository.downloadEvents(
      date: DateFormat('yyyy-MM-dd')
          .format(calendarActivities.first.date ?? DateTime.now()),
      events: events,
    );
  }

  Future<Either<Failure, String>> downloadSmartLearningEvent(
      SmartLearningSlotsModel model) async {
    return await _repository.downloadEvents(
      date: DateFormat('yyyy-MM-dd').format(model.date ?? DateTime.now()),
      events: [EventsModel(model.id, '${model.objectType}')],
    );
  }

  Future<Either<Failure, String>> downloadLearningObjectEvent(
      LearningObjectModel model, DateTime date) async {
    return await _repository.downloadEvents(
      date: DateFormat('yyyy-MM-dd').format(date),
      events: [EventsModel(model.id, model.learningObjectType.apiValue)],
    );
  }
}
