import 'package:open_learning_smart_tv/data/models/responses/generic/editions_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/edition_model.dart';

class EditionsModel {
  EditionsModel({
    this.editions,
  });

  factory EditionsModel.fromDto(EditionsDto dto) {
    return EditionsModel(
      editions: dto.editions?.map((e) => EditionModel.fromDto(e)).toList(),
    );
  }

  final List<EditionModel>? editions;
}
