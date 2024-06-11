import 'package:open_learning_smart_tv/data/models/responses/generic/metadata_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/metadata_model.dart';
import '../../../data/models/responses/strip/learning_object_dto.dart';
import '../strip/learning_object/learning_object_model.dart';

class WallModel {
  WallModel({
    required this.learningObjects,
    this.metadata,
  });

  factory WallModel.fromDto(
      List<LearningObjectDto>? learningObjects, MetadataDto? metadataDto) {
    return WallModel(
      learningObjects: learningObjects
              ?.map((e) => LearningObjectModel.fromDto(e))
              .toList() ??
          [],
      metadata:
          metadataDto != null ? MetadataModel.fromResponse(metadataDto) : null,
    );
  }

  final List<LearningObjectModel> learningObjects;
  final MetadataModel? metadata;
}
