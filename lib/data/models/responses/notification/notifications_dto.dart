import 'package:freezed_annotation/freezed_annotation.dart';

import 'notification_dto.dart';

part 'notifications_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class NotificationsDto {

  NotificationsDto(this.messageList);

  factory NotificationsDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationsDtoFromJson(json);

  @JsonKey()
  final List<NotificationDto> messageList;
}