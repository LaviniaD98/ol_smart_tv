part of 'ol_calendar_dialog_cubit.dart';

@freezed
class OlCalendarDialogState with _$OlCalendarDialogState {
  const factory OlCalendarDialogState.loading() = _Loading;
  const factory OlCalendarDialogState.calendars(ICalendar value, List<Calendar> calendars) = _Calendars;
  const factory OlCalendarDialogState.permissionError() = _PermissionError;
  const factory OlCalendarDialogState.calendarError() = _CalendarError;
  const factory OlCalendarDialogState.error() = _Error;
  const factory OlCalendarDialogState.done() = _Done;
}
