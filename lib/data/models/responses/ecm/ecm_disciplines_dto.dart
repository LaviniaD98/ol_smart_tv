import 'package:open_learning_smart_tv/data/models/responses/ecm/ecm_pager_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/ecm/ecm_profession_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import 'ecm_discipline_dto.dart';

part 'ecm_disciplines_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class EcmDisciplinesDto {
  EcmDisciplinesDto(this.metadata, this.output);

  factory EcmDisciplinesDto.fromJson(Map<String, dynamic> json) =>
      _$EcmDisciplinesDtoFromJson(json);

  @JsonKey()
  final EcmPagerDto? metadata;
  @JsonKey()
  final List<EcmDisciplineDto>? output;
}
