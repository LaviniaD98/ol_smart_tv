part of 'comments_cubit.dart';

@freezed
class CommentsState with _$CommentsState {
  const factory CommentsState.initialized() = _Initialized;
  const factory CommentsState.loading() = _Loading;
}
