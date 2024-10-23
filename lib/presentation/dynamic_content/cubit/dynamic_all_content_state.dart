part of 'dynamic_all_content_cubit.dart';

@freezed
class DynamicAllContentState with _$DynamicAllContentState {
  const factory DynamicAllContentState.success({
    Map<StripRow, List<LearningObjectModel>>? exploreCarousel,
    List<Map<StripRow, List<LearningObjectModel>>>? rowItems,
    List<String>? filters,
    bool? refreshingStrips,
  }) = Success;

  const factory DynamicAllContentState.loading() = Loading;

  const factory DynamicAllContentState.error(Failure failure) = Error;
}
