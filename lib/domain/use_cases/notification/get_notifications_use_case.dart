import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:open_learning_smart_tv/domain/entities/notification/notification_model.dart';
import 'package:open_learning_smart_tv/domain/repositories/notification/notification_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetNotificationsUseCase {
  final NotificationRepository _repository;
  GetNotificationsUseCase(this._repository);

  Future<Either<Failure, List<NotificationModel>>> call() async {
    return await _repository.getNotifications();
  }
}
