// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityDataDto _$CommunityDataDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CommunityDataDto',
      json,
      ($checkedConvert) {
        final val = CommunityDataDto(
          commentCount: $checkedConvert('comment_count', (v) => v as String?),
          attachments: $checkedConvert('attachments', (v) => v),
          ownerId: $checkedConvert('owner_id', (v) => v as String?),
          commentId: $checkedConvert('comment_id', (v) => v as String?),
          created: $checkedConvert('created', (v) => v as String?),
          postType: $checkedConvert('post_type', (v) => v as String?),
          publishDate: $checkedConvert('publishDate', (v) => v as String?),
          title: $checkedConvert('title', (v) => v as String?),
          body: $checkedConvert('body', (v) => v as String?),
          bodyTrim: $checkedConvert('body_trim', (v) => v as String?),
          subtitle: $checkedConvert('subtitle', (v) => v as String?),
          topic: $checkedConvert(
              'topic',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      CommunityTopicDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          id: $checkedConvert('id', (v) => v as String?),
          likes: $checkedConvert('likes', (v) => v as String?),
          changed: $checkedConvert('changed', (v) => v as String?),
          userId: $checkedConvert('user_id', (v) => v as String?),
          loId: $checkedConvert('lo_id', (v) => v as String?),
          learningObjectTypology: $checkedConvert(
              'lo_type',
              (v) =>
                  $enumDecodeNullable(_$LearningObjectTypologyEnumMap, v,
                      unknownValue: LearningObjectTypology.unknown) ??
                  LearningObjectTypology.unknown),
          reply: $checkedConvert('reply', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'commentCount': 'comment_count',
        'ownerId': 'owner_id',
        'commentId': 'comment_id',
        'postType': 'post_type',
        'bodyTrim': 'body_trim',
        'userId': 'user_id',
        'loId': 'lo_id',
        'learningObjectTypology': 'lo_type'
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
