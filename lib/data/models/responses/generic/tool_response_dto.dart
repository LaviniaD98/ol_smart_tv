import 'package:open_learning_smart_tv/data/models/responses/generic/tool_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tool_response_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class ToolResponseDto {
  ToolResponseDto(this.tools);

  factory ToolResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ToolResponseDtoFromJson(json);

  @JsonKey(name: "tools")
  final List<ToolDto>? tools;
}
