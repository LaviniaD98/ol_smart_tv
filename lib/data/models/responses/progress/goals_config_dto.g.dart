// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goals_config_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoalsConfigDto _$GoalsConfigDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'GoalsConfigDto',
      json,
      ($checkedConvert) {
        final val = GoalsConfigDto(
          $checkedConvert('enabled', (v) => v as bool?),
          $checkedConvert('durationInMonths', (v) => (v as num?)?.toInt()),
          $checkedConvert(
              'learningPlans',
              (v) => v == null
                  ? null
                  : LearningPlansDto.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );
