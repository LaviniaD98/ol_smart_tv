// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_learning_slots_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartLearningSlotsDto _$SmartLearningSlotsDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SmartLearningSlotsDto',
      json,
      ($checkedConvert) {
        final val = SmartLearningSlotsDto(
          $checkedConvert(
              'slots',
              (v) => (v as List<dynamic>)
                  .map((e) => SlotDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          $checkedConvert('hours_available', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
      fieldKeyMap: const {'hoursAvailable': 'hours_available'},
    );
