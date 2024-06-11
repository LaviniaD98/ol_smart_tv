part of 'sso_cubit.dart';

@freezed
class SsoState with _$SsoState {
  const factory SsoState.loading() = _Loading;
  const factory SsoState.initial(String ssoLoginUrl, String ssoCodeRedirectUrl) = _Initial;
  const factory SsoState.success(CognitoUserSession session, SelfModel selfModel, String sessionId) = _Success;
  const factory SsoState.showPolicyPage(CognitoUserSession session, SelfModel selfModel, String sessionId) = _ShowPolicyPage;
  const factory SsoState.error() = _Error;
}
