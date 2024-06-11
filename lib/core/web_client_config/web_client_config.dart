import 'dart:developer';

import 'package:open_learning_smart_tv/domain/entities/user/user_info_model.dart';
import 'package:open_learning_smart_tv/domain/use_cases/get_secure_stored_user_info_use_case.dart';
import 'package:open_learning_smart_tv/presentation/app_state/cubit/app_cubit.dart';
import 'package:open_learning_smart_tv/remote_theming/config/config_manager.dart';
import 'package:open_learning_smart_tv/wrappers/cognito_auth.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../remote_theming/config/remote_config_keys.dart';

@lazySingleton
class AuthenticationInterceptor extends InterceptorsWrapper {
  final CognitoAuthManager _cognitoAuthManager;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;
  final AppCubit _appCubit;
  final Dio _dio;

  AuthenticationInterceptor(
    this._cognitoAuthManager,
    this._getSecureStoredUserInfoUseCase,
    this._appCubit,
    @Named(WebClientType.defaultClient) this._dio,
  );

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final res = await _cognitoAuthManager.checkSession();
    res.fold(
      (l) {
        if (kDebugMode) print("exception in checkSession $l");
        _refreshToken(options, null, handler);
        return;
      },
      (cognitoSession) {
        options.headers.putIfAbsent(
            'Authorization', () => cognitoSession.accessToken.jwtToken);
      },
    );
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase.call();
    String? sessionId = userInfoModel?.sessionId;
    if (sessionId != null) {
      options.headers.putIfAbsent('X-Ada-Session-Token', () => sessionId);
    } else {
      _refreshToken(options, null, handler);
      return;
    }
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      if (ConfigManager()
          .getRemoteBoolean(RemoteConfigKeys.handle_expired_session, false)) {
        _refreshToken(err.requestOptions, handler, null);
      } else {
        _appCubit.logout(showPopup: true);
      }
    } else {
      super.onError(err, handler);
    }
  }

  void _refreshToken(
      RequestOptions requestOptions,
      ErrorInterceptorHandler? eHandler,
      RequestInterceptorHandler? rhandler) async {
    final refreshBESessionResponse = await _cognitoAuthManager.refreshSession();
    refreshBESessionResponse.fold((l) async {
      _appCubit.logout(showPopup: true);
    }, (checkSessionModel) async {
      final options = Options(
        method: requestOptions.method,
        headers: requestOptions.headers,
      );

      UserInfoModel? userInfoModel =
          await _getSecureStoredUserInfoUseCase.call();
      String? sessionId = userInfoModel?.sessionId;
      if (sessionId != null) {
        options.headers?.remove('X-Ada-Session-Token');
        options.headers?.putIfAbsent('X-Ada-Session-Token', () => sessionId);
      }
      final res = await _cognitoAuthManager.checkSession();
      res.fold(
        (l) {
          if (kDebugMode) print("exception in checkSession $l");
          _refreshToken(requestOptions, null, rhandler);
          return;
        },
        (cognitoSession) {
          requestOptions.headers.putIfAbsent(
              'Authorization', () => cognitoSession.accessToken.jwtToken);
        },
      );

      try {
        final cloneReq = await _dio.request(
          requestOptions.path,
          options: options,
          data: requestOptions.data,
          queryParameters: requestOptions.queryParameters,
        );
        if (eHandler != null) {
          eHandler.resolve(cloneReq);
        } else if (rhandler != null) {
          rhandler.resolve(cloneReq);
        }
      } on DioException catch (e) {
        if (e.response?.statusCode == 401) {
          _appCubit.logout(showPopup: true);
        }
        if (eHandler != null) {
          eHandler.reject(e);
        } else if (rhandler != null) {
          rhandler.reject(e);
        }
      }
    });
  }

  Future<void> logout() async {
    _appCubit.logout();
  }
}

class WebClientType {
  static const defaultClient = 'default';
  static const cognitoAuthClient = 'cognitoAuthClient';
  static const authenticated = 'authenticated';
  static const dynamicUrlClient = 'dynamicUrlClient';

  WebClientType._();
}
