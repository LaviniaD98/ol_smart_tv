// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_session_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckSessionDto _$CheckSessionDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CheckSessionDto',
      json,
      ($checkedConvert) {
        final val = CheckSessionDto(
          $checkedConvert('sessionId', (v) => v as String?),
          $checkedConvert('initiativeId', (v) => v as String?),
          $checkedConvert(
              'user',
              (v) => v == null
                  ? null
                  : UserDto.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );
