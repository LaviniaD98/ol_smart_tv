import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:open_learning_smart_tv/domain/entities/detail/detail_page_model.dart';
import 'package:open_learning_smart_tv/domain/entities/download/downloaded_item.dart';
import 'package:open_learning_smart_tv/domain/entities/download/source_model.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:open_learning_smart_tv/domain/use_cases/download/cancel_download_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/download/delete_download_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/download/query_download_manager_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/download/retrieve_download_info_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/download/schedule_download_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/download/get_stored_download_content_info_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/download/remove_stored_download_content_info_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/download/store_download_content_info_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/statements/get_state_use_case.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/detail_page.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../../domain/use_cases/start_resume_use_case/start_resume_use_case.dart';
import '../../../../profile/download/cubit/download_strip_cubit.dart';

part 'download_item_state.dart';

part 'download_item_cubit.freezed.dart';

@injectable
class DownloadItemCubit extends Cubit<DownloadItemState> {
  final ScheduleDownloadUseCase _scheduleDownloadUseCase;
  final RetrieveDownloadInfoUseCase _retrieveDownloadInfoUseCase;
  final StoreDownloadContentInfoUseCase _storeDownloadContentInfoUseCase;
  final GetStoredDownloadContentInfoUseCase
      _getStoredDownloadContentInfoUseCase;
  final CancelDownloadUseCase _cancelDownloadUseCase;
  final RemoveStoredDownloadContentInfoUseCase
      _removeStoredDownloadContentInfoUseCase;
  final DeleteDownloadUseCase _deleteDownloadUseCase;
  final QueryDownloadManagerUseCase _queryDownloadManagerUseCase;
  final StartResumeUseCase _startResumeUseCase;
  final DownloadStripCubit _downloadStripCubit;
  final GetStateUseCase _getStateUseCase;
  ReceivePort _port = ReceivePort();

  DownloadItemCubit(
    this._scheduleDownloadUseCase,
    this._retrieveDownloadInfoUseCase,
    this._storeDownloadContentInfoUseCase,
    this._getStoredDownloadContentInfoUseCase,
    this._cancelDownloadUseCase,
    this._removeStoredDownloadContentInfoUseCase,
    this._deleteDownloadUseCase,
    this._queryDownloadManagerUseCase,
    this._startResumeUseCase,
    this._downloadStripCubit,
    this._getStateUseCase,
  ) : super(const DownloadItemState.loading());

  void dispose(DetailPageModel detailPageModel) {
    _unbindBackgroundIsolate();
  }

  Future<void> initializeDownloader(DetailPageModel detailPageModel) async {
    _unbindBackgroundIsolate();
    FlutterDownloader.registerCallback(downloadCallback, step: 1);

    await _queryDownloadManagerUseCase().then((tasks) {
      tasks?.forEach((task) {
        if (kDebugMode)
          print(
              "download_manager download check for task[filename{${task.filename}}status{${task.status}}progress{${task.progress}}savedDir{${task.savedDir}}taskId{${task.taskId}}url{${task.url}}]");
      });
    });
  }

  void init(DetailPageModel detailPageModel) async {
    if (canDownload(detailPageModel)) {
      DownloadedItem? downloadedItem =
          await _getStoredDownloadContentInfoUseCase
              .call(detailPageModel.id.toString());
      await initializeDownloader(detailPageModel);
      var whereCondition =
          "file_name = \"VIDEO_${detailPageModel.id.toString()}.${downloadedItem?.type}\"";
      List<DownloadTask>? downloadTasks =
          await _queryDownloadManagerUseCase(whereCondition: whereCondition);
      if (downloadedItem != null && downloadTasks?.isNotEmpty == false) {
        if (kDebugMode)
          print(
              'download_manager about to remove sharedcontent for ${downloadedItem.id}');
        _removeStoredDownloadContentInfoUseCase("VIDEO_${downloadedItem.id}");

        //delete thumbnail
        String? localPath = await _getSavedDir();
        var thumbnailFilename = '$localPath/COVER_${downloadedItem.id}';
        // Save to filesystem
        final thumbnailFile = File(thumbnailFilename);
        var fileSystemEntity = await thumbnailFile.delete(recursive: false);

        if (kDebugMode)
          print(
              'download_manager cover deleted exists: ${fileSystemEntity.exists()}');
        downloadedItem = null;
      }
      if (downloadedItem != null) {
        if (downloadTasks?.isNotEmpty == true) {
          double perc = (downloadTasks?[0].progress)! / 100;
          if (perc >= 1.0) {
            emit(DownloadItemState.finished(
                downloadedItem.taskId,
                downloadedItem,
                downloadTasks?[0].status ?? DownloadTaskStatus.complete));
          } else {
            _bindBackgroundIsolate(detailPageModel, downloadedItem.taskId);
            emit(DownloadItemState.inprogress(
                perc,
                downloadedItem.taskId,
                downloadTasks?[0].status ?? DownloadTaskStatus.enqueued,
                downloadedItem));
          }
        } else {
          _bindBackgroundIsolate(detailPageModel, downloadedItem.taskId);
          emit(DownloadItemState.inprogress(
              0.0,
              downloadedItem.taskId,
              downloadTasks?[0].status ?? DownloadTaskStatus.enqueued,
              downloadedItem));
        }
      } else {
        emit(const Initial());
      }
    } else {
      emit(const Empty());
    }
  }

  bool canDownload(DetailPageModel detailPageModel) {
    if (detailPageModel.learningObjectTypology ==
            LearningObjectTypology.externalRes &&
        (detailPageModel.status == "E" ||
            detailPageModel.status == "P" ||
            detailPageModel.status == "C")) {
      return true;
    }
    return false;
  }

  void scheduleDownload(DetailPageModel detailPageModel, String? parentId,
      DetailPageArgs args) async {
    emit(const Loading());
    var downloadObjectInfoRes =
        await _retrieveDownloadInfoUseCase(detailPageModel.brightCoverId);
    await downloadObjectInfoRes.fold(
      (l) async {
        emit(const Error());
        emit(const Initial());
      },
      (downloadObjectInfoModel) async {
        SourceModel? downloadableModel =
            downloadObjectInfoModel?.getDownloadableContent();
        if (downloadableModel != null) {
          String url = downloadableModel.src ?? "";
          if (url.isEmpty) {
            emit(const Error());
            emit(const Initial());
          } else {
            // url = "https://www.quintic.com/software/sample_videos/Treadmill_Running_300fps.avi";
            final scheduleDownloadTaskRes = await _scheduleDownloadUseCase.call(
                url: url,
                detailPageModel: detailPageModel,
                downloadableModel: downloadableModel);
            await scheduleDownloadTaskRes.fold(
              (l) {
                emit(const Error());
                emit(const Initial());
              },
              (taskId) async {
                final startResumeRes = await _startResumeUseCase(
                    detailPageModel.id ?? 0, parentId ?? '');
                final int? tentativeId =
                    startResumeRes.fold((l) => null, (r) => r.tentativeId);

                _bindBackgroundIsolate(detailPageModel, taskId);
                double bookmark = 0;
                final res = await _getStateUseCase.call(
                    detailPageModel.learningObjectTypology,
                    detailPageModel.id.toString(),
                    "$tentativeId");
                res.fold((l) async {}, (r) async {
                  bookmark = r.attemptDuration!;
                });
                await _storeDownloadContentInfoUseCase.call(
                    detailPageModel,
                    taskId,
                    downloadableModel,
                    parentId ?? "",
                    "$tentativeId",
                    args,
                    bookmark);
                if (kDebugMode)
                  print(
                      "DownloadStripCubit scheduleDownload about to call refreshDownloadList");
                await refreshDownloadList();
                DownloadedItem? downloadedItem =
                    await _getStoredDownloadContentInfoUseCase
                        .call(detailPageModel.id.toString());
                DownloadTaskStatus downloadTaskStatus =
                    DownloadTaskStatus.enqueued;
                emit(Inprogress(
                    0.0, taskId, downloadTaskStatus, downloadedItem));
              },
            );
          }
        }
      },
    );
  }

  Future<void> cancelDownload(
      String taskId, DownloadedItem? downloadedItem, bool emitStatus) async {
    _unbindBackgroundIsolate();
    if (downloadedItem != null) {
      if (kDebugMode)
        print(
            'download_manager about to remove sharedcontent for ${downloadedItem.id}');
      _removeStoredDownloadContentInfoUseCase("VIDEO_${downloadedItem.id}");
      //delete thumbnail
      String? localPath = await _getSavedDir();
      var thumbnailFilename = '$localPath/COVER_${downloadedItem.id}';
      // Save to filesystem
      final thumbnailFile = File(thumbnailFilename);

      try {
        var fileSystemEntity = await thumbnailFile.delete(recursive: false);
        if (kDebugMode) {
          print(
              'download_manager cover deleted exists: ${fileSystemEntity.exists()}');
        }
      } catch (e) {
        if (kDebugMode) {
          print("download_manager exception: $e");
        }
      }
    }
    await _cancelDownloadUseCase(taskId: taskId);
    await _deleteDownloadUseCase(taskId: taskId);
    if (kDebugMode)
      print(
          "DownloadStripCubit cancelDownload about to call refreshDownloadList");
    await refreshDownloadList();
    if (emitStatus) {
      emit(const Initial());
    }
  }

  Future<String?> _getSavedDir() async {
    String? externalStorageDirPath;
    externalStorageDirPath =
        (await getApplicationDocumentsDirectory()).absolute.path;

    return externalStorageDirPath;
  }

  @pragma('vm:entry-point')
  static void downloadCallback(
    String id,
    int status,
    int progress,
  ) {
    if (kDebugMode)
      print(
          'download_manager Callback on background isolate: task ($id) is in status ($status) and process ($progress)');

    IsolateNameServer.lookupPortByName('downloader_send_port')
        ?.send([id, status, progress]);
  }

  void _unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

  Future<void> _bindBackgroundIsolate(
      DetailPageModel detailPageModel, String? incomingTaskId) async {
    if (kDebugMode)
      print(
          'download_manager _bindBackgroundIsolate incomingTaskId($incomingTaskId)');
    _unbindBackgroundIsolate();
    _port = ReceivePort();
    final isSuccess = IsolateNameServer.registerPortWithName(
      _port.sendPort,
      'downloader_send_port',
    );
    if (!isSuccess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate(detailPageModel, incomingTaskId);
      return;
    }
    if (kDebugMode)
      print('download_manager -------------($incomingTaskId)-------------');
    _port.listen((dynamic data) async {
      final taskId = (data as List<dynamic>)[0] as String;
      final status = DownloadTaskStatus.fromInt(data[1] as int);
      final progress = data[2] as int;
      if (kDebugMode)
        print(
            'download_manager Callback on UI isolate: incomingTaskId{$incomingTaskId}/task($taskId) is in status($status) process($progress)');
      if (taskId == incomingTaskId) {
        DownloadedItem? downloadedItem =
            await _getStoredDownloadContentInfoUseCase
                .call(detailPageModel.id.toString());
        if (status == DownloadTaskStatus.canceled ||
            status == DownloadTaskStatus.failed) {
          await cancelDownload(taskId, downloadedItem, false);
          emit(const Error());
          emit(const Initial());
        } else {
          double perc = progress / 100;
          if (kDebugMode)
            print('download_manager Callback on UI isolate about to update UI');
          if (progress >= 100) {
            emit(DownloadItemState.finished(taskId, downloadedItem, status));
          } else {
            emit(DownloadItemState.inprogress(
                perc, taskId, status, downloadedItem));
          }
        }
      }
    });
  }

  Future refreshDownloadList() async {
    if (kDebugMode) print("DownloadStripCubit in refreshDownloadList");
    await _downloadStripCubit.fetch();
  }
}
