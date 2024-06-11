// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_strip_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalendarStripDto _$CalendarStripDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CalendarStripDto',
      json,
      ($checkedConvert) {
        final val = CalendarStripDto(
          $checkedConvert(
              'learningObjects',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      LearningObjectDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          $checkedConvert(
              'smartLearningSlots',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      SmartLearningSlotsDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          $checkedConvert(
              'daysToHighlight',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      DaysToHighlightDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          $checkedConvert(
              'metadata',
              (v) => v == null
                  ? null
                  : MetadataDto.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );
