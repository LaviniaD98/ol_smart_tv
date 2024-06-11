import 'package:open_learning_smart_tv/data/models/requests/rating_body_dto.dart';

import '../../models/responses/rating/rating_dto.dart';

abstract class RatingDataSource {
  Future<RatingDto> rateLearningObject(String path, RatingBodyDto rating);
}
