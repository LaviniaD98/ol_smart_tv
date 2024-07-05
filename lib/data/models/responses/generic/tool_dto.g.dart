// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tool_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToolDto _$ToolDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ToolDto',
      json,
      ($checkedConvert) {
        final val = ToolDto(
          $checkedConvert('id', (v) => (v as num?)?.toInt()),
          $checkedConvert('name', (v) => v as String?),
          $checkedConvert('shortDescription', (v) => v as String?),
          $checkedConvert('dimension', (v) => (v as num?)?.toInt()),
          $checkedConvert('notes', (v) => v as String?),
          $checkedConvert(
              'useful_links',
              (v) => (v as List<dynamic>?)
                  ?.map(
                      (e) => UsefulLinkDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {'usefulLinks': 'useful_links'},
    );
