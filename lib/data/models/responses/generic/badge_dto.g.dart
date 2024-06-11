// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'badge_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BadgeDto _$BadgeDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'BadgeDto',
      json,
      ($checkedConvert) {
        final val = BadgeDto(
          $checkedConvert('id', (v) => v as int?),
          $checkedConvert('name', (v) => v as String?),
          $checkedConvert('description', (v) => v as String?),
          $checkedConvert('learningObjectTitle', (v) => v as String?),
          $checkedConvert('learningObjectId', (v) => v as int?),
          $checkedConvert('path', (v) => v as String?),
          $checkedConvert('expiresInMonths', (v) => v as int?),
          $checkedConvert('templatePath', (v) => v as String?),
          $checkedConvert('issuedOn', (v) => v as String?),
          $checkedConvert('isEnable', (v) => v as bool?),
          $checkedConvert('type', (v) => v as String?),
          $checkedConvert('iconURL', (v) => v as String?),
        );
        return val;
      },
    );
