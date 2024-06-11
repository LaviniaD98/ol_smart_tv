import 'package:json_annotation/json_annotation.dart';

part 'teacher_detail_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class TeacherDetailDto {
  TeacherDetailDto(
    this.completeName,
    this.description,
    this.image,
    this.email,
  );

  factory TeacherDetailDto.fromJson(Map<String, dynamic> json) => _$TeacherDetailDtoFromJson(json);

  @JsonKey(name: "completeName")
  final String? completeName;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "email")
  final String? email;
}
