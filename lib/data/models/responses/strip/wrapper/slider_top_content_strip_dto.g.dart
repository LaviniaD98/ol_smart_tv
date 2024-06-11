// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_top_content_strip_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliderTopContentStripDto _$SliderTopContentStripDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SliderTopContentStripDto',
      json,
      ($checkedConvert) {
        final val = SliderTopContentStripDto(
          $checkedConvert(
              'mainLearningObjects',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      LearningObjectDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          $checkedConvert(
              'metadata',
              (v) => v == null
                  ? null
                  : MetadataDto.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {'items': 'mainLearningObjects'},
    );
