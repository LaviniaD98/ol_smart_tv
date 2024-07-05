// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relative_path_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelativePathDto _$RelativePathDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'RelativePathDto',
      json,
      ($checkedConvert) {
        final val = RelativePathDto(
          $checkedConvert('id', (v) => (v as num).toInt()),
          $checkedConvert('title', (v) => v as String?),
          $checkedConvert('apiPath', (v) => v as String),
          $checkedConvert('serviceType', (v) => v as String?),
          $checkedConvert('labelMapping', (v) => v as String?),
          $checkedConvert('preSelected', (v) => v as bool?),
        );
        return val;
      },
    );
