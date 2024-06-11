import 'package:freezed_annotation/freezed_annotation.dart';

part 'edition_response_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class EditionResponseDto {

  EditionResponseDto(
      this.errorMessages,
      this.numberRowNotSaved,
      this.numberRowSaved,
      );

  factory EditionResponseDto.fromJson(Map<String, dynamic> json) =>
      _$EditionResponseDtoFromJson(json);

  @JsonKey()
  final List<String>? errorMessages;
  @JsonKey()
  final int? numberRowNotSaved;
  @JsonKey()
  final int? numberRowSaved;

}