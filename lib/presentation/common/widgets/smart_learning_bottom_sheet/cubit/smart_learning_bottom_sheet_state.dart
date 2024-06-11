part of 'smart_learning_bottom_sheet_cubit.dart';

@freezed
class SmartLearningBottomSheetState with _$SmartLearningBottomSheetState {

  const factory SmartLearningBottomSheetState.loading() = _Loading;

  const factory SmartLearningBottomSheetState.success() = _Success;

  const factory SmartLearningBottomSheetState.error(Failure failure) = _Error;

  const factory SmartLearningBottomSheetState.initialized({
    required List<DateTime> availableStartingTimes,
    required List<DateTime> endTimesAvailable,
    required List<SlotModel> slots,
    @Default(false) bool active,
    int? hoursAvailable,
  }) = Initialized;
}
