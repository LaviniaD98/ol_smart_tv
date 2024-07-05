// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationDto _$NotificationDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'NotificationDto',
      json,
      ($checkedConvert) {
        final val = NotificationDto(
          $checkedConvert('userId', (v) => v as String),
          $checkedConvert('outputChannel', (v) => v as String?),
          $checkedConvert('eventSentId', (v) => (v as num).toInt()),
          $checkedConvert('createdDate',
              (v) => const DateTimeConverter().fromJson(v as String?)),
          $checkedConvert('isSent', (v) => v as String?),
          $checkedConvert('isRead', (v) => v as String?),
          $checkedConvert('sendDate',
              (v) => const DateTimeConverter().fromJson(v as String?)),
          $checkedConvert('title', (v) => v as String?),
          $checkedConvert('description', (v) => v as String?),
        );
        return val;
      },
    );
