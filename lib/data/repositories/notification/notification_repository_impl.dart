import 'package:open_learning_smart_tv/data/data_sources/notification/notification_data_source.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:open_learning_smart_tv/data/models/requests/register_device_body_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/notification/register_device_response.dart';
import 'package:open_learning_smart_tv/domain/repositories/notification/notification_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/notification/notification_model.dart';
import '../../models/requests/notification/set_notification_read_request.dart';

@LazySingleton(as: NotificationRepository)
class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationDataSource _notificationDataSource;

  NotificationRepositoryImpl(this._notificationDataSource);

  @override
  Future<Either<Failure, RegisterDeviceResponse?>> registerDevice(
      String path, RegisterDeviceBodyDto registerDeviceBodyDto) {
    return catchFailure(() async {
      return await _notificationDataSource.registerDevice(
          path, registerDeviceBodyDto);
    });
  }

  @override
  Future<Either<Failure, List<NotificationModel>>> getNotifications() {
    return catchFailure(() async {
      final res = await _notificationDataSource.getNotifications();
      return res?.messageList
              .map((e) => NotificationModel.fromDto(e))
              .toList() ??
          [];
    });
  }

  @override
  Future<Either<Failure, List<NotificationModel>>> setRead(
      SetNotificationReadRequest req) {
    return catchFailure(() async {
      final res = await _notificationDataSource.setRead(req);
      return res?.messageList
              .map((e) => NotificationModel.fromDto(e))
              .toList() ??
          [];
    });
  }
}
