// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_posts_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityPostsDto _$CommunityPostsDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CommunityPostsDto',
      json,
      ($checkedConvert) {
        final val = CommunityPostsDto(
          enrichedInformation: $checkedConvert(
              'enrichedInformation',
              (v) => v == null
                  ? null
                  : EnrichedInformationDto.fromJson(v as Map<String, dynamic>)),
          extendedInformation: $checkedConvert(
              'extendedInformation',
              (v) => v == null
                  ? null
                  : ExtendedInformationDto.fromJson(v as Map<String, dynamic>)),
          data: $checkedConvert(
              'data',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      CommunityDataDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          pager: $checkedConvert(
              'pager',
              (v) => v == null
                  ? null
                  : CommunityPagerDto.fromJson(v as Map<String, dynamic>)),
          topic: $checkedConvert(
              'topic',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      CommunityTopicDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          countDataObj:
              $checkedConvert('count_data_obj', (v) => (v as num?)?.toDouble()),
        );
        return val;
      },
      fieldKeyMap: const {'countDataObj': 'count_data_obj'},
    );
