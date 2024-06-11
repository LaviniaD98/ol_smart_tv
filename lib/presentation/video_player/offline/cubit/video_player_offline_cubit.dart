import 'package:open_learning_smart_tv/data/models/requests/offline/offline_statements_info.dart';
import 'package:open_learning_smart_tv/domain/entities/download/downloaded_item.dart';
import 'package:open_learning_smart_tv/domain/entities/download/downloaded_item_wall.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:open_learning_smart_tv/domain/use_cases/download/get_stored_download_content_info_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/download/store_download_content_info_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/offline/store_statement_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/statements/set_state_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/statements/statements_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:video_player/video_player.dart';

import '../../../dynamic_content/strip/continue_learning/cubit/continue_learning_strip_cubit.dart';

part 'video_player_offline_state.dart';

part 'video_player_offline_cubit.freezed.dart';

@injectable
class VideoPlayerOfflineCubit extends Cubit<VideoPlayerOfflineState> {
  final StoreStatementUseCase _storeStatementUseCase;
  final StatementsUseCase _statementsUseCase;
  final SetStateUseCase _setStateUseCase;
  final ContinueLearningStripCubit _continueLearningStripCubit;
  final GetStoredDownloadContentInfoUseCase
      _getStoredDownloadContentInfoUseCase;
  final StoreDownloadContentInfoUseCase _storeDownloadContentInfoUseCase;
  bool offlineMode = true;

  VideoPlayerOfflineCubit(
    this._storeStatementUseCase,
    this._statementsUseCase,
    this._setStateUseCase,
    this._continueLearningStripCubit,
    this._getStoredDownloadContentInfoUseCase,
    this._storeDownloadContentInfoUseCase,
  ) : super(const VideoPlayerOfflineState.loading());

  void init(DownloadedItemExtended downloadedItemExtended) async {
    if (downloadedItemExtended.downloadTask == null) {
      emit(const VideoPlayerOfflineState.error());
    } else {
      final fileFullPath =
          "${downloadedItemExtended.downloadTask!.savedDir}/${downloadedItemExtended.downloadTask!.filename!}";
      if (fileFullPath.isEmpty) {
        emit(const VideoPlayerOfflineState.error());
      } else {
        var bookmark = Duration(
            seconds: downloadedItemExtended.downloadedItem != null
                ? downloadedItemExtended.downloadedItem!.bookmark
                : 0);
        DownloadedItem? updatedDownloadedItem =
            await _getStoredDownloadContentInfoUseCase.call(
                downloadedItemExtended.downloadedItem?.id.toString() ?? "");
        if (updatedDownloadedItem != null) {
          bookmark = Duration(seconds: updatedDownloadedItem.bookmark);
        }
        emit(VideoPlayerOfflineState.done(fileFullPath, bookmark));
      }
    }
  }

  Future<void> handlePlayerEvent(
      PlayerEvent playerEvent,
      VideoPlayerController playerControler,
      DownloadedItemExtended downloadedItemExtended,
      [bool dispose = false]) async {
    if (kDebugMode) print("handlePlayerEvent $playerEvent");

    Duration position = playerControler.value.position;
    if (dispose) {
      _continueLearningStripCubit.refresh();
      await playerControler.dispose();
      emit(const VideoPlayerOfflineState.loading());
    }

    LearningObjectTypology? learningObjectTypology =
        downloadedItemExtended.downloadedItem?.learningObjectTypology;
    String? loId = downloadedItemExtended.downloadedItem?.id.toString();
    String? title = downloadedItemExtended.downloadedItem?.title;
    String? description = downloadedItemExtended.downloadedItem?.description;
    String? tentativeId = downloadedItemExtended.downloadedItem?.tentativeId;
    bool completed = playerEvent == PlayerEvent.onComplete;

    String? pathId =
        downloadedItemExtended.downloadedItem?.pathId?.isNotEmpty == true
            ? downloadedItemExtended.downloadedItem?.pathId
            : null;
    if (validateData(
        playerEvent, learningObjectTypology, loId, title, description)) {
      if (offlineMode) {
        if (kDebugMode)
          print(
              "handlePlayerEvent with no active connection, saving data on local DB");
        OfflineStatementsInfo offlineStatementsInfo = OfflineStatementsInfo(
            learningObjectTypology: learningObjectTypology!,
            loId: loId!,
            title: title,
            description: description,
            completed: completed,
            duration: position,
            pathId: pathId);
        await _storeStatementUseCase.call(
            playerEvent, downloadedItemExtended, offlineStatementsInfo);
        switch (playerEvent) {
          case PlayerEvent.onStart:
          case PlayerEvent.onComplete:
            if (completed == true && loId.isNotEmpty == true) {
              await _updateLocalFile(loId, 0);
            }
            break;
          case PlayerEvent.onPause:
          case PlayerEvent.onClose:
            if (loId.isNotEmpty == true) {
              await _updateLocalFile(loId, position.inSeconds);
            }
            break;
          default:
            break;
        }
      } else {
        if (kDebugMode)
          print("handlePlayerEvent with active connection, calling server");
        switch (playerEvent) {
          case PlayerEvent.onStart:
          case PlayerEvent.onComplete:
            final res = await _statementsUseCase.call(
              learningObjectTypology: learningObjectTypology!,
              loId: loId!,
              title: title!,
              description: description!,
              completed: completed,
              duration: position,
              pathId: pathId,
              tentativeId: tentativeId,
            );
            res.fold((l) {}, (r) async {
              if (completed == true) {
                await _setStateUseCase.call(
                  learningObjectTypology: learningObjectTypology,
                  loId: loId,
                  complete: completed,
                  duration: const Duration(seconds: 0),
                  tentativeId: tentativeId,
                );
                if (loId.isNotEmpty == true) {
                  await _updateLocalFile(loId, 0);
                }
              }
            });
            break;
          case PlayerEvent.onPause:
          case PlayerEvent.onClose:
            await _setStateUseCase.call(
              learningObjectTypology: learningObjectTypology!,
              loId: loId!,
              complete: completed,
              duration: position,
              tentativeId: tentativeId,
            );
            if (loId.isNotEmpty == true) {
              await _updateLocalFile(loId, position.inSeconds);
            }
            break;
          default:
            break;
        }
      }
    }
  }

  Future<void> _updateLocalFile(String loId, int currentBookmark) async {
    DownloadedItem? downloadedItem =
        await _getStoredDownloadContentInfoUseCase.call(loId);
    if (downloadedItem != null) {
      downloadedItem.bookmark = currentBookmark;
      await _storeDownloadContentInfoUseCase.storeDownloadItem(
          downloadedItem, loId);
    }
  }

  bool validateData(
      PlayerEvent playerEvent,
      LearningObjectTypology? learningObjectTypology,
      String? loId,
      String? title,
      String? description) {
    switch (playerEvent) {
      case PlayerEvent.onStart:
      case PlayerEvent.onComplete:
        return learningObjectTypology != null &&
            loId != null &&
            title != null &&
            description != null;
      default:
        return learningObjectTypology != null && loId != null;
    }
  }

  Future<bool> hasConnection() async {
    bool hasConnection = true;
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      if (kDebugMode) print("hasConnection mobile");
    } else if (connectivityResult == ConnectivityResult.wifi) {
      if (kDebugMode) print("hasConnection wifi");
    } else if (connectivityResult == ConnectivityResult.ethernet) {
      if (kDebugMode) print("hasConnection ethernet");
    } else if (connectivityResult == ConnectivityResult.vpn) {
      if (kDebugMode) print("hasConnection vpn");
    } else if (connectivityResult == ConnectivityResult.bluetooth) {
      if (kDebugMode) print("hasConnection bluetooth");
      hasConnection = false;
    } else if (connectivityResult == ConnectivityResult.other) {
      if (kDebugMode) print("hasConnection other");
      hasConnection = false;
    } else if (connectivityResult == ConnectivityResult.none) {
      if (kDebugMode) print("hasConnection none");
      hasConnection = false;
    }
    return hasConnection;
  }
}
