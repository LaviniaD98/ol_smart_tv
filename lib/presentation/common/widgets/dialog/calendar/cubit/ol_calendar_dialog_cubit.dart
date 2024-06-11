import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icalendar_parser/icalendar_parser.dart';
import 'package:injectable/injectable.dart';
import 'package:device_calendar/device_calendar.dart';

import '../../../../../../domain/entities/strip/calendar/activity/calendar_activity.dart';
import '../../../../../../domain/entities/strip/calendar/smart_learning_slots_model.dart';
import '../../../../../../domain/entities/strip/learning_object/learning_object_model.dart';
import '../../../../../../domain/enums/types.dart';
import '../../../../../../domain/use_cases/download_ics/get_events_use_case.dart';
import '../ol_calendar_dialog.dart';

part 'ol_calendar_dialog_state.dart';
part 'ol_calendar_dialog_cubit.freezed.dart';

@injectable
class OlCalendarDialogCubit extends Cubit<OlCalendarDialogState> {
  final GetEventsUseCase _getEventsUseCase;

  OlCalendarDialogCubit(this._getEventsUseCase)
      : super(const OlCalendarDialogState.loading());

  final _deviceCalendarPlugin = DeviceCalendarPlugin();

  Future downloadEvents(List<CalendarActivity>? activities) async {
    final res = await _getEventsUseCase.downloadEvents(activities ?? []);
    res.fold(
        (l) => emit(const OlCalendarDialogState.error()),
        (r) => _retrieveCalendars(r),
    );
  }

  Future<void> downloadEventSmartLearning(SmartLearningSlotsModel model) async {
    final res = await _getEventsUseCase.downloadSmartLearningEvent(model);
    res.fold(
        (l) => emit(const OlCalendarDialogState.error()),
        (r) => _retrieveCalendars(r),
    );
  }

  Future<void> downloadEventLearningObject(LearningObjectModel model,
      DateTime date,) async {
    final res = await _getEventsUseCase.downloadLearningObjectEvent(
      model,
      date,
    );
    res.fold(
        (l) => emit(const OlCalendarDialogState.error()),
        (r) => _retrieveCalendars(r),
    );
  }

  /// check permission
  Future<bool> _checkPermission() async {
    bool? hasPermission;
    try {
      var permissionsGranted = await _deviceCalendarPlugin.hasPermissions();
      if (permissionsGranted.isSuccess && (permissionsGranted.data == null || permissionsGranted.data == false)) {
        permissionsGranted = await _deviceCalendarPlugin.requestPermissions();
        hasPermission = !(!permissionsGranted.isSuccess || permissionsGranted.data == null || permissionsGranted.data == false);
      }
      return hasPermission ?? true;
    } on PlatformException catch (e) {
      if(kDebugMode) print(e);
      return false;
    }
  }

  /// Retrieve Calendars
  Future<void> _retrieveCalendars(ICalendar value) async {
    try {
      final res = await _deviceCalendarPlugin.retrieveCalendars();
      if(res.hasErrors) {
        emit(const OlCalendarDialogState.calendarError());
      } else {
        final calendars = res.data?.where((element) => element.isReadOnly == false);
        emit(OlCalendarDialogState.calendars(value, [...?calendars]));
      }
    } catch (e) {
      emit(const OlCalendarDialogState.calendarError());
    }
  }

  void addToCalendar(ICalendar ics, Calendar calendar) async {
      emit(const OlCalendarDialogState.loading());
      final currentLocation = timeZoneDatabase.locations[await FlutterTimezone.getLocalTimezone()] as Location;
      final List<Event> events = [];
      for(var e in ics.data) {
        if(e['dtstart'] is IcsDateTime && e['dtstart'] is IcsDateTime) {
          Uri? url;
          if(e.keys.contains(EventTypeUrl.teamsMeeting.key.toLowerCase()) && e[EventTypeUrl.teamsMeeting.key.toLowerCase()] is String) {
            url = Uri.dataFromString(e[EventTypeUrl.teamsMeeting.key.toLowerCase()]);
          } else if((e.keys.contains(EventTypeUrl.externalMeeting.key.toLowerCase()) && e[EventTypeUrl.externalMeeting.key.toLowerCase()] is String)) {
            url = Uri.dataFromString(e[EventTypeUrl.externalMeeting.key.toLowerCase()]);
          }

          final event = Event(
            calendar.id,
            title: e['summary'] as String?,
            description: e['description'] as String?,
            location: e['location'] as String?,
            status: EventStatus.Confirmed,
            url: url,
            start: TZDateTime.from(e['dtstart'].toDateTime(), currentLocation),
            end: TZDateTime.from(e['dtend'].toDateTime(), currentLocation),
          );
          events.add(event);
        }
      }
      if(events.isEmpty) {
        emit(const OlCalendarDialogState.calendarError());
      } else if(events.length == 1) {
        _addEvent(events.first);
      } else {
        _addAllEvents(events);
      }
  }

  void _addAllEvents(List<Event> events) async {
    try {
      await Future.wait(
        events.map((e) => _deviceCalendarPlugin.createOrUpdateEvent(e)).toList(),
        eagerError: true,
      );
      emit(const OlCalendarDialogState.done());
    } catch (e) {
      emit(const OlCalendarDialogState.calendarError());
    }
  }

  Future<void> _addEvent(Event event) async {
    final res = await _deviceCalendarPlugin.createOrUpdateEvent(event);
    if(res != null && res.isSuccess) {
      emit(const OlCalendarDialogState.done());
    } else {
      emit(const OlCalendarDialogState.calendarError());
    }
  }

  void startDownloadEvents(OlCalendarDialogArgs args) async {
    _initParser();
    if (await _checkPermission()) {
      if (args.type == AgendaEventType.events) {
        downloadEvents(args.activities);
      } else if (args.type == AgendaEventType.eventSmartLearning) {
        if (args.smartLearningSlotsModel != null) {
          downloadEventSmartLearning(args.smartLearningSlotsModel!);
        } else {
          emit(const OlCalendarDialogState.error());
        }
      } else if (args.type == AgendaEventType.eventLearningObject) {
        if (args.learningObjectModel != null && args.date != null) {
          downloadEventLearningObject(args.learningObjectModel!, args.date!);
        } else {
          emit(const OlCalendarDialogState.error());
        }
      }
    } else {
      emit(const OlCalendarDialogState.permissionError());
    }
  }

  void _initParser() {
    for(var type in EventTypeUrl.values) {
      ICalendar.registerField(field: type.key);
    }
  }

  void _resetParser() {
    for(var type in EventTypeUrl.values) {
      ICalendar.unregisterField(type.key);
    }
  }

  @override
  Future<void> close() {
    _resetParser();
    return super.close();
  }
}

enum EventTypeUrl {
  teamsMeeting('X-MICROSOFT-SKYPETEAMSMEETINGURL'),
  externalMeeting('X-MICROSOFT-ONLINEMEETINGEXTERNALLINK');

  final String key;
  const EventTypeUrl(this.key);
}