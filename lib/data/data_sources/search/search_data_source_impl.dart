import 'package:open_learning_smart_tv/data/data_sources/search/search_data_source.dart';
import 'package:open_learning_smart_tv/data/models/responses/search/search_results_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/core/web_client_config/web_client_config.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/responses/search/suggestions_dto.dart';

part 'search_data_source_impl.g.dart';

@RestApi()
@LazySingleton(as: SearchDataSource)
abstract class SearchDataSourceImpl implements SearchDataSource {
  @factoryMethod
  factory SearchDataSourceImpl(@Named(WebClientType.authenticated) Dio dio) =
      _SearchDataSourceImpl;

  @override
  @GET(
      '/learning-catalogue/current-session?free_text={text}&page=0&page_size=10')
  Future<SuggestionsDto> getSuggestions(@Path('text') String text);

  @override
  @GET(
      '/learning-catalogue/{corporateId}/{initiativeId}/freeTextSearch?freeText={text}&pageNumber={page}&pageSize={pageSize}')
  Future<SearchResultsDto> getSearchWall({
    @Path('corporateId') int? corporateId,
    @Path('initiativeId') int? initiativeId,
    @Path('text') required String text,
    @Path('page') required int page,
    @Path('pageSize') required int pageSize,
  });
}
