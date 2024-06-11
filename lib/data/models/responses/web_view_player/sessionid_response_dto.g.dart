// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sessionid_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionIdResponseDto _$SessionIdResponseDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SessionIdResponseDto',
      json,
      ($checkedConvert) {
        final val = SessionIdResponseDto(
          $checkedConvert('courseId', (v) => v as int?),
          $checkedConvert('learnerId', (v) => v as int?),
          $checkedConvert('learnerName', (v) => v as String?),
          $checkedConvert('tokenJwt', (v) => v as String?),
          $checkedConvert('sessionId', (v) => v as String?),
          $checkedConvert('iframeSrc', (v) => v as String?),
          $checkedConvert('userEmail', (v) => v as String?),
          $checkedConvert('userName', (v) => v as String?),
          $checkedConvert('corporateId', (v) => v as int?),
          $checkedConvert('initiativeId', (v) => v as int?),
          $checkedConvert('pathId', (v) => v as int?),
          $checkedConvert('activityId', (v) => v as int?),
          $checkedConvert('LO_type', (v) => v as String?),
          $checkedConvert('domain', (v) => v as String?),
          $checkedConvert('objectDescription', (v) => v as String?),
          $checkedConvert('objectName', (v) => v as String?),
          $checkedConvert('webURL', (v) => v as String?),
        );
        return val;
      },
    );
