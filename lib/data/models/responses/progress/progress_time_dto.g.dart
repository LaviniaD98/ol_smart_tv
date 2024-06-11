// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_time_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgressTimeDto _$ProgressTimeDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ProgressTimeDto',
      json,
      ($checkedConvert) {
        final val = ProgressTimeDto(
          $checkedConvert('hours', (v) => (v as num?)?.toDouble()),
          $checkedConvert('completedHours', (v) => (v as num?)?.toDouble()),
        );
        return val;
      },
    );
