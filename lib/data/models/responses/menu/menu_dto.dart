import 'package:open_learning_smart_tv/data/models/responses/generic/relative_path_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'menu_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class MenuDto {
  MenuDto(this.menuType, this.relativePaths);

  factory MenuDto.fromJson(Map<String, dynamic> json) =>
      _$MenuDtoFromJson(json);

  @JsonKey(name: "menuType")
  final String? menuType;
  @JsonKey(name: "relativePaths")
  final List<RelativePathDto>? relativePaths;
}
