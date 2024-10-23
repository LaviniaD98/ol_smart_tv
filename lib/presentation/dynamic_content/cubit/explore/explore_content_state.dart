part of 'explore_content_cubit.dart';

@freezed
class ExploreContentState with _$ExploreContentState {
  const factory ExploreContentState.success({
    required String path,
    required PageModel page,
    required SmartConfiguratorModel? smartConfig,
    StripRow? exploreCarousel,
    List<StripRow>? strips,
    List<String>? filters,
  }) = Success;

  const factory ExploreContentState.loading() = Loading;

  const factory ExploreContentState.error(Failure failure) = Error;
}
