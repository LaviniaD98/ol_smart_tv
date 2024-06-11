import 'dart:async';

import 'package:open_learning_smart_tv/core/shared_preferences_keys.dart';
import 'package:open_learning_smart_tv/presentation/app_state/cubit/app_cubit.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/domain/use_cases/get_stored_username_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/handler_stored_username_use_case.dart';
import 'package:open_learning_smart_tv/presentation/login/utils/login_form_group.dart';
import 'package:open_learning_smart_tv/wrappers/cognito_auth.dart';

import 'package:reactive_forms/reactive_forms.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/responses/corporate_code/corporate_code_dto.dart';
import '../../../domain/entities/self/self_model.dart';
import '../../../domain/entities/user/user_info_model.dart';
import '../../../domain/use_cases/get_secure_stored_user_info_use_case.dart';
import '../../../domain/use_cases/get_user_self.dart';
import '../../../domain/use_cases/session/check_session_use_case.dart';
import '../../../domain/use_cases/session/create_session_use_case.dart';
import '../../../domain/use_cases/session/get_stored_corporate_id_use_case.dart';
import '../../../domain/use_cases/set_secure_stored_user_info_use_case.dart';
import '../../../remote_theming/labels/remote_labels.dart';

part 'login_state.dart';

part 'login_cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final CognitoAuthManager _cognitoAuthManager;
  final GetStoredUsernameUseCase _getStoredUsernameUseCase;
  final HandlerStoredUsernameUseCase _handlerStoredUsernameUseCase;
  final CreateSessionUseCase _createSessionUseCase;
  final GetUserSelfUseCase _getUserSelfUseCase;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;
  final CheckSessionUseCase _checkSessionUseCase;
  final SetSecureStoredUserInfoUseCase _setSecureStoredUserInfoUseCase;
  final GetStoredCorporateIdUseCase _getStoredCorporateIdUseCase;
  final AppCubit _appCubit;
  final SharedPreferences _sharedPreferences;
  final RemoteLabels _remoteLabels;

  LoginCubit(
    this._cognitoAuthManager,
    this._getStoredUsernameUseCase,
    this._handlerStoredUsernameUseCase,
    this._createSessionUseCase,
    this._getUserSelfUseCase,
    this._getSecureStoredUserInfoUseCase,
    this._checkSessionUseCase,
    this._setSecureStoredUserInfoUseCase,
    this._getStoredCorporateIdUseCase,
    this._appCubit,
    this._sharedPreferences,
    this._remoteLabels,
  ) : super(const LoginState.loading());

  void init() async {
    final storedUsername = _getStoredUsernameUseCase();
    final form = LoginFormGroup.build(username: storedUsername);
    final corporateId = await _getStoredCorporateIdUseCase();

    /// Get remote labels
    await _remoteLabels.getLanguages(corporateId: corporateId?.id);
    await _sharedPreferences.setBool(
      SharedPreferencesKeys.loggedInViaSSO,
      false,
    );
    emit(LoginState.initial(form, corporateId?.loginType ?? LoginType.SSO));
  }

  Future<void> login(String username, String password, bool remember) async {
    final currentState = state;
    emit(const LoginState.loading());
    await _sharedPreferences.setBool(
      SharedPreferencesKeys.loggedInViaSSO,
      false,
    );
    final res = await _cognitoAuthManager.login(
      AuthenticationDetails(
        username: username,
        password: password,
      ),
    );
    res.fold(
      (l) => l.maybeWhen(
        cognitoUserCustomChallenge: () =>
            emit(LoginState.mfaValidation(remember, username)),
        cognitoUserNewPasswordRequired: (e) {
          emit(LoginState.firstLoginPasswordChange(password, e));
        },
        orElse: () => emit(const LoginState.error()),
      ),
      (r) async {
        await _handlerStoredUsernameUseCase(
            username: username, remember: remember);
        _handleSession(r);
      },
    );
    emit(currentState);
  }

  Future<void> _handleSession(CognitoUserSession session) async {
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase.call();

    String? sessionId = userInfoModel?.sessionId;
    int? initiativeId = userInfoModel?.initiativeId;
    if (sessionId != null) {
      final res = await _checkSessionUseCase(session, sessionId);
      res.fold((l) async {
        if (l.statusCode == 401) {
          final refreshBESessionResponse =
              await _cognitoAuthManager.refreshSession();
          refreshBESessionResponse.fold((l) async {
            _appCubit.logout();
            final storedUsername = _getStoredUsernameUseCase();
            final form = LoginFormGroup.build(username: storedUsername);
            final corporateId = await _getStoredCorporateIdUseCase();
            emit(LoginState.initial(
                form, corporateId?.loginType ?? LoginType.SSO));
          }, (checkSessionModel) async {
            UserInfoModel? userInfoModel =
                await _getSecureStoredUserInfoUseCase.call();
            String? sessionId = userInfoModel?.sessionId;
            _getUserSelf(session, sessionId!);
          });
        } else {
          _createSession(session, initiativeId);
        }
      }, (checkSessionModel) async {
        if (checkSessionModel.user?.initiativeid != initiativeId) {
          _createSession(session, initiativeId);
        } else {
          await _setSecureStoredUserInfoUseCase(
              UserInfoModel(sessionId, initiativeId, checkSessionModel.user));
          _getUserSelf(session, sessionId);
        }
      });
    } else {
      _createSession(session, initiativeId);
    }
  }

  Future<void> _createSession(
      CognitoUserSession session, int? initiativeId) async {
    final res = await _createSessionUseCase(session);
    res.fold((l) async {
      final storedUsername = _getStoredUsernameUseCase();
      final form = LoginFormGroup.build(username: storedUsername);
      final corporateId = await _getStoredCorporateIdUseCase();
      emit(const LoginState.error());
      emit(LoginState.initial(form, corporateId?.loginType ?? LoginType.SSO));
    }, (sessionId) async {
      final res = await _checkSessionUseCase(session, sessionId);
      res.fold((l) async {}, (checkSessionModel) async {
        await _setSecureStoredUserInfoUseCase(
            UserInfoModel(sessionId, initiativeId, checkSessionModel.user));
      });
      _getUserSelf(session, sessionId);
    });
  }

  Future<void> _getUserSelf(
      CognitoUserSession session, String sessionId) async {
    final res =
        await _getUserSelfUseCase(session.accessToken.jwtToken, sessionId);
    res.fold((l) {
      emit(const LoginState.error());
    }, (r) async {
      if (r.privacyConsentFlag == false) {
        emit(LoginState.showPolicyPage(session, r, sessionId));
      } else {
        emit(LoginState.showInitiatives(session, r, sessionId));
      }
    });
  }
}
