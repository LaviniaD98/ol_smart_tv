part of 'favourite_cubit.dart';

@freezed
class FavouriteState with _$FavouriteState {
  const factory FavouriteState.initial() = Initial;
  const factory FavouriteState.success(LearningObjectModel object) = Success;
  const factory FavouriteState.loading() = Loading;
  const factory FavouriteState.error() = Error;
}
