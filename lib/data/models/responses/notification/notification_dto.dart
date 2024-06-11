import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/date_time_converter.dart';

part 'notification_dto.g.dart';

@JsonSerializable(
  createToJson: false,
  checked: true,
  includeIfNull: false,
  converters: [DateTimeConverter()],
)
class NotificationDto {
  NotificationDto(
    this.userId,
    this.outputChannel,
    this.eventSentId,
    this.createdDate,
    this.isSent,
    this.isRead,
    this.sendDate,
    this.title,
    this.description,
  );

  factory NotificationDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationDtoFromJson(json);

  @JsonKey()
  final String userId;
  @JsonKey()
  final String? outputChannel;
  @JsonKey()
  final int eventSentId;
  @JsonKey()
  final DateTime? createdDate;
  @JsonKey()
  final String? isSent;
  @JsonKey()
  final String? isRead;
  @JsonKey()
  final DateTime? sendDate;
  @JsonKey()
  final String? title;
  @JsonKey()
  final String? description;
}