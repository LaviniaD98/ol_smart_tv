// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edition_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditionDto _$EditionDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'EditionDto',
      json,
      ($checkedConvert) {
        final val = EditionDto(
          $checkedConvert('id', (v) => v as int?),
          $checkedConvert('startTime', (v) => v as String?),
          $checkedConvert('endTime', (v) => v as String?),
          $checkedConvert('status', (v) => v as String?),
          $checkedConvert('location', (v) => v as String?),
          $checkedConvert('rooms',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          $checkedConvert('totalPlaces', (v) => v as int?),
          $checkedConvert('occupiedPlaces', (v) => v as int?),
          $checkedConvert('remainingPlaces', (v) => v as int?),
          $checkedConvert('link', (v) => v as String?),
          $checkedConvert('date',
              (v) => (v as List<dynamic>?)?.map((e) => e as int).toList()),
          $checkedConvert('gMapsUrl', (v) => v as String?),
        );
        return val;
      },
    );
