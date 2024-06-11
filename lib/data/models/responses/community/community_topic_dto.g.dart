// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_topic_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityTopicDto _$CommunityTopicDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CommunityTopicDto',
      json,
      ($checkedConvert) {
        final val = CommunityTopicDto(
          code: $checkedConvert('code', (v) => v as String?),
          filtered: $checkedConvert('filtered', (v) => v as bool?),
          name: $checkedConvert('name', (v) => v as String?),
        );
        return val;
      },
    );
