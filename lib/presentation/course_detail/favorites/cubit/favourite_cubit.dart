import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/use_cases/detail/add_favourites_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/detail/remove_favourite_use_case.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/favourites/cubit/favourites_strip_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'favourite_state.dart';

part 'favourite_cubit.freezed.dart';

@injectable
class FavouriteCubit extends Cubit<FavouriteState> {
  final AddFavouritesUseCase _addFavouritesUseCase;
  final RemoveFavouritesUseCase _removeFavouritesUseCase;
  final FavouritesStripCubit _favouritesStripCubit;

  FavouriteCubit(
    this._addFavouritesUseCase,
    this._removeFavouritesUseCase,
    this._favouritesStripCubit,
  ) : super(const FavouriteState.loading());

  void init(LearningObjectModel detailPageModel) async {
    emit(Success(detailPageModel));
  }

  void addToFavorite({
    required LearningObjectModel model,
    String? parentId,
    String? grandParentId,
  }) async {
    emit(const Loading());
    final addFavouritesRes = await _addFavouritesUseCase(
      model: model,
      parentId: parentId,
      grandParentId: grandParentId,
    );
    await addFavouritesRes.fold(
      (l) {
        emit(const Error());
      },
      (favouriteModel) async {
        model.isFavourite = true;
        _favouritesStripCubit.refresh();
        emit(Success(model));
      },
    );
  }

  void removeFromFavorite({
    required LearningObjectModel model,
    String? parentId,
    String? grandParentId,
  }) async {
    emit(const Loading());
    final removeFavouriteRes = await _removeFavouritesUseCase(
      id: model.id,
      learningObjectTypology: model.learningObjectTypology,
      parentId: parentId,
      grandParentId: grandParentId,
    );
    await removeFavouriteRes.fold(
      (l) {
        emit(const Error());
      },
      (favouriteModel) async {
        model.isFavourite = false;
        _favouritesStripCubit.refresh();
        emit(Success(model));
      },
    );
  }
}
