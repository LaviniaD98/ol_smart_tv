import 'package:open_learning_smart_tv/data/models/responses/community/initiative_dto.dart';

class InitiativeModel {
  InitiativeModel({
    this.id,
    this.label,
  });

  factory InitiativeModel.fromDto(InitiativeDto dto) {
    return InitiativeModel(
      id: dto.id,
      label: dto.label,
    );
  }

  final double? id;
  final String? label;
}
