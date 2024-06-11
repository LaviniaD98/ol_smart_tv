import 'package:json_annotation/json_annotation.dart';

part 'ecm_category_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class EcmCategoryDto {
  EcmCategoryDto(this.id, this.label);

  factory EcmCategoryDto.fromJson(Map<String, dynamic> json) => _$EcmCategoryDtoFromJson(json);

  @JsonKey()
  final int id;
  @JsonKey()
  final String label;
}
