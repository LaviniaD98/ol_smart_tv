import 'package:freezed_annotation/freezed_annotation.dart';

part 'attachments_item_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class AttachmentsItemDto {
  AttachmentsItemDto({
    this.duration,
    this.size,
    this.name,
    this.alt,
    this.id,
    this.content,
  });

  factory AttachmentsItemDto.fromJson(Map<String, dynamic> json) => _$AttachmentsItemDtoFromJson(json);

  @JsonKey(name: 'duration')
  final String? duration;
  @JsonKey(name: 'size')
  final String? size;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'alt')
  final String? alt;
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'content')
  final String? content;
}