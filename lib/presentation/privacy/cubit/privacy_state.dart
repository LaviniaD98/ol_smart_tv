part of 'privacy_cubit.dart';

@freezed
class PrivacyState with _$PrivacyState {
  const factory PrivacyState.initial() = _Initial;
  const factory PrivacyState.loading() = _Loading;
  const factory PrivacyState.error() = _Error;
  const factory PrivacyState.showInitiatives(
    CognitoUserSession? session,
    SelfModel selfModel,
    String? sessionId,
  ) = _ShowInitiatives;
}
