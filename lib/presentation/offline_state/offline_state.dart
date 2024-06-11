part of 'offline_cubit.dart';

@freezed
class OfflineState with _$OfflineState {
  const factory OfflineState.idle() = _Idle;
  const factory OfflineState.syncing() = _Syncing;
  const factory OfflineState.done() = _Done;
  const factory OfflineState.shownOnboarding(FormGroup formGroup, bool showTutorial) = _ShownOnboarding;
  const factory OfflineState.showTutorial(FormGroup formGroup) = _ShowTutorial;
  const factory OfflineState.networkChanged(bool isOnline, DateTime now) = _NetworkChanged;
}
