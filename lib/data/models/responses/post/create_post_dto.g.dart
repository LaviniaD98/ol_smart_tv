// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_post_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePostDto _$CreatePostDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CreatePostDto',
      json,
      ($checkedConvert) {
        final val = CreatePostDto(
          $checkedConvert('id', (v) => v as String),
          $checkedConvert('message', (v) => v as String),
        );
        return val;
      },
    );
