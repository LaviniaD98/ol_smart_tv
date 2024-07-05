// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edition_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditionResponseDto _$EditionResponseDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'EditionResponseDto',
      json,
      ($checkedConvert) {
        final val = EditionResponseDto(
          $checkedConvert('errorMessages',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          $checkedConvert('numberRowNotSaved', (v) => (v as num?)?.toInt()),
          $checkedConvert('numberRowSaved', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
    );
