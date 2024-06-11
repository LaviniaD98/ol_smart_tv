import 'package:open_learning_smart_tv/data/models/responses/rating/rating_dto.dart';

import '../../enums/types.dart';

class RatingModel {
  RatingModel({
    this.corporateId,
    this.domainId,
    this.learnerId,
    this.learningObjectId,
    this.rating,
    this.lastRated,
    this.learningObjectType,
  });

  factory RatingModel.fromDto(RatingDto dto) {
    return RatingModel(
      corporateId: dto.corporateId,
      domainId: dto.domainId,
      learnerId: dto.learnerId,
      learningObjectId: dto.learningObjectId,
      rating: dto.rating,
      lastRated: dto.lastRated,
      learningObjectType: dto.learningObjectType,
    );
  }

  final int? corporateId;
  final int? domainId;
  final int? learnerId;
  final int? learningObjectId;
  final int? rating;
  final String? lastRated;
  final LearningObjectType? learningObjectType;
}
