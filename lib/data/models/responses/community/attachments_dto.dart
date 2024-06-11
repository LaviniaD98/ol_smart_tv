import 'package:freezed_annotation/freezed_annotation.dart';

import 'attachments_item_dto.dart';

part 'attachments_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class AttachmentsDto {
  AttachmentsDto(
    this.image,
    this.link,
    this.brightcove,
    this.document,
  );

  factory AttachmentsDto.fromJson(Map<String, dynamic> json) => _$AttachmentsDtoFromJson(json);

  @JsonKey(name: 'image')
  final List<AttachmentsItemDto>? image;
  @JsonKey(name: 'link')
  final List<AttachmentsItemDto>? link;
  @JsonKey(name: 'brightcove')
  final List<AttachmentsItemDto>? brightcove;
  @JsonKey(name: 'document')
  final List<AttachmentsItemDto>? document;
}