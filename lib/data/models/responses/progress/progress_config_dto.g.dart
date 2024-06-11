// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_config_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgressConfigDto _$ProgressConfigDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ProgressConfigDto',
      json,
      ($checkedConvert) {
        final val = ProgressConfigDto(
          $checkedConvert('enabled', (v) => v as bool?),
          $checkedConvert('monitoringStartDate', (v) => v as String?),
        );
        return val;
      },
    );
