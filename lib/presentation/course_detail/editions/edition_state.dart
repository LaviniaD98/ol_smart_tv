part of 'edition_cubit.dart';

@freezed
class EditionState with _$EditionState {
  const factory EditionState.initial() = Initial;
  const factory EditionState.loading() = Loading;
  const factory EditionState.register() = Register;
  const factory EditionState.registered() = Registered;
  const factory EditionState.success() = Success;
  const factory EditionState.error() = Error;
}
