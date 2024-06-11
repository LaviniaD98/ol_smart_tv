import 'package:open_learning_smart_tv/domain/entities/wall/wall_model.dart';
import 'package:dartz/dartz.dart';

import '../../../data/models/failure.dart';
import '../../entities/search/suggestion_model.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<SuggestionModel>>> getSuggestions(String text);
  Future<Either<Failure, WallModel>> getSearchWall({
    int? corporateId,
    int? initiativeId,
    required String text,
    required int page,
    required int pageSize,
  });
}
