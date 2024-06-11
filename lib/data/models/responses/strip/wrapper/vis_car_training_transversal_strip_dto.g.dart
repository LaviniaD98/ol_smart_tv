// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vis_car_training_transversal_strip_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisCarTrainingTransversalStripDto _$VisCarTrainingTransversalStripDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'VisCarTrainingTransversalStripDto',
      json,
      ($checkedConvert) {
        final val = VisCarTrainingTransversalStripDto(
          $checkedConvert(
              'otherLearningObjects',
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
      fieldKeyMap: const {'items': 'otherLearningObjects'},
    );
