import 'package:open_learning_smart_tv/domain/entities/download/downloaded_item.dart';
import 'package:open_learning_smart_tv/domain/use_cases/download/get_stored_download_content_info_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/download/store_download_content_info_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/statements/get_state_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/statements/set_state_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/statements/statements_use_case.dart';
import 'package:open_learning_smart_tv/presentation/video_player/video_player_page.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:video_player/video_player.dart';
import '../../../domain/entities/download/source_model.dart';
import '../../../domain/use_cases/download/retrieve_download_info_use_case.dart';
import '../../dynamic_content/strip/continue_learning/cubit/continue_learning_strip_cubit.dart';

part 'video_player_state.dart';

part 'video_player_cubit.freezed.dart';

@injectable
class VideoPlayerCubit extends Cubit<VideoPlayerState> {
  final StatementsUseCase _statementsUseCase;
  final SetStateUseCase _setStateUseCase;
  final GetStateUseCase _getStateUseCase;
  final RetrieveDownloadInfoUseCase _retrieveDownloadInfoUseCase;
  final ContinueLearningStripCubit _continueLearningStripCubit;
  final GetStoredDownloadContentInfoUseCase
      _getStoredDownloadContentInfoUseCase;
  final StoreDownloadContentInfoUseCase _storeDownloadContentInfoUseCase;

  String statementId = "";

  VideoPlayerCubit(
    this._statementsUseCase,
    this._setStateUseCase,
    this._getStateUseCase,
    this._retrieveDownloadInfoUseCase,
    this._continueLearningStripCubit,
    this._getStoredDownloadContentInfoUseCase,
    this._storeDownloadContentInfoUseCase,
  ) : super(const VideoPlayerState.loading());

  void init(String? brightcoveId, VideoPlayerPageArgs args) async {
    if (brightcoveId == null) {
      // emit(const VideoPlayerState.error());
    } else {
      final res = await _retrieveDownloadInfoUseCase(brightcoveId.toString());
      res.fold(
        (l) {
          emit(const VideoPlayerState.error());
        },
        (r) async {
          final source = r?.getVideoContent();
          if (r != null && source != null && source.src != null) {
            if (args.typology != null) {
              final res = await _getStateUseCase.call(
                  args.typology!, args.id.toString(), args.tentativeId);
              res.fold((l) {
                emit(VideoPlayerState.done(source, const Duration(seconds: 0)));
                _updateLocalFile(args.id.toString(), 0);
              }, (r) {
                double duration = r.attemptDuration!;
                emit(VideoPlayerState.done(
                    source, Duration(seconds: duration.toInt())));
                _updateLocalFile(args.id.toString(), duration.toInt());
              });
            } else {
              emit(VideoPlayerState.done(source, const Duration(seconds: 0)));
              _updateLocalFile(args.id.toString(), 0);
            }
          } else {
            // emit(const VideoPlayerState.error());
          }
        },
      );
    }
  }

  void _updateLocalFile(String loId, int currentBookmark) async {
    DownloadedItem? downloadedItem =
        await _getStoredDownloadContentInfoUseCase.call(loId);
    if (downloadedItem != null) {
      downloadedItem.bookmark = currentBookmark;
      await _storeDownloadContentInfoUseCase.storeDownloadItem(
          downloadedItem, loId);
    }
  }

  Future<void> setStateCall(VideoPlayerPageArgs args, bool complete,
      Duration duration, VideoPlayerController playerControler,
      [bool dispose = false]) async {
    if (dispose) {
      _continueLearningStripCubit.refresh();
      await playerControler.dispose();
      emit(const VideoPlayerState.tracking());
    }

    if (args.typology != null) {
      await _setStateUseCase.call(
        learningObjectTypology: args.typology!,
        loId: args.id.toString(),
        complete: complete,
        duration: duration,
        tentativeId: args.tentativeId,
      );
      _updateLocalFile(args.id.toString(), duration.inSeconds);
    }
  }

  Future<void> statementsCall(VideoPlayerPageArgs args, bool completed,
      Duration duration, VideoPlayerController playerControler,
      [bool dispose = false]) async {
    if (dispose) {
      _continueLearningStripCubit.refresh();
      //await playerControler.dispose();
      emit(const VideoPlayerState.tracking());
    }

    if (args.typology != null) {
      final res = await _statementsUseCase.call(
          learningObjectTypology: args.typology!,
          loId: args.id.toString(),
          title: args.title,
          description: args.title,
          completed: completed,
          duration: duration,
          tentativeId: args.tentativeId,
          pathId: args.pathId);
      res.fold((l) {
        // emit(const VideoPlayerState.error());
      }, (r) {
        final result = r;
        if (kDebugMode) print("$result");
        statementId = result.first;
        if (completed == true) {
          // reset bookmark
          setStateCall(args, true, const Duration(seconds: 0), playerControler);
        }
      });
    }
  }
}
