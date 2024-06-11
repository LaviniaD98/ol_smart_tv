import 'package:json_annotation/json_annotation.dart';

part 'post_link_dto.g.dart';

@JsonSerializable(
  createFactory: false,
  ignoreUnannotated: true,
  explicitToJson: true,
)
class PostLinkDto {
  const PostLinkDto({
    required this.content,
    required this.name,
  });

  Map<String, dynamic> toJson() => _$PostLinkDtoToJson(this);

  @JsonKey()
  final String content;

  @JsonKey()
  final String name;
}
