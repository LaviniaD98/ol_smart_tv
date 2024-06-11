import 'package:json_annotation/json_annotation.dart';

part 'url_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class UrlDto {
  UrlDto(this.privateUrl, this.publicUrl);

  factory UrlDto.fromJson(Map<String, dynamic> json) => _$UrlDtoFromJson(json);

  @JsonKey(name: "private_url")
  final String privateUrl;
  @JsonKey(name: "public_url")
  final String publicUrl;
}
