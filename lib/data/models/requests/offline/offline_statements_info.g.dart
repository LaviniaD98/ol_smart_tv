// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_statements_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfflineStatementsInfo _$OfflineStatementsInfoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'OfflineStatementsInfo',
      json,
      ($checkedConvert) {
        final val = OfflineStatementsInfo(
          learningObjectTypology: $checkedConvert(
              'learningObjectTypology',
              (v) => $enumDecode(_$LearningObjectTypologyEnumMap, v,
                  unknownValue: LearningObjectTypology.unknown)),
          loId: $checkedConvert('loId', (v) => v as String),
          title: $checkedConvert('title', (v) => v as String?),
          description: $checkedConvert('description', (v) => v as String?),
          completed: $checkedConvert('completed', (v) => v as bool),
          duration: $checkedConvert(
              'duration', (v) => Duration(microseconds: v as int)),
          pathId: $checkedConvert('pathId', (v) => v as String?),
          tentativeId: $checkedConvert('tentativeId', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$OfflineStatementsInfoToJson(
        OfflineStatementsInfo instance) =>
    <String, dynamic>{
      'learningObjectTypology':
          _$LearningObjectTypologyEnumMap[instance.learningObjectTypology]!,
      'loId': instance.loId,
      'title': instance.title,
      'description': instance.description,
      'completed': instance.completed,
      'duration': instance.duration.inMicroseconds,
      'pathId': instance.pathId,
      'tentativeId': instance.tentativeId,
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
