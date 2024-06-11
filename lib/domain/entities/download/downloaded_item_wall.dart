import 'package:open_learning_smart_tv/domain/entities/download/downloaded_item.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

class DownloadedItemExtended {
  DownloadedItemExtended({
    this.downloadedItem,
    this.taskId,
    this.downloadTask,
    required this.status,
    required this.progress,
  });

  DownloadedItem? downloadedItem;
  final String? taskId;
  DownloadTask? downloadTask;
  DownloadTaskStatus status;
  int progress;

  set updateTask(DownloadTask downloadTask) {
    this.downloadTask = downloadTask;
  }
}
