// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'id_label_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdLabelDto _$IdLabelDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'IdLabelDto',
      json,
      ($checkedConvert) {
        final val = IdLabelDto(
          $checkedConvert('id', (v) => (v as num?)?.toInt()),
          $checkedConvert('label', (v) => v as String?),
        );
        return val;
      },
    );
