part of 'ecm_first_step_cubit.dart';

@freezed
class EcmFirstStepState with _$EcmFirstStepState {
  const factory EcmFirstStepState.initial({
    List<EcmProfessionModel>? professions,
    List<EcmDisciplineModel>? disciplines,
    @Default(false) bool error
  }) = _Initial;
}
