// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_goals_config_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgressGoalsConfigDto _$ProgressGoalsConfigDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'ProgressGoalsConfigDto',
      json,
      ($checkedConvert) {
        final val = ProgressGoalsConfigDto(
          $checkedConvert('enabled', (v) => v as bool?),
          $checkedConvert(
              'yourProgress',
              (v) => v == null
                  ? null
                  : ProgressConfigDto.fromJson(v as Map<String, dynamic>)),
          $checkedConvert(
              'yourGoals',
              (v) => v == null
                  ? null
                  : GoalsConfigDto.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );
