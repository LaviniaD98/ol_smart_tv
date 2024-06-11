import 'package:open_learning_smart_tv/data/models/responses/generic/relative_path_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'page_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class PageDto {
  PageDto(this.pageName, this.relativePaths);

  factory PageDto.fromJson(Map<String, dynamic> json) =>
      _$PageDtoFromJson(json);

  @JsonKey(name: "pageName")
  final String pageName;
  @JsonKey(name: "relativePaths")
  final List<RelativePathDto>? relativePaths;
}
