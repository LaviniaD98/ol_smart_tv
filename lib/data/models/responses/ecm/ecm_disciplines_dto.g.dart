// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ecm_disciplines_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EcmDisciplinesDto _$EcmDisciplinesDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'EcmDisciplinesDto',
      json,
      ($checkedConvert) {
        final val = EcmDisciplinesDto(
          $checkedConvert(
              'metadata',
              (v) => v == null
                  ? null
                  : EcmPagerDto.fromJson(v as Map<String, dynamic>)),
          $checkedConvert(
              'output',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      EcmDisciplineDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );
