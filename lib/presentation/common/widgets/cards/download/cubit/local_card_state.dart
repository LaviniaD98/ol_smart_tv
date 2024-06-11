part of 'local_card_cubit.dart';

@freezed
class LocalCardState with _$LocalCardState {
  const factory LocalCardState.loading() = Loading;
  const factory LocalCardState.done(DownloadedItemExtended data, BuildContext parentContext) = _Done;
}
