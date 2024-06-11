part of 'dynamic_content_cubit.dart';

@freezed
class DynamicContentState with _$DynamicContentState {
  const factory DynamicContentState.success({
    required String path,
    required PageModel page,
    required SmartConfiguratorModel? smartConfig,
    List<String>? filters,
  }) = Success;

  const factory DynamicContentState.loading() = Loading;

  const factory DynamicContentState.error(Failure failure) = Error;
}
