// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'days_to_highlight_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DaysToHighlightDto _$DaysToHighlightDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DaysToHighlightDto',
      json,
      ($checkedConvert) {
        final val = DaysToHighlightDto(
          $checkedConvert('day', (v) => (v as num?)?.toInt()),
          $checkedConvert('areThereMandatoryLO', (v) => v as bool?),
          $checkedConvert('areThereLiveLO', (v) => v as bool?),
          $checkedConvert('areThereSmartSlots', (v) => v as bool?),
        );
        return val;
      },
    );
