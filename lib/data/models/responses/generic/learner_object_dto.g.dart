// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learner_object_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearnerObjectDto _$LearnerObjectDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'LearnerObjectDto',
      json,
      ($checkedConvert) {
        final val = LearnerObjectDto(
          $checkedConvert(
              'objectStatistics',
              (v) => v == null
                  ? null
                  : ObjectStatisticsDto.fromJson(v as Map<String, dynamic>)),
          $checkedConvert(
              'userRating',
              (v) => v == null
                  ? null
                  : UserRatingDto.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );
