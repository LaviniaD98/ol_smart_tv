import 'package:open_learning_smart_tv/data/models/requests/register_device_body_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/notification/register_device_response.dart';

import '../../models/requests/notification/set_notification_read_request.dart';
import '../../models/responses/notification/notifications_dto.dart';

abstract class NotificationDataSource {
  Future<RegisterDeviceResponse?> registerDevice(
      String path, RegisterDeviceBodyDto registerDeviceBodyDto);
  Future<NotificationsDto?> getNotifications();
  Future<NotificationsDto?> setRead(SetNotificationReadRequest req);
}
