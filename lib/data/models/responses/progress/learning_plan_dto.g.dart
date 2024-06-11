// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_plan_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningPlanDto _$LearningPlanDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'LearningPlanDto',
      json,
      ($checkedConvert) {
        final val = LearningPlanDto(
          $checkedConvert('hoursPerMonth', (v) => v as int?),
        );
        return val;
      },
    );
