part of 'download_item_cubit.dart';

@freezed
class DownloadItemState with _$DownloadItemState {
  const factory DownloadItemState.initial() = Initial;
  const factory DownloadItemState.empty() = Empty;
  const factory DownloadItemState.inprogress(double progress, String? taskId, DownloadTaskStatus downloadTaskStatus, DownloadedItem? downloadedItem) = Inprogress;
  const factory DownloadItemState.finished(String? taskId, DownloadedItem? downloadedItem, DownloadTaskStatus downloadTaskStatus) = Finished;
  const factory DownloadItemState.loading() = Loading;
  const factory DownloadItemState.error() = Error;
}
