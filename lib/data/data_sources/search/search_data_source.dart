import 'package:open_learning_smart_tv/data/models/responses/search/search_results_dto.dart';

import '../../models/responses/search/suggestions_dto.dart';

abstract class SearchDataSource {
  Future<SuggestionsDto> getSuggestions(String text);
  Future<SearchResultsDto> getSearchWall({
    int? corporateId,
    int? initiativeId,
    required String text,
    required int page,
    required int pageSize,
  });
}
