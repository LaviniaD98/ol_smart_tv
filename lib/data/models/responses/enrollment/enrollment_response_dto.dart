import 'package:freezed_annotation/freezed_annotation.dart';

part 'enrollment_response_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class EnrollmentResponseDto {

  EnrollmentResponseDto(
      this.enrollNotSaved,
      this.enrollSaved,
      this.errorMessage,
      this.numberNotSaved,
      this.numberSaved,
      );

  factory EnrollmentResponseDto.fromJson(Map<String, dynamic> json) =>
      _$EnrollmentResponseDtoFromJson(json);

  @JsonKey()
  final List<String>? enrollNotSaved;
  @JsonKey()
  final List<String>? enrollSaved;
  @JsonKey()
  final String? errorMessage;
  @JsonKey()
  final int? numberNotSaved;
  @JsonKey()
  final int? numberSaved;

}