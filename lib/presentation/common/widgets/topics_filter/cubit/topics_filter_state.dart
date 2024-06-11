part of 'topics_filter_cubit.dart';

@freezed
class TopicsFilterState with _$TopicsFilterState {
  const factory TopicsFilterState.loading() = _Loading;
  const factory TopicsFilterState.error() = _Error;
  const factory TopicsFilterState.success(List<TopicModel> topics) = _Success;
}
