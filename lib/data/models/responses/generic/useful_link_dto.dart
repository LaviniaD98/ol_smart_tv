import 'package:json_annotation/json_annotation.dart';

part 'useful_link_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class UsefulLinkDto {
  UsefulLinkDto(this.url, this.urlLabel, this.description);

  factory UsefulLinkDto.fromJson(Map<String, dynamic> json) => _$UsefulLinkDtoFromJson(json);

  @JsonKey(name: "url")
  final String? url;
  @JsonKey(name: "url_label")
  final String? urlLabel;
  @JsonKey(name: "description")
  final String? description;
}
