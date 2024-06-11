import 'package:open_learning_smart_tv/domain/entities/rating/rating_model.dart';
import 'package:dartz/dartz.dart';

import '../../../data/models/failure.dart';

abstract class RatingRepository {
  Future<Either<Failure, RatingModel>> rateLearningObject(
      String path, int rating);
}
