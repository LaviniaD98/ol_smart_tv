part of 'calendar_month_strip_cubit.dart';

@freezed
class CalendarMonthStripState with _$CalendarMonthStripState {
  const factory CalendarMonthStripState.parentShimmer() = ParentShimmer;
  const factory CalendarMonthStripState.innerShimmer(DateTime date) = InnerShimmer;
  const factory CalendarMonthStripState.success(DateTime date,
  List<CalendarActivity> activities,
  List<DaysToHighlightModel> daysToHighlight,
  StripRow strip) = Success;
  const factory CalendarMonthStripState.error(DateTime date) = Error;
}
