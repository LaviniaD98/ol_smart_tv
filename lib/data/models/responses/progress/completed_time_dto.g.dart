// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_time_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletedTimeDto _$CompletedTimeDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CompletedTimeDto',
      json,
      ($checkedConvert) {
        final val = CompletedTimeDto(
          $checkedConvert('hours', (v) => (v as num?)?.toInt()),
          $checkedConvert('minutes', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
    );
