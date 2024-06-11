
part of 'rating_cubit.dart';

@freezed
class RatingState with _$RatingState {
  const factory RatingState.Initial() = Initial;
  const factory RatingState.Success(ObjectStatisticsDto? rating, int? maxStars, int? userRating) = Success;
  const factory RatingState.Error() = Error;
}
