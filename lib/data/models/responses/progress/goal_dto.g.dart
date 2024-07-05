// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoalDto _$GoalDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'GoalDto',
      json,
      ($checkedConvert) {
        final val = GoalDto(
          $checkedConvert('plan', (v) => v as String?),
          $checkedConvert('hoursPerMonth', (v) => (v as num?)?.toInt()),
          $checkedConvert('durationInDays', (v) => (v as num?)?.toInt()),
          $checkedConvert('totalHours', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
    );
