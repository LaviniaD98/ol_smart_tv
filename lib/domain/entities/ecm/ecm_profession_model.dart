import 'package:open_learning_smart_tv/data/models/responses/ecm/ecm_profession_dto.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/responses/ecm/ecm_category_dto.dart';

class EcmProfessionModel extends Equatable {
  final int id;
  final String? identifier;
  final String name;

  const EcmProfessionModel({
    required this.id,
    required this.name,
    this.identifier,
  });

  factory EcmProfessionModel.fromDto(EcmProfessionDto dto) {
    return EcmProfessionModel(
      id: dto.id,
      identifier: dto.identifier,
      name: dto.name,
    );
  }

  factory EcmProfessionModel.fromCategory(EcmCategoryDto dto) {
    return EcmProfessionModel(
      id: dto.id,
      name: dto.label,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        identifier,
      ];
}
