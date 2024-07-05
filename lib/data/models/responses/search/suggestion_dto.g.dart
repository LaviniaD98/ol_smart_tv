// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestion_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestionDto _$SuggestionDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SuggestionDto',
      json,
      ($checkedConvert) {
        final val = SuggestionDto(
          $checkedConvert('id', (v) => (v as num).toInt()),
          $checkedConvert(
              'type',
              (v) => $enumDecode(_$LearningObjectTypologyEnumMap, v,
                  unknownValue: LearningObjectTypology.unknown)),
          $checkedConvert('title', (v) => v as String?),
          $checkedConvert(
              'learningObjectType',
              (v) => $enumDecode(_$LearningObjectTypeEnumMap, v,
                  unknownValue: LearningObjectType.unknown)),
          $checkedConvert('shortDescription', (v) => v as String?),
          $checkedConvert('duration', (v) => (v as num?)?.toInt()),
          $checkedConvert('expirationDate', (v) => (v as num?)?.toInt()),
          $checkedConvert('availableEditions', (v) => (v as num?)?.toInt()),
          $checkedConvert('enrollType', (v) => v as String?),
        );
        return val;
      },
    );

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

const _$LearningObjectTypeEnumMap = {
  LearningObjectType.async: 'ASYNC',
  LearningObjectType.blended: 'BLENDED',
  LearningObjectType.physicalClass: 'DA_PHYSICAL_CLASS',
  LearningObjectType.virtualClass: 'DA_VIRTUAL_CLASS',
  LearningObjectType.sync: 'SYNC',
  LearningObjectType.unknown: 'unknown',
};
