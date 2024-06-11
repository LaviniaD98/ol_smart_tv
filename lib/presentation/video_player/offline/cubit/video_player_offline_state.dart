part of 'video_player_offline_cubit.dart';

@freezed
class VideoPlayerOfflineState with _$VideoPlayerOfflineState {
  const factory VideoPlayerOfflineState.loading() = _Loading;
  const factory VideoPlayerOfflineState.error() = _Error;
  const factory VideoPlayerOfflineState.done(String fileFullPath, Duration bookmark) = _Done;
}
