import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'cognito_response.freezed.dart';
@freezed
class CognitoResponse with _$CognitoResponse {
  const factory CognitoResponse.cognitoUserNewPasswordRequired(CognitoUserNewPasswordRequiredException e) = _CognitoUserNewPasswordRequired;
  const factory CognitoResponse.cognitoUserMfaRequired() = _CognitoUserMfaRequired;
  const factory CognitoResponse.cognitoUserSelectMfaType() = _CognitoUserSelectMfaType;
  const factory CognitoResponse.cognitoUserMfaSetup() = _CognitoUserMfaSetup;
  const factory CognitoResponse.cognitoUserTotpRequired() = _CognitoUserTotpRequired;
  const factory CognitoResponse.cognitoUserCustomChallenge() = _CognitoUserCustomChallenge;
  const factory CognitoResponse.cognitoUserConfirmationNecessary() = _CognitoUserConfirmationNecessary;
  const factory CognitoResponse.cognitoAuthDenied() = _CognitoAuthDenied;
  const factory CognitoResponse.recoverPasswordError(String errorMessage) = _RecoverPasswordError;
}