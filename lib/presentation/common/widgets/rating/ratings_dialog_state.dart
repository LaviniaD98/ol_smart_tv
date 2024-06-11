part of 'ratings_dialog_cubit.dart';

@freezed
class RatingsDialogState with _$RatingsDialogState {
  const factory RatingsDialogState.success() = _Success;
  const factory RatingsDialogState.error() = _Error;
  const factory RatingsDialogState.loading() = _Loading;
}