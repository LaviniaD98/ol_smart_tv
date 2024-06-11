// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_mandatory_strip_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingMandatoryStripDto _$TrainingMandatoryStripDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'TrainingMandatoryStripDto',
      json,
      ($checkedConvert) {
        final val = TrainingMandatoryStripDto(
          $checkedConvert(
              'mandatoryLearningObjects',
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
      fieldKeyMap: const {'items': 'mandatoryLearningObjects'},
    );
