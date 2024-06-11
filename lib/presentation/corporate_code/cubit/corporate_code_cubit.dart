import 'package:open_learning_smart_tv/core/user_info_manager.dart';
import 'package:open_learning_smart_tv/domain/entities/corporate_code/corporate_code_model.dart';
import 'package:open_learning_smart_tv/domain/entities/self/self_model.dart';
import 'package:open_learning_smart_tv/domain/entities/user/user_info_model.dart';
import 'package:open_learning_smart_tv/domain/use_cases/clear_secure_stored_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/get_secure_stored_user_info_ss_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/get_secure_stored_user_info_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/get_user_self.dart';
import 'package:open_learning_smart_tv/domain/use_cases/openid_config/get_openid_config_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/session/check_session_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/session/create_session_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/session/get_stored_corporate_id_ss_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/set_secure_stored_user_info_use_case.dart';
import 'package:open_learning_smart_tv/presentation/app_state/cubit/app_cubit.dart';
import 'package:open_learning_smart_tv/wrappers/cognito_auth.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../core/env/env.dart';
import '../../../domain/use_cases/get_corporate_id_use_case.dart';
import '../../../domain/use_cases/openid_config/set_stored_openid_config_use_case.dart';
import '../../../domain/use_cases/set_stored_corporate_id_use_case.dart';
import '../../login/utils/corporate_code_form.dart';

part 'corporate_code_state.dart';
part 'corporate_code_cubit.freezed.dart';

@injectable
class CorporateCodeCubit extends Cubit<CorporateCodeState> {
  final Env _env;
  final SetStoredCorporateIdUseCase _setStoredCorporateIdUseCase;
  final GetCorporateIdUseCase _getCorporateIdUseCase;
  final CognitoAuthManager _cognitoAuthManager;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;
  final CheckSessionUseCase _checkSessionUseCase;
  final AppCubit _appCubit;
  final GetUserSelfUseCase _getUserSelfUseCase;
  final CreateSessionUseCase _createSessionUseCase;
  final SetSecureStoredUserInfoUseCase _setSecureStoredUserInfoUseCase;
  final GetOpenidConfigUseCase _getOpenidConfigUseCase;
  final SetStoredOpenidConfigUseCase _setStoredOpenidConfigUseCase;
  final ClearSecureStoredUseCase _clearSecureStoredUseCase;
  final GetStoredCorporateIdSsUseCase _getStoredCorporateIdSlUseCase;
  final GetSecureStoredUserInfoSsUseCase _getSecureStoredUserInfoSsUseCase;

  CorporateCodeCubit(
    this._env,
    this._setStoredCorporateIdUseCase,
    this._getCorporateIdUseCase,
    this._cognitoAuthManager,
    this._getSecureStoredUserInfoUseCase,
    this._checkSessionUseCase,
    this._appCubit,
    this._getUserSelfUseCase,
    this._createSessionUseCase,
    this._setSecureStoredUserInfoUseCase,
    this._getOpenidConfigUseCase,
    this._setStoredOpenidConfigUseCase,
    this._clearSecureStoredUseCase,
    this._getStoredCorporateIdSlUseCase,
    this._getSecureStoredUserInfoSsUseCase,
  ) : super(const CorporateCodeState.loading());

  void init(bool showSessionPopup) async {
    if (showSessionPopup) {
      await _clearSecureStoredUseCase();
      final form = CorporateCodeFormGroup.build();
      emit(const CorporateCodeState.showSessionPopup());
      emit(CorporateCodeState.initial(form));
    } else {
      CorporateCodeModel? corporateCodeModel =
          await _getStoredCorporateIdSlUseCase();
      UserInfoManager().setCorporateCodeModel(corporateCodeModel);
      UserInfoModel? userInfoModel = await _getSecureStoredUserInfoSsUseCase();
      UserInfoManager().setUserInfoModel(userInfoModel);
      final res = await _cognitoAuthManager.checkSession();
      res.fold(
        (l) async {
          await _clearSecureStoredUseCase();
          final form = CorporateCodeFormGroup.build();
          emit(CorporateCodeState.initial(form));
        },
        (r) {
          _handleSession(r);
        },
      );
    }
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
            final form = CorporateCodeFormGroup.build();
            emit(CorporateCodeState.initial(form));
          }, (checkSessionModel) async {
            UserInfoModel? userInfoModel =
                await _getSecureStoredUserInfoUseCase.call();
            String? sessionId = userInfoModel?.sessionId;
            _getUserSelf(session, sessionId!);
          });
        } else {
          _createSession(session);
        }
      }, (checkSessionModel) async {
        if (checkSessionModel.user?.initiativeid != initiativeId) {
          _createSession(session);
        } else {
          await _setSecureStoredUserInfoUseCase(
              UserInfoModel(sessionId, initiativeId, checkSessionModel.user));
          _getUserSelf(session, sessionId);
        }
      });
    } else {
      _createSession(session);
    }
  }

  Future<void> _createSession(CognitoUserSession session) async {
    final res = await _createSessionUseCase(session);
    res.fold((l) {
      final form = CorporateCodeFormGroup.build();
      emit(CorporateCodeState.initial(form));
    }, (r) {
      _getUserSelf(session, r);
    });
  }

  Future<void> _getUserSelf(
      CognitoUserSession session, String sessionId) async {
    final res =
        await _getUserSelfUseCase(session.accessToken.jwtToken, sessionId);
    res.fold((l) {
      final form = CorporateCodeFormGroup.build();
      emit(CorporateCodeState.initial(form));
    }, (r) async {
      if (r.privacyConsentFlag == false) {
        emit(CorporateCodeState.showPolicyPage(session, r, sessionId));
      } else {
        emit(CorporateCodeState.showInitiatives(session, r, sessionId));
      }
      final form = CorporateCodeFormGroup.build();
      await Future.delayed(const Duration(milliseconds: 300));
      emit(CorporateCodeState.initial(form));
    });
  }

  Future submitCode(String corporateCode) async {
    final currentState = state;
    emit(const CorporateCodeState.loading());
    final res = await _getCorporateIdUseCase(corporateCode);
    res.fold((failure) {
      emit(const CorporateCodeState.error());
      final form = CorporateCodeFormGroup.build();
      emit(CorporateCodeState.initial(form));
    }, (corporateCodeModel) async {
      if (corporateCodeModel.userpoolId == null) {
        emit(const CorporateCodeState.error());
        final form = CorporateCodeFormGroup.build();
        emit(CorporateCodeState.initial(form));
      } else {
        await _setStoredCorporateIdUseCase(corporateCodeModel);
        _getConfig(currentState, corporateCodeModel.userpoolId!);
      }
    });
  }

  Future<void> _getConfig(
      CorporateCodeState currentState, String userpool) async {
    final res = await _getOpenidConfigUseCase(_env.openidConfigUrl, userpool);
    res.fold((l) {
      emit(const CorporateCodeState.error());
      final form = CorporateCodeFormGroup.build();
      emit(CorporateCodeState.initial(form));
    }, (openidConfig) async {
      _setStoredOpenidConfigUseCase(openidConfig);
      emit(const CorporateCodeState.success());
      await Future.delayed(const Duration(milliseconds: 300));
      emit(currentState);
    });
  }
}
