import 'package:open_learning_smart_tv/data/models/responses/ecm/ecm_pager_dto.dart';

import '../../../data/models/responses/generic/metadata_dto.dart';

class MetadataModel {
  final int? totalPages;
  final int? totalElements;

  const MetadataModel({
    this.totalPages,
    this.totalElements,
  });

  factory MetadataModel.fromResponse(MetadataDto response) {
    return MetadataModel(
      totalPages: response.totalPages,
      totalElements: response.totalElements,
    );
  }

  factory MetadataModel.fromEcm(EcmPagerDto response) {
    return MetadataModel(
      totalPages: response.totalPages,
      totalElements: response.totalElements,
    );
  }
}
