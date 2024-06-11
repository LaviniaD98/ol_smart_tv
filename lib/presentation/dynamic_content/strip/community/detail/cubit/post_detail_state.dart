part of 'post_detail_cubit.dart';

@freezed
class PostDetailState with _$PostDetailState {
  const factory PostDetailState.loading() = _Loading;
  const factory PostDetailState.done({
    required CommunityDataModel post,
    required UserModel storedUser,
    required PostDetailPageArgs args,
    @Default(false) bool canEdit,
    String? imageUrl,
  }) = _Done;
  const factory PostDetailState.error() = _Error;
  const factory PostDetailState.action(PostDetailAction action) = _Action;
}
