// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeacherDetailDto _$TeacherDetailDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TeacherDetailDto',
      json,
      ($checkedConvert) {
        final val = TeacherDetailDto(
          $checkedConvert('completeName', (v) => v as String?),
          $checkedConvert('description', (v) => v as String?),
          $checkedConvert('image', (v) => v as String?),
          $checkedConvert('email', (v) => v as String?),
        );
        return val;
      },
    );
