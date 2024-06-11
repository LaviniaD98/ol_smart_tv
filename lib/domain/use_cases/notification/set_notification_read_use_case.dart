import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:open_learning_smart_tv/domain/entities/notification/notification_model.dart';
import 'package:open_learning_smart_tv/domain/repositories/notification/notification_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/requests/notification/set_notification_read_request.dart';

@LazySingleton()
class SetNotificationsUseCase {
  final NotificationRepository _repository;
  SetNotificationsUseCase(this._repository);

  Future<Either<Failure, List<NotificationModel>>> call(int id) async {
    final req = SetNotificationReadRequest(
      messageIds: [id],
      readStatus: 'Y',
    );
    return await _repository.setRead(req);
  }
}
