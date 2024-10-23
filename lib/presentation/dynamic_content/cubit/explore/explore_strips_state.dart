part of 'explore_strips_cubit.dart';

@freezed
class ExploreStripsState with _$ExploreStripsState {
  const factory ExploreStripsState.success({
    List<Map<StripRow, List<LearningObjectModel>>>? rowItems,
    List<String>? filters,
    bool? refreshingStrips,
  }) = Success;

  const factory ExploreStripsState.loading() = Loading;

  const factory ExploreStripsState.error(Failure failure) = Error;
}
