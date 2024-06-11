import 'package:open_learning_smart_tv/data/models/responses/generic/useful_link_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tool_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class ToolDto {
  ToolDto(
    this.id,
    this.name,
    this.shortDescription,
    this.dimension,
    this.notes,
    this.usefulLinks,
  );

  factory ToolDto.fromJson(Map<String, dynamic> json) =>
      _$ToolDtoFromJson(json);

  @JsonKey()
  final int? id;
  @JsonKey()
  final String? name;
  @JsonKey()
  final String? shortDescription;
  @JsonKey()
  final int? dimension;
  @JsonKey()
  final String? notes;
  @JsonKey(name: 'useful_links')
  final List<UsefulLinkDto>? usefulLinks;
}
