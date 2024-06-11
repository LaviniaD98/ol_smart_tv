import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationManager {

  static final LocalNotificationManager I = LocalNotificationManager._();
  LocalNotificationManager._();

  final _localNotification = FlutterLocalNotificationsPlugin();

  /// Init LocalNotification
  Future<void> init(void Function(NotificationResponse) onTap) async {
    const iOS = DarwinInitializationSettings();
    const android = AndroidInitializationSettings('@mipmap/ic_stat_notification');
    const settings = InitializationSettings(iOS: iOS, android: android);
    await _localNotification.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
    );
  }

  void show(RemoteMessage message) async {
    /// Android Settings
    const androidChannel = AndroidNotificationChannel(
      'ol_android_channel',
      'Open Learning Channel',
      importance: Importance.defaultImportance,
    );

    _localNotification.show(
      message.notification.hashCode,
      message.notification!.title,
      message.notification!.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          androidChannel.id,
          androidChannel.name,
          channelDescription: androidChannel.description,
        ),
      ),
      payload: jsonEncode(message.toMap()),
    );
  }
}
