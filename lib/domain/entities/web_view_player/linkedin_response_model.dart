import 'package:open_learning_smart_tv/data/models/responses/web_view_player/linkedin_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'linkedin_response_model.g.dart';

@JsonSerializable(createToJson: true, checked: true)
class LinkedInResponseModel {
  LinkedInResponseModel(
    this.webURL,
  );

  Map<String, dynamic> toJson() => _$LinkedInResponseModelToJson(this);
  factory LinkedInResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LinkedInResponseModelFromJson(json);

  factory LinkedInResponseModel.fromResponse(LinkedinResponseDto dto) {
    return LinkedInResponseModel(dto.webURL);
  }

  @JsonKey()
  final String? webURL;
}
