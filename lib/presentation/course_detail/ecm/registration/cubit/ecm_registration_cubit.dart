import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../steps/first_step/ecm_first_step.dart';

part 'ecm_registration_state.dart';
part 'ecm_registration_cubit.freezed.dart';

@injectable
class EcmRegistrationCubit extends Cubit<EcmRegistrationState> {
  EcmRegistrationCubit() : super(const EcmRegistrationState.firstStep());

  void onFirstStepCompleted(EcmFirstStepArgs args) {
    emit(EcmRegistrationState.secondStep(args));
  }

  void onBackFirstStep(EcmFirstStepArgs args) {
    emit(EcmRegistrationState.firstStep(args: args));
  }
}
