// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vis_for_you_strip_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisForStripDto _$VisForStripDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'VisForStripDto',
      json,
      ($checkedConvert) {
        final val = VisForStripDto(
          $checkedConvert(
              'forYouLearningObjects',
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
      fieldKeyMap: const {'items': 'forYouLearningObjects'},
    );
