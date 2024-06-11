import 'package:json_annotation/json_annotation.dart';

part 'certificate_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class CertificateDto {
  CertificateDto(
    this.id,
    this.name,
    this.description,
    this.expiresInMonths,
    this.templatePath,
    this.isEnable,
    this.learningObjectId,
    this.issuedOn,
    this.learningObjectTitle,
    this.type,
    this.iconURL,
  );

  factory CertificateDto.fromJson(Map<String, dynamic> json) =>
      _$CertificateDtoFromJson(json);

  @JsonKey()
  final int? id;
  @JsonKey()
  final String? name;
  @JsonKey()
  final String? description;
  @JsonKey()
  final int? expiresInMonths;
  @JsonKey()
  final String? templatePath;
  @JsonKey()
  final bool? isEnable;
  @JsonKey()
  final int? learningObjectId;
  @JsonKey()
  final String? issuedOn;
  @JsonKey()
  final String? learningObjectTitle;
  @JsonKey()
  final String? type;
  @JsonKey()
  final String? iconURL;
}
