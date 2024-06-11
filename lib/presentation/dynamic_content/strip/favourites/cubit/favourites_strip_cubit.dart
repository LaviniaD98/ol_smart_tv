import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entities/strip/learning_object/learning_object_model.dart';
import '../../../../../domain/entities/strip/row/strip_row.dart';
import '../../../../../domain/use_cases/strip/get_standard_strip_use_case.dart';

part 'favourites_strip_state.dart';
part 'favourites_strip_cubit.freezed.dart';

@lazySingleton
class FavouritesStripCubit extends Cubit<FavouritesStripState> {
  final GetStandardStripUseCase _getStandardStripUseCase;
  FavouritesStripCubit(this._getStandardStripUseCase) : super(const FavouritesStripState.loading());

  late StripRow strip;

  void fetch({StripRow? stripRow}) async {
    emit(const FavouritesStripState.loading());
    if (stripRow != null) {
      strip = stripRow;
      final res = await _getStandardStripUseCase(strip: strip);
      res.fold((l) {
        emit(const FavouritesStripState.error());
      }, (r) {
        emit(FavouritesStripState.success(items: r));
      });
    } else {
      emit(const FavouritesStripState.error());
    }
  }

  void refresh() async {
    if(state is Success) {
      emit(const FavouritesStripState.loading());
        final res = await _getStandardStripUseCase(strip: strip);
        res.fold((l) {
          emit(const FavouritesStripState.error());
        }, (r) {
          emit(FavouritesStripState.success(items: r));
        });
    }
  }
}
