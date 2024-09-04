part of 'favorites_content_cubit.dart';

@freezed
class FavoritesContentState with _$FavoritesContentState {
  const factory FavoritesContentState.success({
    List<Map<StripRow, List<LearningObjectModel>>>? rowItems,
  }) = Success;

  const factory FavoritesContentState.loading() = Loading;

  const factory FavoritesContentState.error(Failure failure) = Error;
}
