import 'dart:io';

import 'package:open_learning_smart_tv/domain/entities/download/downloaded_item.dart';
import 'package:open_learning_smart_tv/domain/entities/download/downloaded_item_wall.dart';
import 'package:open_learning_smart_tv/domain/use_cases/download/cancel_download_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/download/delete_download_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/download/get_stored_download_content_info_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/download/query_download_manager_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/download/remove_stored_download_content_info_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/offline/get_statements_use_case.dart';
import 'package:open_learning_smart_tv/presentation/offline_state/offline_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

part 'download_wall_state.dart';
part 'download_wall_cubit.freezed.dart';

@injectable
class DownloadWallCubit extends Cubit<DownloadWallState> {
  final QueryDownloadManagerUseCase _queryDownloadManagerUseCase;
  final GetStoredDownloadContentInfoUseCase
      _getStoredDownloadContentInfoUseCase;
  final RemoveStoredDownloadContentInfoUseCase
      _removeStoredDownloadContentInfoUseCase;
  final CancelDownloadUseCase _cancelDownloadUseCase;
  final DeleteDownloadUseCase _deleteDownloadUseCase;
  final OfflineCubit _offlineCubit;
  final GetStatementsUseCase _getStatementsUseCase;

  DownloadWallCubit(
      this._queryDownloadManagerUseCase,
      this._removeStoredDownloadContentInfoUseCase,
      this._cancelDownloadUseCase,
      this._deleteDownloadUseCase,
      this._getStoredDownloadContentInfoUseCase,
      this._offlineCubit,
      this._getStatementsUseCase)
      : super(const DownloadWallState.loading());

  void init() async {
    emit(const DownloadWallState.loading());
    emit(const DownloadWallState.fetch());
  }

  void fetch([bool showOfflineIfNeeded = false]) async {
    bool hasActiveConnection = await hasConnection();
    if (!hasActiveConnection && showOfflineIfNeeded) {
      emit(const DownloadWallState.showOfflineDialog());
    }
    emit(const DownloadWallState.loading());
    List<DownloadedItemExtended>? items = [];
    var whereCondition = "file_name LIKE \"VIDEO_%\"";
    List<DownloadTask>? tasks =
        await _queryDownloadManagerUseCase(whereCondition: whereCondition);
    if (tasks?.isNotEmpty == true) {
      for (var task in tasks!) {
        String fileName = task.filename ?? "";
        final fileFormat = fileName.substring(fileName.lastIndexOf('.'));
        String fileNameWithVideo = fileName.replaceAll(fileFormat, '');
        String id = fileNameWithVideo.replaceAll("VIDEO_", '');
        DownloadedItem? downloadedItem =
            await _getStoredDownloadContentInfoUseCase.call(id);
        if (downloadedItem != null) {
          if (kDebugMode)
            print(
                "download_manager download check for downloadedItem[id{${downloadedItem.id}}title{${downloadedItem.title}}type{${downloadedItem.type}}taskId{${downloadedItem.taskId}}taskIdori{${task.taskId}}]");
          String? localPath = await _getSavedDir();
          downloadedItem.cover = '$localPath/COVER_$id';

          items.add(DownloadedItemExtended(
              downloadedItem: downloadedItem,
              taskId: downloadedItem.taskId,
              downloadTask: task,
              status: task.status,
              progress: task.progress));
        }
      }
    } else {
      if (kDebugMode)
        print(
            "download_manager fullTasks _queryDownloadManagerUseCase no tasks found");
    }
    emit(DownloadWallState.success(items: items));
  }

  Future<String?> _getSavedDir() async {
    String? externalStorageDirPath;
    externalStorageDirPath =
        (await getApplicationDocumentsDirectory()).absolute.path;

    return externalStorageDirPath;
  }

  Future<void> cancelDownload(
      String taskId, DownloadedItem? downloadedItem) async {
    emit(const DownloadWallState.loading());
    var whereCondition = "task_id = \"$taskId\"";
    List<DownloadTask>? tasks =
        await _queryDownloadManagerUseCase(whereCondition: whereCondition);
    if (tasks?.isNotEmpty == true) {
      if (downloadedItem != null) {
        if (kDebugMode) {
          print(
              'download_manager about to remove sharedcontent for ${downloadedItem.id}');
        }
        _removeStoredDownloadContentInfoUseCase("VIDEO_${downloadedItem.id}");

        //delete thumbnail
        String? localPath = await _getSavedDir();
        var thumbnailFilename = '$localPath/COVER_${downloadedItem.id}';
        // Save to filesystem
        final thumbnailFile = File(thumbnailFilename);
        var fileSystemEntity = await thumbnailFile.delete(recursive: false);
        if (kDebugMode) {
          print(
              'download_manager cover deleted exists: ${fileSystemEntity.exists()}');
        }
      }
    }
    await _cancelDownloadUseCase(taskId: taskId);
    await _deleteDownloadUseCase(taskId: taskId);
    fetch();
  }

  Future<DownloadTask?> getDownloadTask(
      DownloadedItemExtended downloadedItemExtended) async {
    var whereCondition =
        "task_id = \"${downloadedItemExtended.downloadedItem?.taskId}\"";
    List<DownloadTask>? tasks =
        await _queryDownloadManagerUseCase(whereCondition: whereCondition);
    if (tasks?.isNotEmpty == true) {
      return tasks?[0];
    } else {
      return null;
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
    } else if (connectivityResult == ConnectivityResult.other) {
      if (kDebugMode) print("hasConnection other");
    } else if (connectivityResult == ConnectivityResult.none) {
      if (kDebugMode) print("hasConnection none");
      hasConnection = false;
    }
    return hasConnection;
  }

  Future<void> checkIfNeedsToGoOnline() async {
    bool hasActiveConnection = await hasConnection();
    if (hasActiveConnection &&
        _offlineCubit.offlineMode &&
        !_offlineCubit.persistenofflineMode) {
      emit(DownloadWallState.showOnlineDialog(date: DateTime.now()));
    }
  }

  Future<void> checkOfflineStatements() async {
    var res = await _getStatementsUseCase.call();
    bool hasActiveConnection = await hasConnection();
    res.fold((l) {
      return true;
    }, (offlineStatements) async {
      if (offlineStatements.isNotEmpty && hasActiveConnection) {
        emit(const DownloadWallState.syncing());
        await _offlineCubit.processExistingOfflineStatements(true);
        emit(const DownloadWallState.done());
      }
    });
  }
}
