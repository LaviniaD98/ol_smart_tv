// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloaded_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DownloadedItem _$DownloadedItemFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DownloadedItem',
      json,
      ($checkedConvert) {
        final val = DownloadedItem(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          taskId: $checkedConvert('taskId', (v) => v as String?),
          coverUrl: $checkedConvert('coverUrl', (v) => v as String?),
          type: $checkedConvert('type', (v) => v as String?),
          title: $checkedConvert('title', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          pathId: $checkedConvert('pathId', (v) => v as String?),
          duration: $checkedConvert('duration', (v) => (v as num?)?.toInt()),
          isMandatory: $checkedConvert('isMandatory', (v) => v as bool),
          learningObjectType: $checkedConvert('learningObjectType',
              (v) => $enumDecode(_$LearningObjectTypeEnumMap, v)),
          learningObjectTypology: $checkedConvert('learningObjectTypology',
              (v) => $enumDecode(_$LearningObjectTypologyEnumMap, v)),
          coverLocalPath:
              $checkedConvert('coverLocalPath', (v) => v as String?),
          size: $checkedConvert('size', (v) => (v as num?)?.toInt()),
          tentativeId: $checkedConvert('tentativeId', (v) => v as String?),
          iconStatus: $checkedConvert(
              'iconStatus', (v) => $enumDecode(_$IconStatusEnumMap, v)),
          bookmark: $checkedConvert('bookmark', (v) => (v as num).toInt()),
          parentId: $checkedConvert('parentId', (v) => v as String),
          grandParentId: $checkedConvert('grandParentId', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$DownloadedItemToJson(DownloadedItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'taskId': instance.taskId,
      'coverUrl': instance.coverUrl,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'pathId': instance.pathId,
      'duration': instance.duration,
      'isMandatory': instance.isMandatory,
      'learningObjectType':
          _$LearningObjectTypeEnumMap[instance.learningObjectType]!,
      'learningObjectTypology':
          _$LearningObjectTypologyEnumMap[instance.learningObjectTypology]!,
      'coverLocalPath': instance.coverLocalPath,
      'size': instance.size,
      'tentativeId': instance.tentativeId,
      'iconStatus': _$IconStatusEnumMap[instance.iconStatus]!,
      'bookmark': instance.bookmark,
      'parentId': instance.parentId,
      'grandParentId': instance.grandParentId,
    };

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

const _$IconStatusEnumMap = {
  IconStatus.mandatory: 'mandatory',
  IconStatus.completed: 'completed',
  IconStatus.expired: 'expired',
  IconStatus.suggestedAI: 'suggestedAI',
  IconStatus.suggestedHR: 'suggestedHR',
  IconStatus.idle: 'idle',
};
