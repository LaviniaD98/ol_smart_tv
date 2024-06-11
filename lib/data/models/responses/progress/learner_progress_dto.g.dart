// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learner_progress_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearnerProgressDto _$LearnerProgressDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'LearnerProgressDto',
      json,
      ($checkedConvert) {
        final val = LearnerProgressDto(
          $checkedConvert(
              'mandatory',
              (v) => v == null
                  ? null
                  : ProgressTimeDto.fromJson(v as Map<String, dynamic>)),
          $checkedConvert(
              'suggestedByManager',
              (v) => v == null
                  ? null
                  : ProgressTimeDto.fromJson(v as Map<String, dynamic>)),
          $checkedConvert(
              'suggestedByAI',
              (v) => v == null
                  ? null
                  : ProgressTimeDto.fromJson(v as Map<String, dynamic>)),
          $checkedConvert(
              'suggestedByHR',
              (v) => v == null
                  ? null
                  : ProgressTimeDto.fromJson(v as Map<String, dynamic>)),
          $checkedConvert(
              'total',
              (v) => v == null
                  ? null
                  : ProgressTimeDto.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );
