part of 'add_comment_widget_cubit.dart';

@freezed
class AddCommentWidgetState with _$AddCommentWidgetState {
  const factory AddCommentWidgetState.initial({
    EventData? event,
    @Default(false) bool error,
    @Default(false) bool loading,
    @Default(false) bool close,
  }) = _Initial;
}
