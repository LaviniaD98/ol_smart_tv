part of 'corporate_code_cubit.dart';

@freezed
class CorporateCodeState with _$CorporateCodeState {
  const factory CorporateCodeState.initial(FormGroup form) = _Initial;
  const factory CorporateCodeState.success() = _Success;
  const factory CorporateCodeState.loading() = _Loading;
  const factory CorporateCodeState.error() = _Error;
  const factory CorporateCodeState.showInitiatives(CognitoUserSession session, SelfModel selfModel, String sessionId) = _ShowInitiatives;
  const factory CorporateCodeState.showPolicyPage(CognitoUserSession session, SelfModel selfModel, String sessionId) = _ShowPolicyPage;
  const factory CorporateCodeState.showSessionPopup() = _ShowSessionPopup;
}