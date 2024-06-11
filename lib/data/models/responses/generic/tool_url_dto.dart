import 'package:json_annotation/json_annotation.dart';

part 'tool_url_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class ToolUrlDto {
  ToolUrlDto(
    this.id,
    this.privateUrl,
    this.publicUrl,
  );

  factory ToolUrlDto.fromJson(Map<String, dynamic> json) =>
      _$ToolUrlDtoFromJson(json);

  @JsonKey()
  final int? id;
  @JsonKey()
  final String? privateUrl;
  @JsonKey()
  final String? publicUrl;
}
