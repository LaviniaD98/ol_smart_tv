import 'package:open_learning_smart_tv/data/models/responses/enrollment/enrollment_response_dto.dart';

class EnrollmentModel {
  EnrollmentModel({
    this.enrollNotSaved,
    this.enrollSaved,
    this.errorMessage,
    this.numberNotSaved,
    this.numberSaved,
  });

  factory EnrollmentModel.fromDto(EnrollmentResponseDto dto) {
    return EnrollmentModel(
      enrollNotSaved: dto.enrollNotSaved,
      enrollSaved: dto.enrollSaved,
      errorMessage: dto.errorMessage,
      numberNotSaved: dto.numberNotSaved,
      numberSaved: dto.numberSaved,
    );
  }

  final List<String>? enrollNotSaved;
  final List<String>? enrollSaved;
  final String? errorMessage;
  final int? numberNotSaved;
  final int? numberSaved;
}
