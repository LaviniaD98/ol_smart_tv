// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agenda_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgendaDto _$AgendaDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'AgendaDto',
      json,
      ($checkedConvert) {
        final val = AgendaDto(
          $checkedConvert('isBreak', (v) => v as bool?),
          $checkedConvert('item', (v) => v as String?),
        );
        return val;
      },
    );
