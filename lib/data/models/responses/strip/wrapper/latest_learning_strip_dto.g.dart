// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_learning_strip_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatestLearningStripDto _$LatestLearningStripDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'LatestLearningStripDto',
      json,
      ($checkedConvert) {
        final val = LatestLearningStripDto(
          $checkedConvert(
              'latestLearningObjects',
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
      fieldKeyMap: const {'items': 'latestLearningObjects'},
    );
