// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_plans_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningPlansDto _$LearningPlansDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'LearningPlansDto',
      json,
      ($checkedConvert) {
        final val = LearningPlansDto(
          $checkedConvert(
              'starter',
              (v) => v == null
                  ? null
                  : LearningPlanDto.fromJson(v as Map<String, dynamic>)),
          $checkedConvert(
              'advanced',
              (v) => v == null
                  ? null
                  : LearningPlanDto.fromJson(v as Map<String, dynamic>)),
          $checkedConvert(
              'master',
              (v) => v == null
                  ? null
                  : LearningPlanDto.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );
