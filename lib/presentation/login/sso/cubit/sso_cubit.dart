import 'package:open_learning_smart_tv/core/env/env.dart';
import 'package:open_learning_smart_tv/core/shared_preferences_keys.dart';
import 'package:open_learning_smart_tv/data/models/requests/auth_token_body_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/self/self_model.dart';
import 'package:open_learning_smart_tv/domain/use_cases/get_user_self.dart';
import 'package:open_learning_smart_tv/domain/use_cases/oauth_token_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/session/create_session_use_case.dart';
import 'package:open_learning_smart_tv/wrappers/ol_cognito_storage.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../domain/use_cases/openid_config/get_stored_openid_config_use_case.dart';
import '../../../../domain/use_cases/session/get_stored_corporate_id_use_case.dart';

part 'sso_state.dart';

part 'sso_cubit.freezed.dart';

@injectable
class SsoCubit extends Cubit<SsoState> {
  final OlCognitoStorage _olCognitoStorage;
  final OauthTokenUseCase _oauthTokenUseCase;
  final CreateSessionUseCase _createSessionUseCase;
  final GetUserSelfUseCase _getUserSelfUseCase;
  final GetStoredCorporateIdUseCase _getStoredCorporateIdUseCase;
  final GetStoredOpenidConfigUseCase _getStoredOpenidConfigUseCase;
  final SharedPreferences _sharedPreferences;

  final Env env;

  SsoCubit(
    this._olCognitoStorage,
    this._oauthTokenUseCase,
    this._createSessionUseCase,
    this._getUserSelfUseCase,
    this._getStoredCorporateIdUseCase,
    this._getStoredOpenidConfigUseCase,
    this._sharedPreferences,
    this.env,
  ) : super(const SsoState.loading());

  void init() async {
    var corporateInfo = await _getStoredCorporateIdUseCase();
    var openidConfig = await _getStoredOpenidConfigUseCase();

    var url =
        '${openidConfig?.authorizationEndpoint}?response_type=code&client_id={clientId}&scope=email+openid&redirect_uri={ssoRedirectUrl}'
            .replaceFirst('{clientId}', '${corporateInfo?.clientId}')
            .replaceFirst(
                '{ssoRedirectUrl}', '${corporateInfo?.ssoRedirectUrl}');
    String ssoCodeRedirectUrl = '${corporateInfo?.ssoRedirectUrl}';
    emit(SsoState.initial(url, '$ssoCodeRedirectUrl/?code='));
  }

  Future signUserInWithAuthCode(String authCode) async {
    final corporateInfo = await _getStoredCorporateIdUseCase();
    CognitoUserPool userPool = CognitoUserPool(
      '${corporateInfo?.userpoolId}',
      '${corporateInfo?.clientId}',
      storage: _olCognitoStorage,
    );
    final authTokenBodyDto = AuthTokenBodyDto(
        '${corporateInfo?.clientId}',
        authCode,
        "authorization_code",
        "profile",
        '${corporateInfo?.ssoRedirectUrl}');
    final res = await _oauthTokenUseCase.call(
        authCode,
        corporateInfo?.userpoolId
                ?.substring(0, corporateInfo.userpoolId?.indexOf('_')) ??
            "",
        authTokenBodyDto);
    res.fold((l) {
      emit(const SsoState.error());
    }, (authTokenResponseModel) async {
      emit(const SsoState.loading());

      final idToken = CognitoIdToken(authTokenResponseModel.idToken);
      final accessToken =
          CognitoAccessToken(authTokenResponseModel.accessToken);
      final refreshToken =
          CognitoRefreshToken(authTokenResponseModel.refreshToken);
      final session =
          CognitoUserSession(idToken, accessToken, refreshToken: refreshToken);

      await _sharedPreferences.setBool(
        SharedPreferencesKeys.loggedInViaSSO,
        true,
      );

      await _createSession(false, session, userPool);
    });
  }

  Future<void> _createSession(bool remember, CognitoUserSession session,
      CognitoUserPool userPool) async {
    final res = await _createSessionUseCase(session);
    res.fold((l) {
      emit(const SsoState.error());
    }, (sessionId) {
      _getUserSelf(remember, session, sessionId, userPool);
    });
  }

  Future<void> _getUserSelf(bool remember, CognitoUserSession session,
      String sessionId, CognitoUserPool userPool) async {
    final res =
        await _getUserSelfUseCase(session.accessToken.jwtToken, sessionId);
    res.fold((l) {
      emit(const SsoState.error());
    }, (selfModel) async {
      final user = CognitoUser(selfModel.externalId, userPool,
          storage: _olCognitoStorage, signInUserSession: session);
      await user.cacheTokens();
      if (selfModel.privacyConsentFlag == false) {
        emit(SsoState.showPolicyPage(session, selfModel, sessionId));
      } else {
        emit(SsoState.success(session, selfModel, sessionId));
      }
    });
  }
}
