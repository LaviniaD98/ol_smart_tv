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
          $checkedConvert('id', (v) => (v as num).toInt()),
          $checkedConvert('objectType', (v) => v as String?),
          $checkedConvert(
              'daysToShow',
              (v) => (v as List<dynamic>?)
                  ?.map(
                      (e) => DaysToShowDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          $checkedConvert('startTime', (v) => v as String?),
          $checkedConvert('endTime', (v) => v as String?),
        );
        return val;
      },
    );
