import 'package:open_learning_smart_tv/domain/entities/search/suggestion_model.dart';
import 'package:open_learning_smart_tv/domain/entities/wall/wall_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';

import '../../../domain/repositories/search/search_repository.dart';
import '../../data_sources/search/search_data_source.dart';

@LazySingleton(as: SearchRepository)
class SearchRepositoryImpl implements SearchRepository {
  final SearchDataSource _searchDataSource;

  SearchRepositoryImpl(this._searchDataSource);

  @override
  Future<Either<Failure, List<SuggestionModel>>> getSuggestions(String text) {
    return catchFailure(() async {
      final res = await _searchDataSource.getSuggestions(text);
      return res.results.map((e) => SuggestionModel.fromDto(e)).toList();
    });
  }

  @override
  Future<Either<Failure, WallModel>> getSearchWall({
    int? corporateId,
    int? initiativeId,
    required String text,
    required int page,
    required int pageSize,
  }) {
    return catchFailure(() async {
      final res = await _searchDataSource.getSearchWall(
        corporateId: corporateId,
        initiativeId: initiativeId,
        text: text,
        page: page,
        pageSize: pageSize,
      );
      return WallModel.fromDto(res.items, res.metadata);
    });
  }
}
