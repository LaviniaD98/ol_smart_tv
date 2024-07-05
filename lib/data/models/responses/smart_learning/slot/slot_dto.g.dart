// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slot_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SlotDto _$SlotDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'SlotDto',
      json,
      ($checkedConvert) {
        final val = SlotDto(
          $checkedConvert('id', (v) => (v as num).toInt()),
          $checkedConvert('start_date', (v) => v as String),
          $checkedConvert('end_date', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'startDate': 'start_date', 'endDate': 'end_date'},
    );
