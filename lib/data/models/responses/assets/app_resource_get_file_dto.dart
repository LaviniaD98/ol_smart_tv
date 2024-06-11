import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_resource_get_file_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class AppResourceGetFileDto {
  AppResourceGetFileDto(
  this.privateUrl,
  this.publicUrl,
  );

  factory AppResourceGetFileDto.fromJson(Map<String, dynamic> json) => _$AppResourceGetFileDtoFromJson(json);

  @JsonKey(name: 'private_url')
  final String? privateUrl;
  @JsonKey(name: 'public_url')
  final String? publicUrl;
}