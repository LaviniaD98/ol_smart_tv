// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggested_strip_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestedStripDto _$SuggestedStripDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SuggestedStripDto',
      json,
      ($checkedConvert) {
        final val = SuggestedStripDto(
          $checkedConvert(
              'suggestedLearningObjects',
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
      fieldKeyMap: const {'items': 'suggestedLearningObjects'},
    );
