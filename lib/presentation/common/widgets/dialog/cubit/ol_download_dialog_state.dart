part of 'ol_download_dialog_cubit.dart';

@freezed
class OlDownloadDialogState with _$OlDownloadDialogState {
  const factory OlDownloadDialogState.downloading() = Downloading;
  const factory OlDownloadDialogState.downloadError() = DownloadError;
  const factory OlDownloadDialogState.permissionError() = PermissionError;
  const factory OlDownloadDialogState.downloadSuccess(String filePath) = DownloadSuccess;
}
