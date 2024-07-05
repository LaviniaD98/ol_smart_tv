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
          $checkedConvert('id', (v) => (v as num?)?.toInt()),
          $checkedConvert('name', (v) => v as String?),
          $checkedConvert('description', (v) => v as String?),
          $checkedConvert('learningObjectTitle', (v) => v as String?),
          $checkedConvert('learningObjectId', (v) => (v as num?)?.toInt()),
          $checkedConvert('path', (v) => v as String?),
          $checkedConvert('expiresInMonths', (v) => (v as num?)?.toInt()),
          $checkedConvert('templatePath', (v) => v as String?),
          $checkedConvert('issuedOn', (v) => v as String?),
          $checkedConvert('isEnable', (v) => v as bool?),
          $checkedConvert('type', (v) => v as String?),
          $checkedConvert('iconURL', (v) => v as String?),
        );
        return val;
      },
    );
