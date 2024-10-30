import 'package:open_learning_smart_tv/data/models/requests/initiative_body_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/user/user_info_model.dart';
import 'package:open_learning_smart_tv/domain/use_cases/get_secure_stored_user_info_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/session/check_session_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/session/create_session_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/session/get_qr_code_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/session/set_initiative_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/set_secure_stored_user_info_use_case.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/domain/entities/cognito_response.dart';
import 'package:open_learning_smart_tv/wrappers/ol_cognito_storage.dart';

import '../domain/use_cases/session/get_stored_corporate_id_use_case.dart';

@lazySingleton
class CognitoAuthManager {
  final OlCognitoStorage _olCognitoStorage;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;
  final SetInitiativeUseCase _setInitiativeUseCase;
  final SetSecureStoredUserInfoUseCase _setSecureStoredUserInfoUseCase;
  final CreateSessionUseCase _createSessionUseCase;
  final CheckSessionUseCase _checkSessionUseCase;
  final GetStoredCorporateIdUseCase _getStoredCorporateIdUseCase;
  final GetQrCodeUseCase _getQrCodeUseCase;

  CognitoAuthManager(
    this._olCognitoStorage,
    this._getSecureStoredUserInfoUseCase,
    this._setInitiativeUseCase,
    this._setSecureStoredUserInfoUseCase,
    this._createSessionUseCase,
    this._checkSessionUseCase,
    this._getStoredCorporateIdUseCase,
    this._getQrCodeUseCase,
  );

  late CognitoUser cognitoUser;
  late CognitoUserPool userPool;

  Future<Either<CognitoResponse, CognitoUserSession>> login(
      AuthenticationDetails details) async {
    final corporateInfo = await _getStoredCorporateIdUseCase();
    userPool = CognitoUserPool(
      '${corporateInfo?.userpoolId}',
      '${corporateInfo?.clientId}',
      storage: _olCognitoStorage,
    );

    cognitoUser = CognitoUser(
      details.username,
      userPool,
      storage: _olCognitoStorage,
    );

    try {
      CognitoUserSession? session;
      cognitoUser.setAuthenticationFlowType("CUSTOM_AUTH");
      session = await cognitoUser.authenticateUser(details);
      return Right(session!);
    } on CognitoUserNewPasswordRequiredException catch (e) {
      return Left(CognitoResponse.cognitoUserNewPasswordRequired(e));
    } on CognitoUserMfaRequiredException catch (_) {
      return const Left(CognitoResponse.cognitoUserMfaRequired());
    } on CognitoUserSelectMfaTypeException catch (_) {
      return const Left(CognitoResponse.cognitoUserSelectMfaType());
    } on CognitoUserMfaSetupException catch (_) {
      return const Left(CognitoResponse.cognitoUserMfaSetup());
    } on CognitoUserTotpRequiredException catch (_) {
      return const Left(CognitoResponse.cognitoUserTotpRequired());
    } on CognitoUserCustomChallengeException catch (_) {
      return const Left(CognitoResponse.cognitoUserCustomChallenge());
    } on CognitoUserConfirmationNecessaryException catch (_) {
      return const Left(CognitoResponse.cognitoUserConfirmationNecessary());
    } on CognitoClientException catch (_) {
      return const Left(CognitoResponse.cognitoAuthDenied());
    } catch (e) {
      return const Left(CognitoResponse.cognitoAuthDenied());
    }
  }

  // TODO(UmbertoGrimaldi): Add method to perform qr code login based on the login method

  Future<dynamic> getQrCode() async {
    final res = await _getQrCodeUseCase.call();
    print('RES: $res');

    return res;
  }

  Future<Either<CognitoResponse, CognitoUserSession>> loginQR(
      AuthenticationDetails details) async {
    final corporateInfo = await _getStoredCorporateIdUseCase();
    userPool = CognitoUserPool(
      '${corporateInfo?.userpoolId}',
      '${corporateInfo?.clientId}',
      storage: _olCognitoStorage,
    );

    cognitoUser = CognitoUser(
      details.username,
      userPool,
      storage: _olCognitoStorage,
    );

    try {
      CognitoUserSession? session;
      cognitoUser.setAuthenticationFlowType("CUSTOM_AUTH");
      session = await cognitoUser.authenticateUser(details);
      return Right(session!);
    } on CognitoUserNewPasswordRequiredException catch (e) {
      return Left(CognitoResponse.cognitoUserNewPasswordRequired(e));
    } on CognitoUserMfaRequiredException catch (_) {
      return const Left(CognitoResponse.cognitoUserMfaRequired());
    } on CognitoUserSelectMfaTypeException catch (_) {
      return const Left(CognitoResponse.cognitoUserSelectMfaType());
    } on CognitoUserMfaSetupException catch (_) {
      return const Left(CognitoResponse.cognitoUserMfaSetup());
    } on CognitoUserTotpRequiredException catch (_) {
      return const Left(CognitoResponse.cognitoUserTotpRequired());
    } on CognitoUserCustomChallengeException catch (_) {
      return const Left(CognitoResponse.cognitoUserCustomChallenge());
    } on CognitoUserConfirmationNecessaryException catch (_) {
      return const Left(CognitoResponse.cognitoUserConfirmationNecessary());
    } on CognitoClientException catch (_) {
      return const Left(CognitoResponse.cognitoAuthDenied());
    } catch (e) {
      return const Left(CognitoResponse.cognitoAuthDenied());
    }
  }

  Future<Either<CognitoResponse, CognitoUserSession>> sendMFA(
      String code, int tentative) async {
    try {
      var tenative = <String, String>{"tentative": tentative.toString()};
      final cognitoUserSession =
          await cognitoUser.sendCustomChallengeAnswer(code, tenative);
      if (cognitoUserSession != null) {
        await cognitoUser.cacheTokens();
        return Right(cognitoUserSession);
      } else {
        return const Left(CognitoResponse.cognitoAuthDenied());
      }
    } on CognitoUserNewPasswordRequiredException catch (e) {
      return Left(CognitoResponse.cognitoUserNewPasswordRequired(e));
    } on CognitoUserMfaRequiredException catch (_) {
      return const Left(CognitoResponse.cognitoUserMfaRequired());
    } on CognitoUserSelectMfaTypeException catch (_) {
      return const Left(CognitoResponse.cognitoUserSelectMfaType());
    } on CognitoUserMfaSetupException catch (_) {
      return const Left(CognitoResponse.cognitoUserMfaSetup());
    } on CognitoUserTotpRequiredException catch (_) {
      return const Left(CognitoResponse.cognitoUserTotpRequired());
    } on CognitoUserCustomChallengeException catch (_) {
      return const Left(CognitoResponse.cognitoUserCustomChallenge());
    } on CognitoUserConfirmationNecessaryException catch (_) {
      return const Left(CognitoResponse.cognitoUserConfirmationNecessary());
    } on CognitoClientException catch (_) {
      return const Left(CognitoResponse.cognitoAuthDenied());
    } catch (e) {
      return const Left(CognitoResponse.cognitoAuthDenied());
    }
  }

  Future<CognitoResponse> resendMfaCodeToUser() async {
    try {
      var tenative = <String, String>{"tentative": "0"};
      await cognitoUser.sendCustomChallengeAnswer("0", tenative);
      return const CognitoResponse.cognitoUserCustomChallenge();
    } on CognitoUserNewPasswordRequiredException catch (e) {
      return CognitoResponse.cognitoUserNewPasswordRequired(e);
    } on CognitoUserMfaRequiredException catch (_) {
      return const CognitoResponse.cognitoUserMfaRequired();
    } on CognitoUserSelectMfaTypeException catch (_) {
      return const CognitoResponse.cognitoUserSelectMfaType();
    } on CognitoUserMfaSetupException catch (_) {
      return const CognitoResponse.cognitoUserMfaSetup();
    } on CognitoUserTotpRequiredException catch (_) {
      return const CognitoResponse.cognitoUserTotpRequired();
    } on CognitoUserCustomChallengeException catch (_) {
      return const CognitoResponse.cognitoUserCustomChallenge();
    } on CognitoUserConfirmationNecessaryException catch (_) {
      return const CognitoResponse.cognitoUserConfirmationNecessary();
    } on CognitoClientException catch (_) {
      return const CognitoResponse.cognitoAuthDenied();
    } catch (e) {
      return const CognitoResponse.cognitoAuthDenied();
    }
  }

  Future<Either<CognitoResponse, CognitoUserSession>> checkSession() async {
    try {
      final corporateInfo = await _getStoredCorporateIdUseCase();
      userPool = CognitoUserPool(
        '${corporateInfo?.userpoolId}',
        '${corporateInfo?.clientId}',
        storage: _olCognitoStorage,
      );

      final user = await userPool.getCurrentUser();

      final cognitoSession = await user?.getSession();
      if (cognitoSession != null && cognitoSession.isValid()) {
        return Right(cognitoSession);
      } else {
        return const Left(CognitoResponse.cognitoAuthDenied());
      }
    } catch (e) {
      return const Left(CognitoResponse.cognitoAuthDenied());
    }
  }

  Future<bool> logout() async {
    final corporateInfo = await _getStoredCorporateIdUseCase();
    userPool = CognitoUserPool(
      '${corporateInfo?.userpoolId}',
      '${corporateInfo?.clientId}',
      storage: _olCognitoStorage,
    );
    final user = await userPool.getCurrentUser();
    if (user != null) {
      await user.signOut();
      return true;
    }
    return false;
  }

  Future<Either<CognitoResponse, dynamic>> forgotPassword(
      AuthenticationDetails details) async {
    final corporateInfo = await _getStoredCorporateIdUseCase();
    userPool = CognitoUserPool(
      '${corporateInfo?.userpoolId}',
      '${corporateInfo?.clientId}',
      storage: _olCognitoStorage,
    );

    cognitoUser = CognitoUser(
      details.username,
      userPool,
      storage: _olCognitoStorage,
    );

    try {
      //cognitoUser.setAuthenticationFlowType("CUSTOM_RECOVER_PWD");
      var data = await cognitoUser.forgotPassword();
      return Right(data);
    } on CognitoClientException catch (exception) {
      if (exception.code?.isNotEmpty == true &&
          exception.code == "LimitExceededException") {
        return Left(CognitoResponse.recoverPasswordError(LabelsManager()
            .getRemoteStringFromLabelKeys(
                RemoteLabelKeys.cognito_recover_password_too_many_attempts)));
      } else {
        return Left(CognitoResponse.recoverPasswordError(LabelsManager()
            .getRemoteStringFromLabelKeys(
                RemoteLabelKeys.cognito_recover_password_generic_error)));
      }
    } catch (e) {
      return Left(CognitoResponse.recoverPasswordError(LabelsManager()
          .getRemoteStringFromLabelKeys(
              RemoteLabelKeys.cognito_recover_password_generic_error)));
    }
  }

  Future<Either<CognitoResponse, bool>> confirmPassword(
      String confirmationCode, String newPassword) async {
    try {
      var res =
          await cognitoUser.confirmPassword(confirmationCode, newPassword);
      return Right(res);
    } catch (e) {
      return const Left(CognitoResponse.cognitoAuthDenied());
    }
  }

  Future<Either<CognitoResponse, bool>> changePassword(
      String oldPassword, String newPassword) async {
    final corporateInfo = await _getStoredCorporateIdUseCase();
    userPool = CognitoUserPool(
      '${corporateInfo?.userpoolId}',
      '${corporateInfo?.clientId}',
      storage: _olCognitoStorage,
    );
    final user = await userPool.getCurrentUser();
    final cognitoSession = await user?.getSession();

    if (cognitoSession != null && cognitoSession.isValid()) {
      try {
        var res = await user!.changePassword(oldPassword, newPassword);
        return Right(res);
      } catch (e) {
        return const Left(CognitoResponse.cognitoAuthDenied()); // Altro errore?
      }
    }

    return const Left(CognitoResponse.cognitoAuthDenied());
  }

  Future<Either<CognitoResponse, CognitoUserSession?>> firstTimePasswordChange(
      String oldPassword,
      String newPassword,
      CognitoUserNewPasswordRequiredException e) async {
    try {
      final corporateInfo = await _getStoredCorporateIdUseCase();
      userPool = CognitoUserPool(
        '${corporateInfo?.userpoolId}',
        '${corporateInfo?.clientId}',
        storage: _olCognitoStorage,
      );
      final CognitoUserSession? res;
      if (e.requiredAttributes?.isEmpty == true) {
        res = await cognitoUser.sendNewPasswordRequiredAnswer(newPassword);
      } else {
        //Attributes would be mapped here
        //var res = await cognitoUser.sendNewPasswordRequiredAnswer(newPassword, attributes);
        return const Left(CognitoResponse.cognitoAuthDenied());
      }
      return Right(res);
    } catch (e) {
      return const Left(CognitoResponse.cognitoAuthDenied());
    }
  }

  Future<Either<CognitoResponse, CognitoUserSession>> refreshSession() async {
    final corporateInfo = await _getStoredCorporateIdUseCase();
    userPool = CognitoUserPool(
      '${corporateInfo?.userpoolId}',
      '${corporateInfo?.clientId}',
      storage: _olCognitoStorage,
    );
    final user = await userPool.getCurrentUser();
    final cognitoSession = await user?.getSession();

    if (cognitoSession != null &&
        cognitoSession.isValid() &&
        cognitoSession.getRefreshToken() != null) {
      try {
        final newCognitoSession =
            await user?.refreshSession(cognitoSession.getRefreshToken()!);
        if (newCognitoSession != null) {
          await user?.cacheTokens();
          UserInfoModel? userInfoModel =
              await _getSecureStoredUserInfoUseCase();
          if (userInfoModel?.initiativeId != null) {
            final initiativeId = userInfoModel?.initiativeId;
            final res = await _createSessionUseCase(newCognitoSession);
            return res.fold((l) {
              return const Left(CognitoResponse.cognitoAuthDenied());
            }, (sessionId) async {
              final setInitiativeUseCaseRes = await _setInitiativeUseCase(
                  newCognitoSession,
                  InitiativeBodyDto.fromPredefinedConfig(
                      sessionId: sessionId, initiativeId: initiativeId!));
              return setInitiativeUseCaseRes.fold((setInitiativeUseCaseError) {
                return const Left(CognitoResponse.cognitoAuthDenied());
              }, (newSessionId) async {
                final res =
                    await _checkSessionUseCase(newCognitoSession, newSessionId);
                return res.fold((l) async {
                  return const Left(CognitoResponse.cognitoAuthDenied());
                }, (checkSessionModel) async {
                  await _setSecureStoredUserInfoUseCase(UserInfoModel(
                      newSessionId, initiativeId, checkSessionModel.user));
                  return Right(newCognitoSession);
                });
              });
            });
          }
        }
      } on CognitoClientException {
        const Left(CognitoResponse.cognitoAuthDenied());
      }
    }
    return const Left(CognitoResponse.cognitoAuthDenied());
  }

  Future<CognitoUserSession?> getCurrentCognitoUserSession() async {
    final corporateInfo = await _getStoredCorporateIdUseCase();
    userPool = CognitoUserPool(
      '${corporateInfo?.userpoolId}',
      '${corporateInfo?.clientId}',
      storage: _olCognitoStorage,
    );
    final user = await userPool.getCurrentUser();
    final cognitoSession = await user?.getSession();
    return cognitoSession;
  }
}
