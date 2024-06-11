import 'dart:io';

import 'package:open_learning_smart_tv/domain/use_cases/download/cancel_download_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/download/delete_download_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/download/query_download_manager_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/download/remove_stored_download_content_info_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/database/app_database.dart';
import '../../core/shared_preferences_keys.dart';
import '../entities/user/user_info_model.dart';

@lazySingleton
class CleanLocalDatabaseUseCase {
  final AppDatabase _appDatabase;
  final QueryDownloadManagerUseCase _queryDownloadManagerUseCase;
  final RemoveStoredDownloadContentInfoUseCase
      _removeStoredDownloadContentInfoUseCase;
  final CancelDownloadUseCase _cancelDownloadUseCase;
  final DeleteDownloadUseCase _deleteDownloadUseCase;
  final SharedPreferences _sharedPreferences;

  CleanLocalDatabaseUseCase(
    this._appDatabase,
    this._sharedPreferences,
    this._queryDownloadManagerUseCase,
    this._removeStoredDownloadContentInfoUseCase,
    this._cancelDownloadUseCase,
    this._deleteDownloadUseCase,
  );

  Future<void> call(UserInfoModel? model) async {
    final storedId = _sharedPreferences.getInt(SharedPreferencesKeys.userId);
    if (storedId != model?.user?.idUser) {
      /// if the new login is made by a different user, clean local database
      await _appDatabase.clean();
      await cleanOfflineContents();
    }
    return;
  }

  Future<void> cleanOfflineContents() async {
    var whereCondition = "file_name LIKE \"VIDEO_%\"";
    List<DownloadTask>? tasks =
        await _queryDownloadManagerUseCase(whereCondition: whereCondition);
    if (tasks?.isNotEmpty == true) {
      if (kDebugMode)
        print('download_manager about to remove all downloaded contents');
      String? localPath = await _getSavedDir();
      for (var task in tasks!) {
        String fileName = task.filename ?? "";
        final fileFormat = fileName.substring(fileName.lastIndexOf('.'));
        String fileNameWithVideo = fileName.replaceAll(fileFormat, '');
        String id = fileNameWithVideo.replaceAll("VIDEO_", '');

        _removeStoredDownloadContentInfoUseCase("VIDEO_$id");

        //delete thumbnail
        var thumbnailFilename = '$localPath/COVER_$id';
        // Save to filesystem
        final thumbnailFile = File(thumbnailFilename);
        var fileSystemEntity = await thumbnailFile.delete(recursive: false);

        await _cancelDownloadUseCase(taskId: task.taskId);
        await _deleteDownloadUseCase(taskId: task.taskId);
      }
    }
  }

  Future<String?> _getSavedDir() async {
    String? externalStorageDirPath;
    externalStorageDirPath =
        (await getApplicationDocumentsDirectory()).absolute.path;

    return externalStorageDirPath;
  }
}
