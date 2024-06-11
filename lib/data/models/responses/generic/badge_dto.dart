import 'package:json_annotation/json_annotation.dart';

part 'badge_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class BadgeDto {
  BadgeDto(
    this.id,
    this.name,
    this.description,
    this.learningObjectTitle,
    this.learningObjectId,
    this.path,
    this.expiresInMonths,
    this.templatePath,
    this.issuedOn,
    this.isEnable,
    this.type,
    this.iconURL,
  );

  factory BadgeDto.fromJson(Map<String, dynamic> json) =>
      _$BadgeDtoFromJson(json);

  @JsonKey()
  final int? id;
  @JsonKey()
  final String? name;
  @JsonKey()
  final String? description;
  @JsonKey()
  final String? learningObjectTitle;
  @JsonKey()
  final int? learningObjectId;
  @JsonKey()
  final String? path;
  @JsonKey()
  final int? expiresInMonths;
  @JsonKey()
  final String? templatePath;
  @JsonKey()
  final String? issuedOn;
  @JsonKey()
  final bool? isEnable;
  @JsonKey()
  final String? type;
  @JsonKey()
  final String? iconURL;
}
