// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_learning_strip_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartLearningStripDto _$SmartLearningStripDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SmartLearningStripDto',
      json,
      ($checkedConvert) {
        final val = SmartLearningStripDto(
          $checkedConvert(
              'smartLearningObjects',
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
      fieldKeyMap: const {'items': 'smartLearningObjects'},
    );
