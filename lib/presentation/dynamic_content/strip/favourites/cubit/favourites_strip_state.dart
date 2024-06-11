part of 'favourites_strip_cubit.dart';

@freezed
class FavouritesStripState with _$FavouritesStripState {
  const factory FavouritesStripState.success({
    required List<LearningObjectModel> items,
    List<String>? filters,
  }) = Success;
  const factory FavouritesStripState.loading() = Loading;
  const factory FavouritesStripState.error() = Error;
}
