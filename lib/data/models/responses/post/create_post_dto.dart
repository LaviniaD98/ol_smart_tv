import 'package:json_annotation/json_annotation.dart';

part 'create_post_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class CreatePostDto {

  CreatePostDto(this.id, this.message);

  factory CreatePostDto.fromJson(Map<String, dynamic> json) => _$CreatePostDtoFromJson(json);

  @JsonKey()
  final String id;

  @JsonKey()
  final String message;
}
