// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgressDto _$ProgressDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ProgressDto',
      json,
      ($checkedConvert) {
        final val = ProgressDto(
          $checkedConvert('passedDays', (v) => (v as num?)?.toInt()),
          $checkedConvert(
              'completedTime',
              (v) => v == null
                  ? null
                  : CompletedTimeDto.fromJson(v as Map<String, dynamic>)),
          $checkedConvert(
              'summary', (v) => $enumDecodeNullable(_$GoalSummaryEnumMap, v)),
        );
        return val;
      },
    );

const _$GoalSummaryEnumMap = {
  GoalSummary.almostThere: 'ALMOST_THERE',
  GoalSummary.goalAchieved: 'GOAL_ACHIEVED',
  GoalSummary.goalNotAchieved: 'GOAL_NOT_ACHIEVED',
  GoalSummary.onLine: 'ON_LINE',
  GoalSummary.underLine: 'UNDER_LINE',
  GoalSummary.unknown: 'UNKNOWN',
};
