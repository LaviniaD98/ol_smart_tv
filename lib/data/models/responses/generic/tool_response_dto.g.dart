// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tool_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToolResponseDto _$ToolResponseDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ToolResponseDto',
      json,
      ($checkedConvert) {
        final val = ToolResponseDto(
          $checkedConvert(
              'tools',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => ToolDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );
