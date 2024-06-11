import 'package:open_learning_smart_tv/data/models/responses/generic/relative_path_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'metadata_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class MetadataDto {
  MetadataDto(this.totalPages, this.totalElements, this.output);

  factory MetadataDto.fromJson(Map<String, dynamic> json) =>
      _$MetadataDtoFromJson(json);

  @JsonKey(name: "totalPages")
  final int totalPages;
  @JsonKey(name: "totalElements")
  final int totalElements;
  @JsonKey(name: "output")
  final List<RelativePathDto>? output;
}
