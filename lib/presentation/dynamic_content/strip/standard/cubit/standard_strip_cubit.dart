import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entities/strip/learning_object/learning_object_model.dart';
import '../../../../../domain/entities/strip/row/strip_row.dart';
import '../../../../../domain/use_cases/strip/get_standard_strip_use_case.dart';

part 'standard_strip_state.dart';
part 'standard_strip_cubit.freezed.dart';

@injectable
class StandardStripCubit extends Cubit<StandardStripState> {
  final GetStandardStripUseCase _getSuggestedStripUseCase;
  StandardStripCubit(this._getSuggestedStripUseCase)
      : super(const StandardStripState.loading());

  StripRow? currentStrip;

  void fetch({StripRow? strip, List<String>? filters}) async {
    emit(const StandardStripState.loading());
    if (strip != null) {
      currentStrip = strip;
      final res =
          await _getSuggestedStripUseCase(strip: strip, filters: filters);
      res.fold((l) {
        emit(const StandardStripState.error());
      }, (r) {
        emit(StandardStripState.success(items: r));
      });
    }
  }

  void refresh() async {
    if (currentStrip != null) {
      emit(const StandardStripState.loading());
      final res = await _getSuggestedStripUseCase(strip: currentStrip!);
      res.fold((l) {
        emit(const StandardStripState.error());
      }, (r) {
        emit(StandardStripState.success(items: r));
      });
    }
  }
}
