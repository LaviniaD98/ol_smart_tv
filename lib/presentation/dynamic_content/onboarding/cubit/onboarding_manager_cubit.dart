import 'package:open_learning_smart_tv/domain/use_cases/get_skip_onboarding_use_case.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/onboarding/onboarding_form_group.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../domain/use_cases/get_stored_user_self_use_case.dart';

part 'onboarding_manager_state.dart';
part 'onboarding_manager_cubit.freezed.dart';

@injectable
class OnboardingManagerCubit extends Cubit<OnboardingManagerState> {
  final GetStoredUserSelfUseCase _getStoredUserSelfUseCase;
  final GetSkipOnboardingUseCase _getSkipOnboardingUseCase;

  OnboardingManagerCubit(
    this._getStoredUserSelfUseCase,
    this._getSkipOnboardingUseCase,
  ) : super(const OnboardingManagerState.hidden());

  Future init() async {
    final self = await _getStoredUserSelfUseCase();
    final skip = await _getSkipOnboardingUseCase();
    if (self?.onboardingFlag != true && skip != true) {
      emit(OnboardingManagerState.shown(OnboardingFormGroup.build(null)));
    }
  }
}
