import 'package:open_learning_smart_tv/data/models/responses/ecm/ecm_discipline_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/ecm/ecm_profession_model.dart';
import 'package:equatable/equatable.dart';

class EcmDisciplineModel extends Equatable {
  final int id;
  final String name;
  final EcmProfessionModel profession;

  const EcmDisciplineModel({
    required this.id,
    required this.name,
    required this.profession,
  });

  factory EcmDisciplineModel.fromDto(EcmDisciplineDto dto) {
    return EcmDisciplineModel(
      id: dto.id,
      name: dto.name,
      profession: EcmProfessionModel.fromCategory(dto.profession),
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        profession,
      ];
}
