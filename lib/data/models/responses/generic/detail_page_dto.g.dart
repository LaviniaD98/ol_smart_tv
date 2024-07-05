// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_page_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailPageDto _$DetailPageDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DetailPageDto',
      json,
      ($checkedConvert) {
        final val = DetailPageDto(
          $checkedConvert('id', (v) => (v as num?)?.toInt()),
          $checkedConvert('title', (v) => v as String?),
          $checkedConvert('coverId', (v) => (v as num?)?.toInt()),
          $checkedConvert('coverPrivateURL', (v) => v as String?),
          $checkedConvert('coverPublicURL', (v) => v as String?),
          $checkedConvert('coverVideoId', (v) => (v as num?)?.toInt()),
          $checkedConvert('coverVideoPrivateURL', (v) => v as String?),
          $checkedConvert('coverVideoPublicURL', (v) => v as String?),
          $checkedConvert('brightCoverId', (v) => v as String?),
          $checkedConvert('isMandatory', (v) => v as bool?),
          $checkedConvert('isStandAlone', (v) => v as bool?),
          $checkedConvert('link', (v) => v as String?),
          $checkedConvert('badgeId', (v) => (v as num?)?.toInt()),
          $checkedConvert('certificateId', (v) => (v as num?)?.toInt()),
          $checkedConvert('testId', (v) => (v as num?)?.toInt()),
          $checkedConvert(
              'learningObjectType',
              (v) => $enumDecode(_$LearningObjectTypeEnumMap, v,
                  unknownValue: LearningObjectType.unknown)),
          $checkedConvert(
              'learningObjectTypology',
              (v) => $enumDecode(_$LearningObjectTypologyEnumMap, v,
                  unknownValue: LearningObjectTypology.unknown)),
          $checkedConvert('enrollId', (v) => (v as num?)?.toInt()),
          $checkedConvert(
              'enrollType',
              (v) => $enumDecodeNullable(_$EnrollTypeEnumMap, v,
                  unknownValue: EnrollType.unknown)),
          $checkedConvert('ecmType', (v) => v as String?),
          $checkedConvert(
              'ecmStartDate',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => (e as num).toInt())
                  .toList()),
          $checkedConvert(
              'ecmEndDate',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => (e as num).toInt())
                  .toList()),
          $checkedConvert('ecmRegistration', (v) => v as bool?),
          $checkedConvert('ecm_specialization', (v) => v as bool?),
          $checkedConvert('sponsors',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          $checkedConvert('isFavourite', (v) => v as bool?),
          $checkedConvert('averageRatingScore', (v) => (v as num?)?.toDouble()),
          $checkedConvert('isPrereqEnable', (v) => v as bool?),
          $checkedConvert('prereqType', (v) => v as String?),
          $checkedConvert('topicTags',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          $checkedConvert(
              'topicTagIds',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => (e as num).toInt())
                  .toList()),
          $checkedConvert(
              'badgeIds',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => (e as num).toInt())
                  .toList()),
          $checkedConvert(
              'certificateIds',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => (e as num).toInt())
                  .toList()),
          $checkedConvert('duration', (v) => (v as num?)?.toInt()),
          $checkedConvert('status', (v) => v as String?),
          $checkedConvert('percentageOfCompletion', (v) => v as String?),
          $checkedConvert('shortDescription', (v) => v as String?),
          $checkedConvert('longDescription', (v) => v as String?),
          $checkedConvert(
              'publicationDate',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => (e as num).toInt())
                  .toList()),
          $checkedConvert(
              'obsolescenceDate',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => (e as num).toInt())
                  .toList()),
          $checkedConvert(
              'expirationDate',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => (e as num).toInt())
                  .toList()),
          $checkedConvert('isExpirationDateHard', (v) => v as bool?),
          $checkedConvert('courseNumber', (v) => (v as num?)?.toInt()),
          $checkedConvert(
              'learningActivityNumber', (v) => (v as num?)?.toInt()),
          $checkedConvert('toolNumber', (v) => (v as num?)?.toInt()),
          $checkedConvert('badgeNumber', (v) => (v as num?)?.toInt()),
          $checkedConvert(
              'teachers',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => TeacherDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          $checkedConvert(
              'agenda',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => AgendaDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
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
          $checkedConvert(
              'courses',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => CourseDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          $checkedConvert(
              'learningActivities',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      LearningObjectDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          $checkedConvert(
              'useful_links',
              (v) => (v as List<dynamic>?)
                  ?.map(
                      (e) => UsefulLinkDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          $checkedConvert('downloadFlag', (v) => v as bool?),
          $checkedConvert('fruitionFlag', (v) => v as bool?),
          $checkedConvert(
              'meetingDetails',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      MeetingDetailsDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'ecmSpecialization': 'ecm_specialization',
        'usefulLinks': 'useful_links'
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
