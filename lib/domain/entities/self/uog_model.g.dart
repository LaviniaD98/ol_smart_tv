// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UogModel _$UogModelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'UogModel',
      json,
      ($checkedConvert) {
        final val = UogModel(
          uog: $checkedConvert('uog', (v) => v as String?),
          uogDescription:
              $checkedConvert('uog_description', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'uogDescription': 'uog_description'},
    );

Map<String, dynamic> _$UogModelToJson(UogModel instance) => <String, dynamic>{
      'uog': instance.uog,
      'uog_description': instance.uogDescription,
    };
