import 'package:open_learning_smart_tv/data/models/requests/notification/set_notification_read_request.dart';
import 'package:open_learning_smart_tv/data/models/requests/register_device_body_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/notification/register_device_response.dart';
import 'package:dartz/dartz.dart';
import '../../../data/models/failure.dart';
import '../../entities/notification/notification_model.dart';

abstract class NotificationRepository {
  Future<Either<Failure, RegisterDeviceResponse?>> registerDevice(
      String path, RegisterDeviceBodyDto registerDeviceBodyDto);
  Future<Either<Failure, List<NotificationModel>>> getNotifications();
  Future<Either<Failure, List<NotificationModel>>> setRead(
      SetNotificationReadRequest req);
}
