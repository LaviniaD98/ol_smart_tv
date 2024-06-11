import 'package:open_learning_smart_tv/data/models/requests/post/post_link_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_attachments_dto.g.dart';

@JsonSerializable(
  createFactory: false,
  ignoreUnannotated: true,
  explicitToJson: true,
)
class PostAttachmentsDto {
  const PostAttachmentsDto({
    required this.link,
  });

  Map<String, dynamic> toJson() => _$PostAttachmentsDtoToJson(this);

  @JsonKey()
  final List<PostLinkDto> link;
}
