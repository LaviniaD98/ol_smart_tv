part of 'pwd_recover_page_cubit.dart';

@freezed
class PwdRecoverState with _$PwdRecoverState {
  const factory PwdRecoverState.loading() = _loading;
  const factory PwdRecoverState.init(FormGroup form) = _init;
  const factory PwdRecoverState.error(String errorMessage) = _error;
  const factory PwdRecoverState.mfaValidation(bool remember, String userId) = _MfaValidation;
  const factory PwdRecoverState.confirmPassword() = _ConfirmPassword;
  const factory PwdRecoverState.success() = _Success;
}