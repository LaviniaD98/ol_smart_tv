// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_resource_get_file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppResourceGetFileModel _$AppResourceGetFileModelFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'AppResourceGetFileModel',
      json,
      ($checkedConvert) {
        final val = AppResourceGetFileModel(
          privateUrl: $checkedConvert('private_url', (v) => v as String?),
          publicUrl: $checkedConvert('public_url', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'privateUrl': 'private_url',
        'publicUrl': 'public_url'
      },
    );

Map<String, dynamic> _$AppResourceGetFileModelToJson(
        AppResourceGetFileModel instance) =>
    <String, dynamic>{
      'private_url': instance.privateUrl,
      'public_url': instance.publicUrl,
    };
