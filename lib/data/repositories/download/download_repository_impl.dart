import 'dart:io';

import 'package:open_learning_smart_tv/core/env/env.dart';
import 'package:open_learning_smart_tv/data/data_sources/download/download_data_source.dart';
import 'package:open_learning_smart_tv/domain/entities/detail/detail_page_model.dart';
import 'package:open_learning_smart_tv/domain/entities/download/download_object_info_model.dart';
import 'package:open_learning_smart_tv/domain/entities/download/source_model.dart';
import 'package:open_learning_smart_tv/domain/repositories/download/download_repository.dart';
import 'package:open_learning_smart_tv/remote_theming/config/config_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/config/remote_config_keys.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as: DownloadlRepository)
class DownloadlRepositoryImpl implements DownloadlRepository {
  final DownloadDataSource _downloadDataSource;
  final Env _env;

  DownloadlRepositoryImpl(this._downloadDataSource, this._env);

  @override
  Future<Either<Failure, String?>> scheduleDownload(
      {required String url,
      required DetailPageModel detailPageModel,
      required SourceModel downloadableModel}) {
    catchFailure(() async {
      String? localPath = await _getSavedDir();
      if (localPath == null) {
        throw Exception(
            "Errore durante la fase di inizializzazione del local storage");
      }
      if (detailPageModel.coverPublicURL?.isNotEmpty == true) {
        final http.Response response =
            await http.get(Uri.parse(detailPageModel.coverPublicURL!));

        // Create an image name
        var filename = '$localPath/COVER_${detailPageModel.id.toString()}';

        // Save to filesystem
        final file = File(filename);
        await file.writeAsBytes(response.bodyBytes);

        if (kDebugMode)
          print(
              "download_manager COVER for coverurl: ${detailPageModel.coverPublicURL} saved in $filename");
      } else {
        if (kDebugMode)
          print("download_manager COVER NO download for coverurl");
      }
    });
    return catchFailure(() async {
      String? localPath = await _getSavedDir();
      if (localPath == null) {
        throw Exception(
            "Errore durante la fase di inizializzazione del local storage");
      }
      final taskId = await FlutterDownloader.enqueue(
        url: url,
        headers: {},
        fileName:
            "VIDEO_${detailPageModel.id.toString()}.${downloadableModel.container}",
        savedDir: localPath,
        saveInPublicStorage: false,
        showNotification: false,
        openFileFromNotification: false,
      );
      if (kDebugMode)
        print(
            "download_manager VIDEO download taskId: $taskId for video url: $url");
      return taskId;
    });
  }

  Future<String?> _getSavedDir() async {
    String? externalStorageDirPath;
    externalStorageDirPath =
        (await getApplicationDocumentsDirectory()).absolute.path;

    return externalStorageDirPath;
  }

  @override
  Future<Either<Failure, DownloadObjectInfoModel?>> retrieveDownloadInfo(
      String? brightCoverId) {
    return catchFailure(() async {
      String url = _env.brightcoveDownloadUrl.replaceFirst(
          '{brightcoveaccountid}',
          ConfigManager()
              .getRemoteString(RemoteConfigKeys.brightcove_accound_id));
      String path = "$url/$brightCoverId";
      String brightcoveAccountPk = ConfigManager()
          .getRemoteString(RemoteConfigKeys.brightcove_accound_pk);
      final res = await _downloadDataSource.retrieveDownloadInfo(
          "application/json;pk=$brightcoveAccountPk", path);
      return DownloadObjectInfoModel.fromDto(res);
    });
  }

  @override
  Future<Either<Failure, void>> cancelDownload({required String taskId}) {
    return catchFailure(() async {
      if (kDebugMode)
        print('download_manager about cancel download for $taskId');
      await FlutterDownloader.cancel(taskId: taskId);
    });
  }

  @override
  Future<Either<Failure, void>> deleteDownload({required String taskId}) {
    return catchFailure(() async {
      if (kDebugMode)
        print('download_manager about delete download for $taskId');
      await FlutterDownloader.remove(
        taskId: taskId,
        shouldDeleteContent: true,
      );
    });
  }
}
