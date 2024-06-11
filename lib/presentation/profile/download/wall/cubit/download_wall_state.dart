part of 'download_wall_cubit.dart';

@freezed
class DownloadWallState with _$DownloadWallState {
  const factory DownloadWallState.success({required List<DownloadedItemExtended>? items}) = Success;
  const factory DownloadWallState.loading() = Loading;
  const factory DownloadWallState.fetch() = Fetch;
  const factory DownloadWallState.error() = Error;
  const factory DownloadWallState.syncing() = _Syncing;
  const factory DownloadWallState.done() = _Done;
  const factory DownloadWallState.showOfflineDialog() = ShowOfflineDialog;
  const factory DownloadWallState.showOnlineDialog({required DateTime date}) = ShowOnlineDialog;
}
