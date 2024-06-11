part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.loading() = _Loading;
  const factory LoginState.initial(FormGroup form, LoginType loginType) = _Initial;
  const factory LoginState.error() = _Error;
  const factory LoginState.mfaValidation(bool remember, String userId) = _MfaValidation;
  const factory LoginState.showInitiatives(CognitoUserSession session, SelfModel selfModel, String sessionId) = _ShowInitiatives;
  const factory LoginState.showPolicyPage(CognitoUserSession session, SelfModel selfModel, String sessionId) = _ShowPolicyPage;
  const factory LoginState.firstLoginPasswordChange(String oldPwd, CognitoUserNewPasswordRequiredException exception) = _FirstLoginPasswordChange;
}
