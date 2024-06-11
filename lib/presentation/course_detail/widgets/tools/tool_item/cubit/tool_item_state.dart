part of 'tool_item_cubit.dart';

@freezed
class ToolItemState with _$ToolItemState {
  const factory ToolItemState.loading() = _Loading;
  const factory ToolItemState.loaded([ToolUrlModel? data]) = _Loaded;
}
