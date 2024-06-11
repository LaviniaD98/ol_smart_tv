part of 'like_post_cubit.dart';

@freezed
class LikePostState with _$LikePostState {
  const factory LikePostState.initial(int likesAmount, bool isLikedByUser) = _Initial;
}