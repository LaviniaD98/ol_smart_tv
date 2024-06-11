import 'package:json_annotation/json_annotation.dart';

part 'teacher_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class TeacherDto {
  TeacherDto(this.id, this.completeName, this.operationalField, this.image);

  factory TeacherDto.fromJson(Map<String, dynamic> json) => _$TeacherDtoFromJson(json);

  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "completeName")
  final String? completeName;
  @JsonKey(name: "operationalField")
  final String? operationalField;
  @JsonKey(name: "image")
  final String? image;
}
