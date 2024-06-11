import 'package:open_learning_smart_tv/presentation/course_detail/ecm/registration/steps/first_step/ecm_first_step.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../data/models/failure.dart';
import '../../../../../../../domain/use_cases/ecm/ecm_register_use_case.dart';
import '../ecm_second_step.dart';

part 'ecm_second_step_state.dart';
part 'ecm_second_step_cubit.freezed.dart';

@injectable
class EcmSecondStepCubit extends Cubit<EcmSecondStepState> {
  final EcmRegisterUseCase _ecmRegisterUseCase;

  EcmSecondStepCubit(this._ecmRegisterUseCase)
      : super(const EcmSecondStepState.initial());

  void onSponsorsChanged(List<String> sponsors) {
    if (state is _Initial) {
      emit((state as _Initial).copyWith(
        selectedSponsor: [...sponsors],
      ));
    }
  }

  void onConfirm(EcmSecondStepArgs args) async {
    if (state is _Initial) {
      final current = state as _Initial;
      final res = await _ecmRegisterUseCase(
        sponsors: current.selectedSponsor,
        professions: args.firstStep.professions,
        disciplines: args.firstStep.disciplines,
        isProfessional:
            args.firstStep.type == ProfessionType.freelancer ? true : false,
        isSponsored: current.selectedSponsor.isNotEmpty,
        enrollId: args.enrollId,
        loId: args.loId,
      );

      res.fold((l) {
        emit(EcmSecondStepState.error(l));
        emit(current);
      }, (r) {
        args.onDone.call();
      });
    }
  }
}
