import 'package:open_learning_smart_tv/data/models/responses/ecm/ecm_discipline_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/ecm/ecm_pager_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/metadata_model.dart';
import 'ecm_discipline_model.dart';

class EcmDisciplinesModel {
  EcmDisciplinesModel({
    required this.items,
    this.metadata,
  });

  factory EcmDisciplinesModel.fromDto(
    List<EcmDisciplineDto>? items,
    EcmPagerDto? metadataDto,
  ) {
    return EcmDisciplinesModel(
      items: items?.map((e) => EcmDisciplineModel.fromDto(e)).toList() ?? [],
      metadata: metadataDto != null ? MetadataModel.fromEcm(metadataDto) : null,
    );
  }

  final List<EcmDisciplineModel> items;
  final MetadataModel? metadata;
}
