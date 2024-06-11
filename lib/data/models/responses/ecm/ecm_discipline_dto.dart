import 'package:json_annotation/json_annotation.dart';

import 'ecm_category_dto.dart';

part 'ecm_discipline_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class EcmDisciplineDto {
  EcmDisciplineDto(this.id, this.identifier, this.name, this.profession);

  factory EcmDisciplineDto.fromJson(Map<String, dynamic> json) => _$EcmDisciplineDtoFromJson(json);

  @JsonKey()
  final int id;
  @JsonKey()
  final String identifier;
  @JsonKey()
  final String name;
  @JsonKey()
  final EcmCategoryDto profession;
}
