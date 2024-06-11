import 'package:open_learning_smart_tv/domain/entities/download/downloaded_item.dart';
import 'package:open_learning_smart_tv/domain/entities/download/downloaded_item_wall.dart';
import 'package:open_learning_smart_tv/domain/use_cases/download/get_stored_download_content_info_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/download/query_download_manager_use_case.dart';
import 'package:open_learning_smart_tv/remote_theming/config/config_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/config/remote_config_keys.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

part 'download_strip_state.dart';
part 'download_strip_cubit.freezed.dart';

@lazySingleton
class DownloadStripCubit extends Cubit<DownloadStripState> {
  final QueryDownloadManagerUseCase _queryDownloadManagerUseCase;
  final GetStoredDownloadContentInfoUseCase
      _getStoredDownloadContentInfoUseCase;
  DownloadStripCubit(
    this._queryDownloadManagerUseCase,
    this._getStoredDownloadContentInfoUseCase,
  ) : super(const DownloadStripState.loading());

  void init() async {
    emit(const DownloadStripState.loading());
    emit(const DownloadStripState.fetch());
  }

  Future<void> fetch() async {
    if (kDebugMode) print("DownloadStripCubit fetch");
    emit(const DownloadStripState.loading());
    var limit =
        ConfigManager().getRemoteInt(RemoteConfigKeys.page_size_strip, 9);
    var whereCondition = "file_name LIKE \"VIDEO_%\" LIMIT $limit";
    List<DownloadedItemExtended>? items = [];
    if (kDebugMode)
      print(
          "DownloadStripCubit download_manager _queryDownloadManagerUseCase, about to call");
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
              taskId: task.taskId,
              downloadTask: task,
              status: task.status,
              progress: task.progress));
        } else {
          if (kDebugMode) print("DownloadStripCubit downloadedItem is null");
        }
      }
    } else {
      if (kDebugMode)
        print(
            "DownloadStripCubit download_manager fullTasks _queryDownloadManagerUseCase no tasks found");
    }
    emit(DownloadStripState.success(items: items));
  }

  Future<String?> _getSavedDir() async {
    String? externalStorageDirPath;
    externalStorageDirPath =
        (await getApplicationDocumentsDirectory()).absolute.path;

    return externalStorageDirPath;
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
}
