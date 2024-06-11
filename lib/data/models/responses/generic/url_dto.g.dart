// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'url_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UrlDto _$UrlDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'UrlDto',
      json,
      ($checkedConvert) {
        final val = UrlDto(
          $checkedConvert('private_url', (v) => v as String),
          $checkedConvert('public_url', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'privateUrl': 'private_url',
        'publicUrl': 'public_url'
      },
    );
