import 'package:open_learning_smart_tv/data/models/responses/ecm/ecm_pager_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/metadata_model.dart';
import '../../../data/models/responses/ecm/ecm_profession_dto.dart';
import 'ecm_profession_model.dart';

class EcmProfessionsModel {
  EcmProfessionsModel({
    required this.items,
    this.metadata,
  });

  factory EcmProfessionsModel.fromDto(
    List<EcmProfessionDto>? items,
    EcmPagerDto? metadataDto,
  ) {
    return EcmProfessionsModel(
      items: items?.map((e) => EcmProfessionModel.fromDto(e)).toList() ?? [],
      metadata: metadataDto != null ? MetadataModel.fromEcm(metadataDto) : null,
    );
  }

  final List<EcmProfessionModel> items;
  final MetadataModel? metadata;
}
