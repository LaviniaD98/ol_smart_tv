part of 'mfa_cubit.dart';

@freezed
class MfaState with _$MfaState {
  const factory MfaState.initial() = _Initial;
  const factory MfaState.loading() = _Loading;
  const factory MfaState.error() = _Error;
  const factory MfaState.showInitiatives(CognitoUserSession session, SelfModel selfModel, String sessionId) = _ShowInitiatives;
  const factory MfaState.recoverPassword(String code) = _RecoverPassword;
  const factory MfaState.tryAgain(int tentative) = _TryAgain;
  const factory MfaState.showPolicyPage(CognitoUserSession session, SelfModel selfModel, String sessionId) = _ShowPolicyPage;
}
