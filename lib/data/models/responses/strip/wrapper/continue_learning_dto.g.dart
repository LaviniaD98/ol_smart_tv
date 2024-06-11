// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'continue_learning_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContinueLearningDto _$ContinueLearningDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ContinueLearningDto',
      json,
      ($checkedConvert) {
        final val = ContinueLearningDto(
          $checkedConvert(
              'onGoingLearningObjects',
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
      fieldKeyMap: const {'items': 'onGoingLearningObjects'},
    );
