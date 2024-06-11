import 'package:open_learning_smart_tv/domain/entities/detail/detail_page_model.dart';
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

  void init(DetailPageModel detailPageModel,
      DetailPageModel? parentLearningObjectModel) async {
    emit(Success(detailPageModel));
  }

  void addToFavorite({
    required DetailPageModel detailPageModel,
    String? parentId,
    String? grandParentId,
  }) async {
    emit(const Loading());
    final addFavouritesRes = await _addFavouritesUseCase(
      detailPageModel: detailPageModel,
      parentId: parentId,
      grandParentId: grandParentId,
    );
    await addFavouritesRes.fold(
      (l) {
        emit(const Error());
      },
      (favouriteModel) async {
        detailPageModel.isFavourite = true;
        _favouritesStripCubit.refresh();
        emit(Success(detailPageModel));
      },
    );
  }

  void removeFromFavorite({
    required DetailPageModel detailPageModel,
    String? parentId,
    String? grandParentId,
  }) async {
    emit(const Loading());
    final removeFavouriteRes = await _removeFavouritesUseCase(
      id: detailPageModel.id,
      learningObjectTypology: detailPageModel.learningObjectTypology,
      parentId: parentId,
      grandParentId: grandParentId,
    );
    await removeFavouriteRes.fold(
      (l) {
        emit(const Error());
      },
      (favouriteModel) async {
        detailPageModel.isFavourite = false;
        _favouritesStripCubit.refresh();
        emit(Success(detailPageModel));
      },
    );
  }
}
