// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeacherDto _$TeacherDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TeacherDto',
      json,
      ($checkedConvert) {
        final val = TeacherDto(
          $checkedConvert('id', (v) => v as int?),
          $checkedConvert('completeName', (v) => v as String?),
          $checkedConvert('operationalField', (v) => v as String?),
          $checkedConvert('image', (v) => v as String?),
        );
        return val;
      },
    );
