import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/row/strip_row.dart';
import 'package:open_learning_smart_tv/domain/use_cases/strip/get_calendar_strip_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../../../../data/models/failure.dart';
import '../../../../../../../domain/entities/smart_learning/slot_model.dart';
import '../../../../../../../domain/use_cases/smart_learning/create_smart_learning_slot_use_case.dart';
import '../../../../../../../domain/use_cases/smart_learning/get_smart_learning_slots_use_case.dart';
import '../../../../../domain/use_cases/smart_learning/delete_smart_learning_slot_use_case.dart';
import '../../../../../domain/use_cases/smart_learning/update_smart_learning_slot_use_case.dart';
import '../../../../../remote_theming/labels/labels_manager.dart';
import '../../../../../remote_theming/labels/remote_labels_keys.dart';
import '../smart_learning_bottom_sheet.dart';

part 'smart_learning_bottom_sheet_state.dart';
part 'smart_learning_bottom_sheet_cubit.freezed.dart';

@injectable
class SmartLearningBottomSheetCubit
    extends Cubit<SmartLearningBottomSheetState> {
  final GetSmartLearningSlotsUseCase _getSmartLearningSlotsUseCase;
  final CreateSmartLearningSlotUseCase _createSmartLearningSlotUseCase;
  final UpdateSmartLearningSlotUseCase _updateSmartLearningSlotUseCase;
  final DeleteSmartLearningSlotUseCase _deleteSmartLearningSlotUseCase;
  final GetCalendarStripUseCase _getCalendarStripUseCase;

  SmartLearningBottomSheetCubit(
    this._getSmartLearningSlotsUseCase,
    this._createSmartLearningSlotUseCase,
    this._updateSmartLearningSlotUseCase,
    this._deleteSmartLearningSlotUseCase,
    this._getCalendarStripUseCase,
  ) : super(const SmartLearningBottomSheetState.loading());

  late DateTime initialDate;
  late SmartLearningActionType actionType;

  void init({
    required DateTime date,
    DateTime? startTime,
    DateTime? endTime,
    required StripRow strip,
    SmartLearningActionType type = SmartLearningActionType.create,
  }) async {
    initialDate = date;
    actionType = type;
    if (actionType == SmartLearningActionType.edit &&
        (startTime == null || endTime == null)) {
      emit(
        SmartLearningBottomSheetState.error(
          Failure(
              error: LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.error_occurred)),
        ),
      );
    } else {
      final res = await _getSmartLearningSlotsUseCase(date);
      res.fold(
        (l) => emit(SmartLearningBottomSheetState.error(l)),
        (r) async {
          var smartLearningSlots = r.slots.map((e) => e).toList();

          var slots = smartLearningSlots;
          final res = await _getCalendarStripUseCase.callForNotAvailableSlots(
              strip: strip, date: date);
          res.fold((l) {}, (r) {
            if (r.slots.isNotEmpty == true) {
              slots = smartLearningSlots + r.slots;
            }
          });

          List<DateTime> availableStartingTimes;
          List<DateTime> endTimesAvailable;

          if (date.isBefore(Jiffy.now().startOf(Unit.day).dateTime)) {
            availableStartingTimes = [];
            endTimesAvailable = [];
          } else if (actionType == SmartLearningActionType.edit &&
              startTime != null &&
              endTime != null) {
            slots.removeWhere((e) =>
                e.startDate.toLocal().isAtSameMomentAs(startTime) &&
                e.endDate.toLocal().isSameDate(endTime));
            availableStartingTimes =
                _getAvailableStartTimes(selectedDate: date, slots: slots)
                  ..add(startTime);
            endTimesAvailable = _getAvailableEndTimes(selectedDate: date)
              ..add(endTime);
          } else {
            availableStartingTimes =
                _getAvailableStartTimes(selectedDate: date, slots: slots);
            endTimesAvailable = _getAvailableEndTimes(selectedDate: date);
          }

          emit(SmartLearningBottomSheetState.initialized(
            availableStartingTimes: availableStartingTimes,
            endTimesAvailable: endTimesAvailable,
            slots: slots,
            hoursAvailable: r.hoursAvailable,
            active: true,
          ));
        },
      );
    }
  }

  void fetch(
      {required DateTime date, DateTime? startTime, DateTime? endTime}) async {
    final currentState = state as Initialized;
    emit(currentState.copyWith(active: false));
    final res = await _getSmartLearningSlotsUseCase(date);
    res.fold(
      (l) => emit(SmartLearningBottomSheetState.error(l)),
      (r) {
        final slots = r.slots.map((e) => e).toList();
        List<DateTime> availableStartingTimes;
        List<DateTime> endTimesAvailable;
        if (date.isBefore(Jiffy.now().startOf(Unit.day).dateTime)) {
          availableStartingTimes = [];
          endTimesAvailable = [];
        } else if (actionType == SmartLearningActionType.edit &&
            startTime != null &&
            endTime != null &&
            initialDate.isSameDate(date)) {
          slots.removeWhere((e) =>
              e.startDate.toLocal().isAtSameMomentAs(startTime) &&
              e.endDate.toLocal().isSameDate(endTime));
          availableStartingTimes =
              _getAvailableStartTimes(selectedDate: date, slots: slots)
                ..add(startTime);
          endTimesAvailable = _getAvailableEndTimes(selectedDate: date)
            ..add(endTime);
        } else {
          availableStartingTimes =
              _getAvailableStartTimes(selectedDate: date, slots: slots);
          endTimesAvailable = _getAvailableEndTimes(selectedDate: date);
        }
        emit(currentState.copyWith(
          availableStartingTimes: availableStartingTimes,
          endTimesAvailable: endTimesAvailable,
          slots: slots,
          hoursAvailable: r.hoursAvailable,
          active: true,
        ));
      },
    );
  }

  void create({required DateTime start, required DateTime end}) async {
    emit(const SmartLearningBottomSheetState.loading());
    final res = await _createSmartLearningSlotUseCase(
      startDate: start,
      endDate: end,
    );
    res.fold(
      (l) => emit(SmartLearningBottomSheetState.error(l)),
      (r) => emit(const SmartLearningBottomSheetState.success()),
    );
  }

  void update({int? id, required DateTime start, required DateTime end}) async {
    if (id == null) {
      emit(
        SmartLearningBottomSheetState.error(
          Failure(
              error: LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.error_occurred)),
        ),
      );
    } else {
      emit(const SmartLearningBottomSheetState.loading());
      final res = await _updateSmartLearningSlotUseCase(
        slotId: id,
        startDate: start,
        endDate: end,
      );
      res.fold(
        (l) => emit(SmartLearningBottomSheetState.error(l)),
        (r) => emit(const SmartLearningBottomSheetState.success()),
      );
    }
  }

  void delete(int? id) async {
    if (id == null) {
      emit(
        SmartLearningBottomSheetState.error(
          Failure(
              error: LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.error_occurred)),
        ),
      );
    } else {
      emit(const SmartLearningBottomSheetState.loading());
      final res = await _deleteSmartLearningSlotUseCase(id);
      res.fold(
        (l) => emit(SmartLearningBottomSheetState.error(l)),
        (r) => emit(const SmartLearningBottomSheetState.success()),
      );
    }
  }

  List<DateTime> _getAvailableStartTimes({
    required DateTime selectedDate,
    required List<SlotModel> slots,
  }) {
    List<DateTime> res = [];
    DateTime date;
    DateTime temp;

    if (selectedDate.isToday) {
      date =
          Jiffy.parseFromDateTime(DateTime.now()).startOf(Unit.hour).dateTime;
      temp = date.add(Duration(minutes: selectedDate.minute < 30 ? 30 : 60));
    } else {
      date = Jiffy.parseFromDateTime(selectedDate).startOf(Unit.day).dateTime;
      temp = date;
    }

    while (temp.day != date.add(const Duration(days: 1)).day) {
      if (slots.isNotEmpty) {
        final el = slots.firstWhereOrNull((s) {
          final start = s.startDate.toLocal();
          final end = s.endDate.toLocal();
          final inRange =
              ((temp.isAfter(start) || temp.isAtSameMomentAs(start)) &&
                  (temp.isBefore(end)));
          return inRange;
        });
        if (el == null) {
          res.add(temp);
        }
      } else {
        res.add(temp);
      }
      temp = temp.add(const Duration(minutes: 30));
    }
    return res;
  }

  List<DateTime> _getAvailableEndTimes({
    required DateTime selectedDate,
  }) {
    List<DateTime> res = [];
    DateTime date;
    DateTime temp;

    if (selectedDate.isToday) {
      date =
          Jiffy.parseFromDateTime(DateTime.now()).startOf(Unit.hour).dateTime;
      temp = date.add(const Duration(minutes: 60));
    } else {
      date = Jiffy.parseFromDateTime(selectedDate).startOf(Unit.day).dateTime;
      temp = date.add(const Duration(minutes: 30));
    }

    while (temp.day != date.add(const Duration(days: 1)).day) {
      res.add(temp);
      temp = temp.add(const Duration(minutes: 30));
    }
    res.add(temp.subtract(const Duration(minutes: 1)));
    return res;
  }
}
