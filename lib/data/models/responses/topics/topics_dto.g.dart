// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topics_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopicsDto _$TopicsDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TopicsDto',
      json,
      ($checkedConvert) {
        final val = TopicsDto(
          $checkedConvert(
              'output',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => TopicDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );
