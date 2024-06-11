// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xapi_state_results_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

XapiStateResultsDto _$XapiStateResultsDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'XapiStateResultsDto',
      json,
      ($checkedConvert) {
        final val = XapiStateResultsDto(
          $checkedConvert('attemptComplete', (v) => v as bool),
          $checkedConvert('attemptDuration', (v) => (v as num).toDouble()),
          $checkedConvert('location', (v) => v as int),
        );
        return val;
      },
    );
