import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:open_learning_smart_tv/data/models/requests/rating_body_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/rating/rating_model.dart';
import '../../../domain/repositories/rating/rating_repository.dart';
import '../../data_sources/rating/rating_data_source.dart';

@LazySingleton(as: RatingRepository)
class RatingRepositoryImpl implements RatingRepository {
  final RatingDataSource _ratingDataSource;

  RatingRepositoryImpl(this._ratingDataSource);

  @override
  Future<Either<Failure, RatingModel>> rateLearningObject(
      String path, int rating) {
    return catchFailure(() async {
      final res = await _ratingDataSource.rateLearningObject(
        path,
        RatingBodyDto(rating),
      );
      return RatingModel.fromDto(res);
    });
  }
}
