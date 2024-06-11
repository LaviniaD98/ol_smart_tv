part of 'pwd_reset_page_cubit.dart';

@freezed
class PwdResetState with _$PwdResetState {
  const factory PwdResetState.loading() = _loading;
  const factory PwdResetState.init(FormGroup form) = _init;
  const factory PwdResetState.error(RemoteLabelKeys messageKey) = _error;
  const factory PwdResetState.success() = _Success;
}