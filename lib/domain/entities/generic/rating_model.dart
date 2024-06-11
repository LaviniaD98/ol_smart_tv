import 'package:open_learning_smart_tv/data/models/responses/generic/rating_dto.dart';

import '../../../data/models/responses/generic/learner_object_dto.dart';

class RatingResponseModel {
  RatingResponseModel(
      {this.corporateId,
      this.domainId,
      this.totalNumberOfPages,
      this.totalNumberOfElements,
      this.learnerObjectList});

  factory RatingResponseModel.fromDto(RatingDto dto) {
    return RatingResponseModel(
        corporateId: dto.corporateId,
        domainId: dto.domainId,
        totalNumberOfPages: dto.totalNumberOfPages,
        totalNumberOfElements: dto.totalNumberOfElements,
        learnerObjectList: dto.learnerObjectList);
  }

  final int? corporateId;
  final int? domainId;
  final int? totalNumberOfPages;
  final int? totalNumberOfElements;
  final List<LearnerObjectDto>? learnerObjectList;
}
