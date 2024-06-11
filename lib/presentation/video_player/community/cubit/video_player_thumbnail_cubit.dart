import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/download/source_model.dart';
import '../../../../domain/use_cases/download/retrieve_download_info_use_case.dart';

part 'video_player_thumbnail_state.dart';
part 'video_player_thumbnail_cubit.freezed.dart';

@injectable
class VideoPlayerThumbnailCubit extends Cubit<VideoPlayerThumbnailState> {
  final RetrieveDownloadInfoUseCase _retrieveDownloadInfoUseCase;

  VideoPlayerThumbnailCubit(
    this._retrieveDownloadInfoUseCase,
  ) : super(const VideoPlayerThumbnailState.loading());

  void init(String? brightcoveId) async {
    if (brightcoveId == null) {
      emit(const VideoPlayerThumbnailState.error());
    } else {
      final res = await _retrieveDownloadInfoUseCase(brightcoveId.toString());
      res.fold(
        (l) {
          emit(const VideoPlayerThumbnailState.error());
        },
        (r) async {
          final source = r?.getVideoContent();
          if (r != null && source != null && source.src != null) {
            emit(VideoPlayerThumbnailState.done(source, r.poster ?? r.thumbnail ?? ''));
          } else {
            emit(const VideoPlayerThumbnailState.error());
          }
        },
      );
    }
  }
}
