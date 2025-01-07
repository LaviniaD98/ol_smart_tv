import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/core/shared_preferences_keys.dart';
import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/core/utils/nav.dart';
import 'package:open_learning_smart_tv/presentation/corporate_code/corporate_code_page.dart';
import 'package:open_learning_smart_tv/presentation/ol_home_screen.dart';
import 'package:open_learning_smart_tv/remote_theming/config/config_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/config/remote_config_keys.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/domain/entities/menu/route/menu_route.dart';
import 'package:open_learning_smart_tv/wrappers/cognito_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../domain/use_cases/clear_secure_stored_use_case.dart';

part 'app_state.dart';

part 'app_cubit.freezed.dart';

@singleton
class AppCubit extends Cubit<AppState> {
  final CognitoAuthManager _cognitoAuthManager;
  final ClearSecureStoredUseCase _clearSecureStoredUseCase;
  final SharedPreferences _sharedPreferences;
  bool tutorialShown = false;
  bool onboardingShown = false;

  AppCubit(
    this._cognitoAuthManager,
    this._clearSecureStoredUseCase,
    this._sharedPreferences,
  ) : super(const AppState.initial());

  void updateRouter({
    required String initialRoute,
    required List<MenuRoute> dynamicRoutes,
  }) async {
    String? initial;

    if (state is _Initial) {
      final current = state as _Initial;
      emit(current.copyWith(
        initialRoute: initial ?? initialRoute,
        dynamicRoutes: dynamicRoutes,
        date: DateTime.now(),
      ));
    }
  }

  void reload(BuildContext context) {
    if (state is _Initial) {
      final current = state as _Initial;
      Nav.pushAndRemoveUntil(
        context,
        screen: OLHomeScreen(
          dynamicRoutes: current.dynamicRoutes ?? [],
        ),
      );

      // AppRouter.I.setRouter(
      //   initial: current.initialRoute,
      //   dynamicRoutes: current.dynamicRoutes,
      // );
      emit(current.copyWith(
        date: DateTime.now(),
      ));
    }
  }

  void logout({bool showPopup = false}) async {
    await _cognitoAuthManager.logout();
    WebViewCookieManager cookieManager = WebViewCookieManager();
    await cookieManager.clearCookies();
    await _clearSecureStoredUseCase();
    await ColorManager().retrieveBaseColors(rootBundle);
    if (!showPopup) {
      //avoid removing firebase token is the logout has been called from a 401 flow (showPopup == true)
      //FirebaseMessaging.instance.deleteToken();
    }
    _sharedPreferences.remove(ConfigManager()
        .getRemoteString(RemoteConfigKeys.firebase_token_sp_key));
    _sharedPreferences.remove(SharedPreferencesKeys.onboardingFlag);
    _sharedPreferences.remove(SharedPreferencesKeys.tutorialFlag);

    emit(
      AppState.initial(
        initialRoute: CorporateCodePage.routeName.path,
        date: DateTime.now(),
        showPopup: showPopup,
      ),
    );
  }

  bool isTutorialShown() {
    return tutorialShown;
  }

  void setTutorialShown(bool isShown) {
    tutorialShown = isShown;
  }

  bool isOnboardingShown() {
    return onboardingShown;
  }

  void setOnboardingShown(bool isShown) {
    onboardingShown = isShown;
  }
}
