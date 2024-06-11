
import 'package:freezed_annotation/freezed_annotation.dart';

part 'linkedin_response_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class LinkedinResponseDto {

  LinkedinResponseDto(
        this.webURL
      );

  factory LinkedinResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LinkedinResponseDtoFromJson(json);

  @JsonKey()
  final String? webURL;

}