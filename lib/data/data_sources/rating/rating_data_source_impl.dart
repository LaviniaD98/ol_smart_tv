import 'package:open_learning_smart_tv/data/data_sources/rating/rating_data_source.dart';
import 'package:open_learning_smart_tv/data/models/requests/rating_body_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../core/web_client_config/web_client_config.dart';
import '../../models/responses/rating/rating_dto.dart';

part 'rating_data_source_impl.g.dart';

@RestApi()
@LazySingleton(as: RatingDataSource)
abstract class RatingDataSourceImpl implements RatingDataSource {
  @factoryMethod
  factory RatingDataSourceImpl(@Named(WebClientType.authenticated) Dio dio) =
      _RatingDataSourceImpl;

  @override
  @POST('{path}')
  Future<RatingDto> rateLearningObject(
      @Path('path') String path, @Body() RatingBodyDto ratingBodyDto);
}
