// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ecm_professions_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EcmProfessionsDto _$EcmProfessionsDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'EcmProfessionsDto',
      json,
      ($checkedConvert) {
        final val = EcmProfessionsDto(
          $checkedConvert(
              'metadata',
              (v) => v == null
                  ? null
                  : EcmPagerDto.fromJson(v as Map<String, dynamic>)),
          $checkedConvert(
              'output',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      EcmProfessionDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );
