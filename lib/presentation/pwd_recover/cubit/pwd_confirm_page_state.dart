part of 'pwd_confirm_page_cubit.dart';

@freezed
class PwdConfirmState with _$PwdConfirmState {
  const factory PwdConfirmState.loading() = _loading;
  const factory PwdConfirmState.init(FormGroup form) = _init;
  const factory PwdConfirmState.error() = _error;
  const factory PwdConfirmState.success() = _Success;
}