import 'package:open_learning_smart_tv/domain/use_cases/strip/get_continue_learning_strip_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entities/strip/learning_object/learning_object_model.dart';
import '../../../../../domain/entities/strip/row/strip_row.dart';

part 'continue_learning_strip_state.dart';
part 'continue_learning_strip_cubit.freezed.dart';

@lazySingleton
class ContinueLearningStripCubit extends Cubit<ContinueLearningStripState> {
  final GetContinueLearningStripUseCase _getContinueLearningStripUseCase;
  ContinueLearningStripCubit(this._getContinueLearningStripUseCase)
      : super(const ContinueLearningStripState.loading());

  late StripRow strip;

  void fetch({required StripRow stripRow}) async {
    strip = stripRow;
    emit(const ContinueLearningStripState.loading());
    final res = await _getContinueLearningStripUseCase(strip: strip);
    res.fold((l) {
      emit(const ContinueLearningStripState.error());
    }, (r) {
      emit(ContinueLearningStripState.success(items: r));
    });
  }

  void refresh() async {
    if (state is Success) {
      emit(const ContinueLearningStripState.loading());
      final res = await _getContinueLearningStripUseCase(strip: strip);
      res.fold((l) {
        emit(const ContinueLearningStripState.error());
      }, (r) {
        emit(ContinueLearningStripState.success(items: r));
      });
    }
  }
}
