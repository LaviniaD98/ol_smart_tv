import 'package:open_learning_smart_tv/data/models/responses/generic/releated_learning_activity_response_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';

class ReleatedLearningActivityResponseModel {
  ReleatedLearningActivityResponseModel({this.relatedLearningActivities});

  factory ReleatedLearningActivityResponseModel.fromDto(
      ReleatedLearningActivityResponseDto dto) {
    return ReleatedLearningActivityResponseModel(
        relatedLearningActivities: dto.relatedLearningActivities
            ?.map((dto) => LearningObjectModel.fromDto(dto))
            .toList());
  }

  final List<LearningObjectModel>? relatedLearningActivities;
}
