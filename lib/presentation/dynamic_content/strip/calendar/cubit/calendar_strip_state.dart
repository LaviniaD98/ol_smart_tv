part of 'calendar_strip_cubit.dart';

@freezed
class CalendarStripState with _$CalendarStripState {
  const factory CalendarStripState.parentShimmer() = ParentShimmer;
  const factory CalendarStripState.innerShimmer(DateTime date) = InnerShimmer;
  const factory CalendarStripState.success(DateTime date,
  List<CalendarActivity> activities,
  List<DaysToHighlightModel> daysToHighlight,
  StripRow strip) = Success;
  const factory CalendarStripState.error(DateTime date) = Error;
}
