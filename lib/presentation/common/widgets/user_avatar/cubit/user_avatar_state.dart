part of 'user_avatar_cubit.dart';

@freezed
class UserAvatarState with _$UserAvatarState {
  const factory UserAvatarState.loading() = _Loading;
  const factory UserAvatarState.image(String url) = _Image;
  const factory UserAvatarState.error() = _Error;
}
