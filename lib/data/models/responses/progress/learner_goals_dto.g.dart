// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learner_goals_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearnerGoalsDto _$LearnerGoalsDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'LearnerGoalsDto',
      json,
      ($checkedConvert) {
        final val = LearnerGoalsDto(
          $checkedConvert(
              'goal',
              (v) => v == null
                  ? null
                  : GoalDto.fromJson(v as Map<String, dynamic>)),
          $checkedConvert(
              'progress',
              (v) => v == null
                  ? null
                  : ProgressDto.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );
