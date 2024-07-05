// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_activity_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningActivityDto _$LearningActivityDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'LearningActivityDto',
      json,
      ($checkedConvert) {
        final val = LearningActivityDto(
          $checkedConvert('id', (v) => (v as num?)?.toInt()),
          $checkedConvert('courseId', (v) => (v as num?)?.toInt()),
          $checkedConvert('title', (v) => v as String?),
          $checkedConvert('isMandatory', (v) => v as bool?),
          $checkedConvert('isFavourite', (v) => v as bool?),
          $checkedConvert('ratingScore', (v) => (v as num?)?.toInt()),
          $checkedConvert(
              'topicTagIds',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => (e as num).toInt())
                  .toList()),
          $checkedConvert('isEnable', (v) => v as bool?),
          $checkedConvert(
              'enrollType',
              (v) => $enumDecodeNullable(_$EnrollTypeEnumMap, v,
                  unknownValue: EnrollType.unknown)),
          $checkedConvert(
              'expirationDate',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => (e as num).toInt())
                  .toList()),
          $checkedConvert('isStandAlone', (v) => v as bool?),
          $checkedConvert('prereqOrderNumber', (v) => (v as num?)?.toInt()),
          $checkedConvert('status', (v) => v as String?),
          $checkedConvert('coverId', (v) => (v as num?)?.toInt()),
          $checkedConvert('badgeId', (v) => (v as num?)?.toInt()),
          $checkedConvert(
              'badge',
              (v) => v == null
                  ? null
                  : BadgeDto.fromJson(v as Map<String, dynamic>)),
          $checkedConvert(
              'certificate',
              (v) => v == null
                  ? null
                  : CertificateDto.fromJson(v as Map<String, dynamic>)),
          $checkedConvert('coverPrivateURL', (v) => v as String?),
          $checkedConvert('coverPublicURL', (v) => v as String?),
          $checkedConvert('coverVideoId', (v) => (v as num?)?.toInt()),
          $checkedConvert('coverVideoPrivateURL', (v) => v as String?),
          $checkedConvert('coverVideoPublicURL', (v) => v as String?),
          $checkedConvert('learningObjectType', (v) => v as String?),
          $checkedConvert('learningObjectTypology', (v) => v as String?),
          $checkedConvert('shortDescription', (v) => v as String?),
          $checkedConvert('longDescription', (v) => v as String?),
          $checkedConvert('duration', (v) => (v as num?)?.toInt()),
          $checkedConvert('percentageOfCompletion', (v) => v as String?),
          $checkedConvert(
              'lastViewedDate',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => (e as num).toInt())
                  .toList()),
          $checkedConvert('toolNumber', (v) => (v as num?)?.toInt()),
          $checkedConvert('topicTags',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          $checkedConvert('prereqType', (v) => v as String?),
          $checkedConvert(
              'teachers',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => TeacherDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

const _$EnrollTypeEnumMap = {
  EnrollType.autoEnroll: 'AUTO_ENROLL',
  EnrollType.topDown: 'TOP_DOWN',
  EnrollType.requestedAutoEnroll: 'REQUESTED_AUTO_ENROLL',
  EnrollType.unknown: 'unknown',
};
