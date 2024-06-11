// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_resource_get_file_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppResourceGetFileDto _$AppResourceGetFileDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'AppResourceGetFileDto',
      json,
      ($checkedConvert) {
        final val = AppResourceGetFileDto(
          $checkedConvert('private_url', (v) => v as String?),
          $checkedConvert('public_url', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'privateUrl': 'private_url',
        'publicUrl': 'public_url'
      },
    );
