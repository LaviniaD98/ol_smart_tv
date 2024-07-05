// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseDto _$CourseDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'CourseDto',
      json,
      ($checkedConvert) {
        final val = CourseDto(
          $checkedConvert('id', (v) => (v as num?)?.toInt()),
          $checkedConvert('title', (v) => v as String?),
          $checkedConvert('isMandatory', (v) => v as bool?),
          $checkedConvert('status', (v) => v as String?),
          $checkedConvert('coverId', (v) => (v as num?)?.toInt()),
          $checkedConvert('coverPrivateURL', (v) => v as String?),
          $checkedConvert('coverPublicURL', (v) => v as String?),
          $checkedConvert('coverVideoId', (v) => (v as num?)?.toInt()),
          $checkedConvert('coverVideoPrivateURL', (v) => v as String?),
          $checkedConvert('coverVideoPublicURL', (v) => v as String?),
          $checkedConvert('prereqOrderNumber', (v) => (v as num?)?.toInt()),
          $checkedConvert(
              'learningObjectType',
              (v) => $enumDecode(_$LearningObjectTypeEnumMap, v,
                  unknownValue: LearningObjectType.unknown)),
          $checkedConvert(
              'learningObjectTypology',
              (v) => $enumDecode(_$LearningObjectTypologyEnumMap, v,
                  unknownValue: LearningObjectTypology.unknown)),
          $checkedConvert('shortDescription', (v) => v as String?),
          $checkedConvert('duration', (v) => (v as num?)?.toInt()),
          $checkedConvert('percentageOfCompletion', (v) => v as String?),
          $checkedConvert(
              'learningActivityNumber', (v) => (v as num?)?.toInt()),
          $checkedConvert('toolNumber', (v) => (v as num?)?.toInt()),
          $checkedConvert('badgeId', (v) => (v as num?)?.toInt()),
          $checkedConvert('certificateId', (v) => (v as num?)?.toInt()),
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
          $checkedConvert('topicTags',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          $checkedConvert('prereqType', (v) => v as String?),
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
        );
        return val;
      },
    );

const _$LearningObjectTypeEnumMap = {
  LearningObjectType.async: 'ASYNC',
  LearningObjectType.blended: 'BLENDED',
  LearningObjectType.physicalClass: 'DA_PHYSICAL_CLASS',
  LearningObjectType.virtualClass: 'DA_VIRTUAL_CLASS',
  LearningObjectType.sync: 'SYNC',
  LearningObjectType.unknown: 'unknown',
};

const _$LearningObjectTypologyEnumMap = {
  LearningObjectTypology.course: 'COURSE',
  LearningObjectTypology.externalRes: 'DA_EXTERNAL_RES',
  LearningObjectTypology.scorm: 'DA_SCORM',
  LearningObjectTypology.xapi: 'DA_XAPI',
  LearningObjectTypology.physicalClass: 'DA_PHYSICAL_CLASS',
  LearningObjectTypology.virtualClass: 'DA_VIRTUAL_CLASS',
  LearningObjectTypology.youtube: 'DA_YOUTUBE',
  LearningObjectTypology.linkedin: 'DA_LINKEDIN',
  LearningObjectTypology.path: 'PATH',
  LearningObjectTypology.material: 'DA_MATERIAL',
  LearningObjectTypology.goals: 'DA_GOALS',
  LearningObjectTypology.meeting: 'DA_MEETING',
  LearningObjectTypology.finalBalance: 'DA_FINAL_BALANCE',
  LearningObjectTypology.urlRes: 'DA_URL_RES',
  LearningObjectTypology.survey: 'DA_SURVEY',
  LearningObjectTypology.unknown: 'unknown',
};

const _$EnrollTypeEnumMap = {
  EnrollType.autoEnroll: 'AUTO_ENROLL',
  EnrollType.topDown: 'TOP_DOWN',
  EnrollType.requestedAutoEnroll: 'REQUESTED_AUTO_ENROLL',
  EnrollType.unknown: 'unknown',
};
