// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ecm_discipline_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EcmDisciplineDto _$EcmDisciplineDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'EcmDisciplineDto',
      json,
      ($checkedConvert) {
        final val = EcmDisciplineDto(
          $checkedConvert('id', (v) => (v as num).toInt()),
          $checkedConvert('identifier', (v) => v as String),
          $checkedConvert('name', (v) => v as String),
          $checkedConvert('profession',
              (v) => EcmCategoryDto.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );
