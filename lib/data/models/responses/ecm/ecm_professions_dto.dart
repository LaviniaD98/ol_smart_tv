import 'package:open_learning_smart_tv/data/models/responses/ecm/ecm_pager_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/ecm/ecm_profession_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ecm_professions_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class EcmProfessionsDto {
  EcmProfessionsDto(this.metadata, this.output);

  factory EcmProfessionsDto.fromJson(Map<String, dynamic> json) =>
      _$EcmProfessionsDtoFromJson(json);

  @JsonKey()
  final EcmPagerDto? metadata;
  @JsonKey()
  final List<EcmProfessionDto>? output;
}
