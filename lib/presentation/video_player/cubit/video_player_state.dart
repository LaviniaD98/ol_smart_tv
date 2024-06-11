part of 'video_player_cubit.dart';

@freezed
class VideoPlayerState with _$VideoPlayerState {
  const factory VideoPlayerState.loading() = _Loading;
  const factory VideoPlayerState.tracking() = _Tracking;
  const factory VideoPlayerState.error() = _Error;
  const factory VideoPlayerState.done(SourceModel source, Duration bookmark) = _Done;
}
