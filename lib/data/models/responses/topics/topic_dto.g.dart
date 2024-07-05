// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopicDto _$TopicDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TopicDto',
      json,
      ($checkedConvert) {
        final val = TopicDto(
          $checkedConvert('name', (v) => v as String),
          $checkedConvert('order', (v) => (v as num).toInt()),
          $checkedConvert('id', (v) => (v as num).toInt()),
          $checkedConvert(
              'learning_object_associated', (v) => (v as num).toInt()),
          $checkedConvert(
              'url', (v) => UrlDto.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {
        'learningObjectAssociated': 'learning_object_associated'
      },
    );
