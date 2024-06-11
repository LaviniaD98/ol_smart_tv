import 'package:open_learning_smart_tv/domain/use_cases/set_skip_onboarding_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/set_skip_tutorial_use_case.dart';
import 'package:open_learning_smart_tv/presentation/app_state/cubit/app_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'onboarding_sheet_state.dart';
part 'onboarding_sheet_cubit.freezed.dart';

@injectable
class OnboardingSheetCubit extends Cubit<OnboardingSheetState> {
  final SetSkipOnboardingUseCase _setSkipOnboardingUseCase;
  final SetSkipTutorialUseCase _setSkipTutorialUseCase;
  final AppCubit _appCubit;

  OnboardingSheetCubit(
    this._setSkipOnboardingUseCase,
    this._setSkipTutorialUseCase,
    this._appCubit,
  ) : super(const OnboardingSheetState.initial());

  Future setSkipOnboarding(bool value) async {
    await _setSkipOnboardingUseCase(value);
  }

  Future setSkipTutorial(bool value) async {
    await _setSkipTutorialUseCase(value);
  }

  void setTutorialShown() {
    _appCubit.setTutorialShown(true);
  }

  void setOnboardingShown() {
    _appCubit.setOnboardingShown(true);
  }
}
