part of 'answers_cubit.dart';

@freezed
class AnswersState with _$AnswersState {
  const factory AnswersState.initial({
    @Default([]) List<CommentModel> answers,
    @Default(false) bool showMore,
    @Default(false) bool error,
    @Default(false) bool loading,
  }) = _Initial;
}
