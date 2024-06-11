part of 'download_strip_cubit.dart';

@freezed
class DownloadStripState with _$DownloadStripState {
  const factory DownloadStripState.success({required List<DownloadedItemExtended>? items}) = Success;
  const factory DownloadStripState.loading() = Loading;
  const factory DownloadStripState.fetch() = Fetch;
  const factory DownloadStripState.error() = Error;
}
