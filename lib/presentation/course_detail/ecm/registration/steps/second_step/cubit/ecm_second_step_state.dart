part of 'ecm_second_step_cubit.dart';

@freezed
class EcmSecondStepState with _$EcmSecondStepState {
  const factory EcmSecondStepState.initial({
        @Default([]) List<String> selectedSponsor,
      }) = _Initial;
  const factory EcmSecondStepState.loading() = _Loading;
  const factory EcmSecondStepState.error(Failure error) = _Error;
}
