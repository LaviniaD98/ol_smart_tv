// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_object_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningObjectDto _$LearningObjectDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'LearningObjectDto',
      json,
      ($checkedConvert) {
        final val = LearningObjectDto(
          $checkedConvert('id', (v) => (v as num).toInt()),
          $checkedConvert('parentId', (v) => (v as num?)?.toInt()),
          $checkedConvert('grandParentId', (v) => (v as num?)?.toInt()),
          $checkedConvert('coverId', (v) => (v as num?)?.toInt()),
          $checkedConvert('badgeId', (v) => (v as num?)?.toInt()),
          $checkedConvert('certificateId', (v) => (v as num?)?.toInt()),
          $checkedConvert('editionId', (v) => (v as num?)?.toInt()),
          $checkedConvert('coverPrivateURL', (v) => v as String?),
          $checkedConvert('coverPublicURL', (v) => v as String?),
          $checkedConvert('brightCoverId', (v) => v as String?),
          $checkedConvert('videoId', (v) => (v as num?)?.toInt()),
          $checkedConvert('editionNumber', (v) => (v as num?)?.toInt()),
          $checkedConvert('videoPrivateURL', (v) => v as String?),
          $checkedConvert('videoPublicURL', (v) => v as String?),
          $checkedConvert('title', (v) => v as String?),
          $checkedConvert(
              'learningObjectType',
              (v) => $enumDecode(_$LearningObjectTypeEnumMap, v,
                  unknownValue: LearningObjectType.unknown)),
          $checkedConvert(
              'learningObjectTypology',
              (v) => $enumDecode(_$LearningObjectTypologyEnumMap, v,
                  unknownValue: LearningObjectTypology.unknown)),
          $checkedConvert('isTest', (v) => v as bool?),
          $checkedConvert('isSurvey', (v) => v as bool?),
          $checkedConvert('surveyId', (v) => (v as num?)?.toInt()),
          $checkedConvert('trackOnClick', (v) => v as bool?),
          $checkedConvert('aiItemType', (v) => v as String?),
          $checkedConvert('isFavourite', (v) => v as bool?),
          $checkedConvert('isSuggestedHR', (v) => v as bool?),
          $checkedConvert('isSuggestedAI', (v) => v as bool?),
          $checkedConvert('ratingScore', (v) => (v as num?)?.toDouble()),
          $checkedConvert(
              'enrollType', (v) => $enumDecodeNullable(_$EnrollTypeEnumMap, v)),
          $checkedConvert('topicTags',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          $checkedConvert(
              'topicTagIds',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => (e as num).toInt())
                  .toList()),
          $checkedConvert(
              'daysToShow',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => (e as List<dynamic>)
                      .map((e) => (e as num).toInt())
                      .toList())
                  .toList()),
          $checkedConvert('duration', (v) => (v as num?)?.toInt()),
          $checkedConvert('availablePlaces', (v) => (v as num?)?.toInt()),
          $checkedConvert('enrolledDates',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          $checkedConvert(
              'expirationDate',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => (e as num).toInt())
                  .toList()),
          $checkedConvert('isExpired', (v) => v as bool?),
          $checkedConvert('isToBeHidden', (v) => v as bool?),
          $checkedConvert('date', (v) => v as String?),
          $checkedConvert('shortDescription', (v) => v as String?),
          $checkedConvert('status', (v) => v as String?),
          $checkedConvert('percentageOfCompletion', (v) => v as String?),
          $checkedConvert('isMandatory', (v) => v as bool?),
          $checkedConvert('isFixedExpiration', (v) => v as bool?),
          $checkedConvert(
              'startDate',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => (e as num).toInt())
                  .toList()),
          $checkedConvert(
              'endDate',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => (e as num).toInt())
                  .toList()),
          $checkedConvert('startTime', (v) => v as String?),
          $checkedConvert('endTime', (v) => v as String?),
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
              'editions',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => EditionDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          $checkedConvert(
              'agendaHighlightEditions',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => EditionDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          $checkedConvert('courseId', (v) => (v as num?)?.toInt()),
          $checkedConvert('isEnable', (v) => v as bool?),
          $checkedConvert('isStandAlone', (v) => v as bool?),
          $checkedConvert('prereqOrderNumber', (v) => (v as num?)?.toInt()),
          $checkedConvert('coverVideoId', (v) => (v as num?)?.toInt()),
          $checkedConvert('coverVideoPrivateURL', (v) => v as String?),
          $checkedConvert('coverVideoPublicURL', (v) => v as String?),
          $checkedConvert('longDescription', (v) => v as String?),
          $checkedConvert(
              'lastViewedDate',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => (e as num).toInt())
                  .toList()),
          $checkedConvert('prereqType', (v) => v as String?),
          $checkedConvert(
              'teachers',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => TeacherDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          $checkedConvert('toolNumber', (v) => (v as num?)?.toInt()),
          $checkedConvert('link', (v) => v as String?),
          $checkedConvert('fruitionFlag', (v) => v as bool?),
          $checkedConvert('tentativeId', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
      fieldKeyMap: const {'brightcoveId': 'brightCoverId'},
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
