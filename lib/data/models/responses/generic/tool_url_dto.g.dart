// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tool_url_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToolUrlDto _$ToolUrlDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ToolUrlDto',
      json,
      ($checkedConvert) {
        final val = ToolUrlDto(
          $checkedConvert('id', (v) => (v as num?)?.toInt()),
          $checkedConvert('privateUrl', (v) => v as String?),
          $checkedConvert('publicUrl', (v) => v as String?),
        );
        return val;
      },
    );
