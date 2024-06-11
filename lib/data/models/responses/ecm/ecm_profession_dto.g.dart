// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ecm_profession_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EcmProfessionDto _$EcmProfessionDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'EcmProfessionDto',
      json,
      ($checkedConvert) {
        final val = EcmProfessionDto(
          $checkedConvert('id', (v) => v as int),
          $checkedConvert('identifier', (v) => v as String?),
          $checkedConvert('name', (v) => v as String),
        );
        return val;
      },
    );
