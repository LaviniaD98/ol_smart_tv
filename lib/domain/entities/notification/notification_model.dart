import '../../../data/models/responses/notification/notification_dto.dart';
import '../../enums/types.dart';

class NotificationModel {
  const NotificationModel({
    required this.userId,
    required this.eventSentId,
    required this.createdDate,
    required this.isRead,
    required this.sendDate,
    required this.title,
    required this.description,
    required this.type,
  });

  final String userId;
  final int eventSentId;
  final DateTime? createdDate;
  final bool isRead;
  final DateTime? sendDate;
  final String title;
  final String description;
  final LocalNotificationType type;

  factory NotificationModel.fromDto(NotificationDto dto) {
    return NotificationModel(
      userId: dto.userId,
      eventSentId: dto.eventSentId,
      createdDate: dto.createdDate,
      isRead: dto.isRead == 'Y',
      sendDate: dto.sendDate,
      title: dto.title ?? '',
      description: dto.description ?? '',
      type: LocalNotificationType.reminder,
    );
  }
}
