// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'useful_link_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsefulLinkDto _$UsefulLinkDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'UsefulLinkDto',
      json,
      ($checkedConvert) {
        final val = UsefulLinkDto(
          $checkedConvert('url', (v) => v as String?),
          $checkedConvert('url_label', (v) => v as String?),
          $checkedConvert('description', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'urlLabel': 'url_label'},
    );
