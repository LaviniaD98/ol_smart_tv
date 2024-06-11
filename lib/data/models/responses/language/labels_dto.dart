import 'package:json_annotation/json_annotation.dart';

part 'labels_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class LabelsDto {
  LabelsDto(this.translation);

  factory LabelsDto.fromJson(Map<String, dynamic> json) =>
      _$LabelsDtoFromJson(json);

  @JsonKey()
  final Map<String, dynamic>? translation;
}
