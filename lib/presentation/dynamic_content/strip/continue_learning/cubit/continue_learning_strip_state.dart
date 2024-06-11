part of 'continue_learning_strip_cubit.dart';

@freezed
class ContinueLearningStripState with _$ContinueLearningStripState {
  const factory ContinueLearningStripState.success({
    required List<LearningObjectModel> items,
    List<String>? filters,
  }) = Success;
  const factory ContinueLearningStripState.loading() = Loading;
  const factory ContinueLearningStripState.error() = Error;
}