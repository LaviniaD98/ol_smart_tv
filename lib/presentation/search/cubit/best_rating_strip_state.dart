part of 'best_rating_strip_cubit.dart';

@freezed
class BestRatingStripState with _$BestRatingStripState {
  const factory BestRatingStripState.success({
    required List<LearningObjectModel> items,
    List<String>? filters,
  }) = Success;
  const factory BestRatingStripState.loading() = Loading;
  const factory BestRatingStripState.error() = Error;
}
