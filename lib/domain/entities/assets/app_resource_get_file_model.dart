import 'package:open_learning_smart_tv/data/models/responses/assets/app_resource_get_file_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_resource_get_file_model.g.dart';

@JsonSerializable(createToJson: true, checked: true)
class AppResourceGetFileModel {
  AppResourceGetFileModel({
    this.privateUrl,
    this.publicUrl,
  });

  factory AppResourceGetFileModel.fromJson(Map<String, dynamic> json) =>
      _$AppResourceGetFileModelFromJson(json);
  Map<String, dynamic> toJson() => _$AppResourceGetFileModelToJson(this);

  factory AppResourceGetFileModel.fromDto(AppResourceGetFileDto dto) {
    return AppResourceGetFileModel(
      privateUrl: dto.privateUrl,
      publicUrl: dto.publicUrl,
    );
  }

  @JsonKey(name: 'private_url')
  final String? privateUrl;
  @JsonKey(name: 'public_url')
  final String? publicUrl;
}
