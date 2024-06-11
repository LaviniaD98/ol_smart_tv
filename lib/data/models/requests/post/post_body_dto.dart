import 'package:json_annotation/json_annotation.dart';

import 'post_attachments_dto.dart';

part 'post_body_dto.g.dart';

@JsonSerializable(
  createFactory: false,
  ignoreUnannotated: true,
  explicitToJson: true,
)
class PostBodyDto {
  const PostBodyDto({
    required this.attachments,
    required this.body,
    required this.langCode,
    required this.postType,
    this.loAuthor,
    this.loId,
    this.loType,
  });

  Map<String, dynamic> toJson() => _$PostBodyDtoToJson(this);

  @JsonKey()
  final PostAttachmentsDto? attachments;

  @JsonKey()
  final String? body;
  @JsonKey(name: 'langcode')
  final String? langCode;
  @JsonKey(name: 'post_type')
  final String? postType;
  @JsonKey(name: 'lo_author')
  final String? loAuthor;
  @JsonKey(name: 'lo_id')
  final String? loId;
  @JsonKey(name: 'lo_type')
  final String? loType;
}
