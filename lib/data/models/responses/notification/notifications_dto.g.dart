// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationsDto _$NotificationsDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'NotificationsDto',
      json,
      ($checkedConvert) {
        final val = NotificationsDto(
          $checkedConvert(
              'messageList',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      NotificationDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );
