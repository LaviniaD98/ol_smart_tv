import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entities/strip/learning_object/learning_object_model.dart';
import '../../../../../domain/entities/strip/row/strip_row.dart';
import '../../../../../domain/use_cases/strip/get_standard_strip_use_case.dart';

part 'best_rating_strip_state.dart';
part 'best_rating_strip_cubit.freezed.dart';

@lazySingleton
class BestRatingStripCubit extends Cubit<BestRatingStripState> {
  final GetStandardStripUseCase _getStandardStripUseCase;
  BestRatingStripCubit(this._getStandardStripUseCase)
      : super(const BestRatingStripState.loading());

  late StripRow strip;

  void fetch({StripRow? stripRow}) async {
    emit(const BestRatingStripState.loading());
    if (stripRow != null) {
      strip = stripRow;
      final res = await _getStandardStripUseCase(strip: strip);
      res.fold((l) {
        emit(const BestRatingStripState.error());
      }, (r) {
        emit(BestRatingStripState.success(items: r));
      });
    } else {
      emit(const BestRatingStripState.error());
    }
  }

  void refresh() async {
    if (state is Success) {
      emit(const BestRatingStripState.loading());
      final res = await _getStandardStripUseCase(strip: strip);
      res.fold((l) {
        emit(const BestRatingStripState.error());
      }, (r) {
        emit(BestRatingStripState.success(items: r));
      });
    }
  }
}
