import 'package:json_annotation/json_annotation.dart';

part 'relative_path_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class RelativePathDto {
  RelativePathDto(
    this.id,
    this.title,
    this.apiPath,
    this.serviceType,
    this.labelMapping,
    this.preSelected,
  );

  factory RelativePathDto.fromJson(Map<String, dynamic> json) => _$RelativePathDtoFromJson(json);

  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "apiPath")
  final String apiPath;
  @JsonKey(name: "serviceType")
  final String? serviceType;
  @JsonKey(name: "labelMapping")
  final String? labelMapping;
  @JsonKey(name: "preSelected")
  final bool? preSelected;
}
