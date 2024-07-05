// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'id_label_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdLabelModel _$IdLabelModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'IdLabelModel',
      json,
      ($checkedConvert) {
        final val = IdLabelModel(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          label: $checkedConvert('label', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$IdLabelModelToJson(IdLabelModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
    };
