// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initiative_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitiativeDto _$InitiativeDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'InitiativeDto',
      json,
      ($checkedConvert) {
        final val = InitiativeDto(
          id: $checkedConvert('id', (v) => (v as num?)?.toDouble()),
          label: $checkedConvert('label', (v) => v as String?),
        );
        return val;
      },
    );
