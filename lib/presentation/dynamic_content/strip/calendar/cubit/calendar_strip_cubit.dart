import 'package:open_learning_smart_tv/domain/entities/strip/row/strip_row.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entities/strip/calendar/activity/calendar_activity.dart';
import '../../../../../domain/entities/strip/calendar/days_to_highlight_model.dart';
import '../../../../../domain/use_cases/strip/get_calendar_strip_use_case.dart';

part 'calendar_strip_state.dart';
part 'calendar_strip_cubit.freezed.dart';

@injectable
class CalendarStripCubit extends Cubit<CalendarStripState> {
  final GetCalendarStripUseCase _getCalendarStripUseCase;

  CalendarStripCubit(
    this._getCalendarStripUseCase,
  ) : super(const CalendarStripState.parentShimmer());

  late bool smartLearningEnabled;

  void init(StripRow strip, bool smartLearning, {DateTime? endDate}) async {
    smartLearningEnabled = smartLearning;
    final initialDate = DateTime.now();
    final res = await _getCalendarStripUseCase(
        strip: strip, date: initialDate, endDate: endDate);
    res.fold((l) {
      emit(CalendarStripState.error(initialDate));
    }, (r) {
      final value = _filteredActivities(r.activities, r.daysToHighlight);
      emit(CalendarStripState.success(initialDate, value.$1, value.$2, strip));
    });
  }

  void fetch(StripRow strip, DateTime date, {DateTime? endDate}) async {
    emit(CalendarStripState.innerShimmer(date));
    smartLearningEnabled = true;
    final res = await _getCalendarStripUseCase(
        strip: strip, date: date, endDate: endDate);
    res.fold((l) {
      emit(CalendarStripState.error(date));
    }, (r) {
      final value = _filteredActivities(r.activities, r.daysToHighlight);
      emit(CalendarStripState.success(date, value.$1, value.$2, strip));
    });
  }

  void refresh() async {
    final currentState = state as Success;
    emit(CalendarStripState.innerShimmer(currentState.date));
    final res = await _getCalendarStripUseCase(
        strip: currentState.strip, date: currentState.date);
    res.fold((l) {
      emit(CalendarStripState.error(currentState.date));
    }, (r) {
      final value = _filteredActivities(r.activities, r.daysToHighlight);
      emit(currentState.copyWith(
          activities: value.$1, daysToHighlight: value.$2));
    });
  }

  (List<CalendarActivity> activities, List<DaysToHighlightModel>)
      _filteredActivities(List<CalendarActivity> activities,
          List<DaysToHighlightModel> daysToHighlight) {
    if (!smartLearningEnabled) {
      final activitiesFiltered =
          activities.whereType<ActivityLearningObject>().toList();
      final daysToHighlightFiltered = daysToHighlight
          .where((element) => element.areThereSmartSlots == false)
          .toList();
      return (activitiesFiltered, daysToHighlightFiltered);
    }
    return (activities, daysToHighlight);
  }
}
