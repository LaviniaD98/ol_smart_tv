import 'package:open_learning_smart_tv/core/env/env.dart';
import 'package:open_learning_smart_tv/core/shared_preferences_keys.dart';
import 'package:open_learning_smart_tv/core/user_info_manager.dart';
import 'package:bloc/bloc.dart';
import 'package:open_learning_smart_tv/wrappers/cognito_auth.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entities/smart_configurator/smart_configurator_model.dart';
import '../../../domain/use_cases/smart_configurator/get_stored_smart_configuration_use_case.dart';
import '../../../domain/entities/self/self_model.dart';
import '../../../domain/entities/user/user_info_model.dart';
import '../../../domain/use_cases/clear_secure_stored_info_use_case.dart';
import '../../../domain/use_cases/get_secure_stored_user_info_use_case.dart';
import '../../../domain/use_cases/get_user_self.dart';

part 'settings_state.dart';
part 'settings_cubit.freezed.dart';

@injectable
class SettingsCubit extends Cubit<SettingsState> {
  final GetStoredSmartConfigurationUseCase _getStoredSmartConfigurationUseCase;
  final CognitoAuthManager _cognitoAuthManager;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;
  final ClearSecureStoredInitiativeUseCase _clearSecureStoredInitiativeUseCase;
  final GetUserSelfUseCase _getUserSelfUseCase;
  final SharedPreferences _sharedPreferences;
  final Env _env;

  SettingsCubit(
    this._getStoredSmartConfigurationUseCase,
    this._cognitoAuthManager,
    this._getSecureStoredUserInfoUseCase,
    this._clearSecureStoredInitiativeUseCase,
    this._getUserSelfUseCase,
    this._sharedPreferences,
    this._env,
  ) : super(const SettingsState.loading());

  PackageInfo? packageInfo;

  Future init() async {
    bool? loggedInViaSSO =
        _sharedPreferences.getBool(SharedPreferencesKeys.loggedInViaSSO);
    final smartConfig = await _getStoredSmartConfigurationUseCase();
    if (kDebugMode) print("loggedInViaSSO: $loggedInViaSSO");
    packageInfo = await PackageInfo.fromPlatform();
    emit(SettingsState.initial(
        smartConfig: smartConfig, loggedInViaSSO: loggedInViaSSO));
  }

  Future<void> goToInitiatives() async {
    emit(const SettingsState.loading());
    final smartConfig = await _getStoredSmartConfigurationUseCase();

    var sessionRes = await _cognitoAuthManager.checkSession();
    sessionRes.fold(
      (l) {
        print('1-------csdcsdcs');
        emit(const SettingsState.error());
        bool? loggedInViaSSO =
            _sharedPreferences.getBool(SharedPreferencesKeys.loggedInViaSSO);
        if (kDebugMode) print("loggedInViaSSO: $loggedInViaSSO");
        emit(
          SettingsState.initial(
            smartConfig: smartConfig,
            loggedInViaSSO: loggedInViaSSO,
          ),
        );
      },
      (session) async {
        print('2-------csdcsdcs');
        UserInfoModel? userInfoModel =
            await _getSecureStoredUserInfoUseCase.call();
        String? sessionId = userInfoModel?.sessionId;

        final userSelfRes =
            await _getUserSelfUseCase(session.accessToken.jwtToken, sessionId);
        userSelfRes.fold((l) {
          bool? loggedInViaSSO =
              _sharedPreferences.getBool(SharedPreferencesKeys.loggedInViaSSO);
          emit(const SettingsState.error());
          emit(
            SettingsState.initial(
              smartConfig: smartConfig,
              loggedInViaSSO: loggedInViaSSO,
            ),
          );
        }, (userSelf) async {
          // Questa chiamata resetta solo l'iniziativa
          await _clearSecureStoredInitiativeUseCase.call();
          UserInfoManager().clearInitiative();

          emit(
            SettingsState.goToInitiatives(
              session: session,
              sessionId: sessionId,
              selfModel: userSelf,
            ),
          );
        });
      },
    );
  }

  String getFreshDeskHtmlPageUrl() {
    return _env.freshDeskHtmlPageUrl;
  }
}
