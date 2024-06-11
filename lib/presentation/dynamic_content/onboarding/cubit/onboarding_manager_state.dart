part of 'onboarding_manager_cubit.dart';

@freezed
class OnboardingManagerState with _$OnboardingManagerState {
  const factory OnboardingManagerState.shown(FormGroup formGroup) = _Shown;
  const factory OnboardingManagerState.hidden() = _Hidden;
}
