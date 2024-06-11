import 'package:open_learning_smart_tv/data/models/responses/edition/edition_response_dto.dart';

class EditionsResponseModel {
  EditionsResponseModel({
    this.errorMessages,
    this.numberRowNotSaved,
    this.numberRowSaved,
  });

  factory EditionsResponseModel.fromDto(EditionResponseDto dto) {
    return EditionsResponseModel(
      errorMessages: dto.errorMessages,
      numberRowNotSaved: dto.numberRowNotSaved,
      numberRowSaved: dto.numberRowSaved,
    );
  }

  final List<String>? errorMessages;
  final int? numberRowNotSaved;
  final int? numberRowSaved;
}
