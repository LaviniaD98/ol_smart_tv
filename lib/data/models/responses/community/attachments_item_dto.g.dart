// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachments_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttachmentsItemDto _$AttachmentsItemDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AttachmentsItemDto',
      json,
      ($checkedConvert) {
        final val = AttachmentsItemDto(
          duration: $checkedConvert('duration', (v) => v as String?),
          size: $checkedConvert('size', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          alt: $checkedConvert('alt', (v) => v as String?),
          id: $checkedConvert('id', (v) => v as String?),
          content: $checkedConvert('content', (v) => v as String?),
        );
        return val;
      },
    );
