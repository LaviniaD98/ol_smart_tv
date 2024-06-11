part of 'ecm_registration_cubit.dart';

@freezed
class EcmRegistrationState with _$EcmRegistrationState {
  const factory EcmRegistrationState.firstStep({
    EcmFirstStepArgs? args
  }) = _EcmFirstStep;
  const factory EcmRegistrationState.secondStep(
      EcmFirstStepArgs firstStep,
      ) = _EcmSecondStep;
}
