// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'days_to_show_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DaysToShowDto _$DaysToShowDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DaysToShowDto',
      json,
      ($checkedConvert) {
        final val = DaysToShowDto(
          $checkedConvert('dayIndex', (v) => (v as num?)?.toInt()),
          $checkedConvert(
              'dayToShow',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => (e as num).toInt())
                  .toList()),
        );
        return val;
      },
    );
