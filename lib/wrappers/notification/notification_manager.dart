import 'dart:io';

import 'package:open_learning_smart_tv/domain/use_cases/notification/notification_use_case.dart';
import 'package:open_learning_smart_tv/presentation/notification/notification_page.dart';
import 'package:open_learning_smart_tv/remote_theming/config/config_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/config/remote_config_keys.dart';
import 'package:open_learning_smart_tv/wrappers/notification/local_notification_manager.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../presentation/notification/cubit/notification_cubit.dart';
import '../../router/app_router.dart';

// @pragma('vm:entry-point')
// Future<void> _onBackgroundMessage(RemoteMessage message) async {
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   final database = LazyDatabase(() async {
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(join(dbFolder.path, 'app_db.sqlite'));
//     return NativeDatabase.createBackgroundConnection(file, logStatements: true);
//   });
//   LocalNotificationsDao(AppDatabase(database)).add(message: message);
// }

@singleton
class NotificationManager {
  final NotificationCubit _notificationCubit;
  final SharedPreferences _sharedPreferences;
  final NotificationUseCase _notificationUseCase;
  // final LocalNotificationsDao _localNotificationsDao;

  NotificationManager(
    this._notificationCubit,
    this._sharedPreferences,
    this._notificationUseCase,
    // this._localNotificationsDao,
  );

  /// Init FirebaseMassaging
  Future<void> initPushNotification() async {
    await FirebaseMessaging.instance.requestPermission();
    await _subscribeTokenAWS();
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);
    FirebaseMessaging.onMessage.listen(_onMessage);
    // FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
    FirebaseMessaging.instance.onTokenRefresh.listen((event) async {
      _subscribeTokenAWS(event);
    });

    if (Platform.isAndroid) {
      await LocalNotificationManager.I.init(
        (NotificationResponse response) => _navigate(),
      );
    }
  }

  Future<String?> _getToken() async {
    if (Platform.isIOS) {
      return await FirebaseMessaging.instance.getAPNSToken();
    } else {
      return await FirebaseMessaging.instance.getToken();
    }
  }

  Future<void> _subscribeTokenAWS([String? event]) async {
    String? token;
    if (event != null) {
      token = event;
    } else {
      token = await _getToken();
    }
    if (kDebugMode) print('Firebase Token: $token');
    var firebaseTokenSpKey =
        ConfigManager().getRemoteString(RemoteConfigKeys.firebase_token_sp_key);
    String? currentToken = _sharedPreferences.getString(firebaseTokenSpKey);
    if (currentToken != token) {
      var res = await _notificationUseCase.call('$token');
      res.fold((l) {
        if (kDebugMode) print(l);
      }, (r) async {
        await _sharedPreferences.setString(
          firebaseTokenSpKey,
          "$token",
        );
      });
    }
  }

  Future<bool> hasMessage() async {
    return await FirebaseMessaging.instance.getInitialMessage() != null;
  }

  Future<void> _onMessageOpenedApp(RemoteMessage message) async {
    if (message.notification == null) return;
    _notificationCubit.fetch();
    _navigate();
  }

  Future<void> _onMessage(RemoteMessage message) async {
    if (message.notification == null) return;
    // _localNotificationsDao.add(message: message);
    if (Platform.isAndroid) {
      LocalNotificationManager.I.show(message);
    }

    /// Reload Notification page
    _notificationCubit.fetch();
  }

  void _navigate() {
    final isNotificationRoute = AppRouter.I.router.routerDelegate
        .currentConfiguration.matches.last.matchedLocation
        .contains(NotificationPage.routeName);
    if (isNotificationRoute) {
      /// Reload Notification page
      _notificationCubit.fetch();
    } else {
      AppRouter.I.router.routeInformationParser.configuration.navigatorKey
          .currentContext!
          .goNamed(NotificationPage.routeName);
    }
  }
}
