part of 'video_player_thumbnail_cubit.dart';

@freezed
class VideoPlayerThumbnailState with _$VideoPlayerThumbnailState {
  const factory VideoPlayerThumbnailState.loading() = _Loading;
  const factory VideoPlayerThumbnailState.tracking() = _Tracking;
  const factory VideoPlayerThumbnailState.error() = _Error;
  const factory VideoPlayerThumbnailState.done(SourceModel source, String thumbnail) = _Done;
}
