// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachments_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttachmentsDto _$AttachmentsDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AttachmentsDto',
      json,
      ($checkedConvert) {
        final val = AttachmentsDto(
          $checkedConvert(
              'image',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      AttachmentsItemDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          $checkedConvert(
              'link',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      AttachmentsItemDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          $checkedConvert(
              'brightcove',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      AttachmentsItemDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          $checkedConvert(
              'document',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      AttachmentsItemDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );
