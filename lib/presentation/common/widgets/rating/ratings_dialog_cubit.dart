import 'package:open_learning_smart_tv/domain/entities/detail/detail_page_model.dart';
import 'package:open_learning_smart_tv/domain/use_cases/rating/rating_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'ratings_dialog_state.dart';
part 'ratings_dialog_cubit.freezed.dart';

@injectable
class RatingsDialogCubit extends Cubit<RatingsDialogState> {
  final RatingUseCase _ratingUseCase;

  RatingsDialogCubit(this._ratingUseCase)
      : super(const RatingsDialogState.success());

  void init() async {
    emit(const RatingsDialogState.success());
  }

  Future<void> rateLearningObject(
      DetailPageModel detailPageModel, int rating) async {
    emit(const RatingsDialogState.loading());
    final rateRes = await _ratingUseCase(detailPageModel, rating);
    await rateRes.fold((l) {
      emit(const RatingsDialogState.success());
    }, (r) {
      emit(const RatingsDialogState.success());
    });
  }
}
