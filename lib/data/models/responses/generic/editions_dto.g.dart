// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'editions_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditionsDto _$EditionsDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'EditionsDto',
      json,
      ($checkedConvert) {
        final val = EditionsDto(
          $checkedConvert(
              'editions',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => EditionDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );
