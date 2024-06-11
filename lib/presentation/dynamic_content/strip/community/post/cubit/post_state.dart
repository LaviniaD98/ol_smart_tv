part of 'post_cubit.dart';

@freezed
class PostState with _$PostState {
  const factory PostState.loading() = _Loading;
  const factory PostState.initialized({
    required UserInfoModel userInfo,
    String? imageUrl,
    PostLinkModel? link,
  }) = _Initialized;
  const factory PostState.success() = _Success;
  const factory PostState.error(Failure error) = _Error;
}
