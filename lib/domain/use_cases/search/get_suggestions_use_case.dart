import 'package:open_learning_smart_tv/domain/entities/search/suggestion_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/failure.dart';
import '../../repositories/search/search_repository.dart';

@lazySingleton
class GetSuggestionsUseCase {
  final SearchRepository _searchRepository;

  GetSuggestionsUseCase(
    this._searchRepository,
  );

  Future<Either<Failure, List<SuggestionModel>>> call(String text) async {
    return await _searchRepository.getSuggestions(text);
  }
}
