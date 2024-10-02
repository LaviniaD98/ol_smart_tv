import 'package:open_learning_smart_tv/domain/entities/strip/row/strip_row.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entities/strip/calendar/activity/calendar_activity.dart';
import '../../../../../domain/entities/strip/calendar/days_to_highlight_model.dart';
import '../../../../../domain/use_cases/strip/get_calendar_strip_use_case.dart';

part 'calendar_month_strip_state.dart';
part 'calendar_month_strip_cubit.freezed.dart';

@injectable
class CalendarMonthStripCubit extends Cubit<CalendarMonthStripState> {
  final GetCalendarStripUseCase _getCalendarStripUseCase;

  CalendarMonthStripCubit(
    this._getCalendarStripUseCase,
  ) : super(const CalendarMonthStripState.parentShimmer());

  late bool smartLearningEnabled;

  void init(StripRow strip, bool smartLearning) async {
    smartLearningEnabled = smartLearning;
    final initialDate = DateTime.now();
    final res = await _getCalendarStripUseCase(
      strip: strip,
      date: initialDate,
      isMonth: true,
    );
    res.fold((l) {
      emit(CalendarMonthStripState.error(initialDate));
    }, (r) {
      print('RESPONSE: ${r.activities.length} - ${r.daysToHighlight}');
      final value = _filteredActivities(r.activities, r.daysToHighlight);
      emit(CalendarMonthStripState.success(
          initialDate, value.$1, value.$2, strip));
    });
  }

  void fetch(StripRow strip, DateTime date) async {
    emit(CalendarMonthStripState.innerShimmer(date));
    final res = await _getCalendarStripUseCase(
      strip: strip,
      date: date,
      isMonth: true,
    );
    res.fold((l) {
      emit(CalendarMonthStripState.error(date));
    }, (r) {
      final value = _filteredActivities(r.activities, r.daysToHighlight);
      emit(CalendarMonthStripState.success(date, value.$1, value.$2, strip));
    });
  }

  void refresh() async {
    final currentState = state as Success;
    emit(CalendarMonthStripState.innerShimmer(currentState.date));
    final res = await _getCalendarStripUseCase(
      strip: currentState.strip,
      date: currentState.date,
      isMonth: true,
    );
    res.fold((l) {
      emit(CalendarMonthStripState.error(currentState.date));
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
