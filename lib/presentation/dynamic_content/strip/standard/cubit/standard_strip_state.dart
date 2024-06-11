part of 'standard_strip_cubit.dart';

@freezed
class StandardStripState with _$StandardStripState {
  const factory StandardStripState.success({
    required List<LearningObjectModel> items,
    List<String>? filters,
  }) = Success;
  const factory StandardStripState.loading() = Loading;
  const factory StandardStripState.error() = Error;
}
