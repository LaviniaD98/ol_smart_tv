part of 'local_card_status_cubit.dart';

@freezed
class LocalCardStatusState with _$LocalCardStatusState {
  const factory LocalCardStatusState.loading() = Loading;
  const factory LocalCardStatusState.done(DownloadedItem? downloadedItem) = _Done;
}
