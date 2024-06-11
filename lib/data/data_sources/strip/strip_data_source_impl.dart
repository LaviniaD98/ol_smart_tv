import 'package:open_learning_smart_tv/data/models/responses/strip/wrapper/continue_learning_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/strip/wrapper/favourites_strip_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/strip/wrapper/latest_learning_strip_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/strip/wrapper/slider_top_content_strip_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/strip/wrapper/suggested_strip_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/strip/wrapper/training_mandatory_strip_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/strip/wrapper/vis_car_best_rating_strip_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/strip/wrapper/vis_car_category_strip_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/strip/wrapper/vis_car_training_transversal_strip_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/strip/wrapper/vis_for_you_strip_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/core/web_client_config/web_client_config.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/responses/strip/wrapper/calendar_strip_dto.dart';
import '../../models/responses/strip/wrapper/smart_learning_strip_dto.dart';
import 'strip_data_source.dart';

part 'strip_data_source_impl.g.dart';

@RestApi()
@LazySingleton(as: StripDataSource)
abstract class StripDataSourceImpl implements StripDataSource {
  @factoryMethod
  factory StripDataSourceImpl(@Named(WebClientType.authenticated) Dio dio) =
      _StripDataSourceImpl;

  @override
  @GET('{path}')
  Future<SuggestedStripDto> getSuggested(@Path('path') String path);

  @override
  @GET('{path}')
  Future<VisForStripDto> getVisForYou(@Path('path') String path);

  @override
  @GET('{path}')
  Future<TrainingMandatoryStripDto> getTrainingMandatory(
      @Path('path') String path);

  @override
  @GET('{path}')
  Future<SliderTopContentStripDto> getSliderTopContent(
      @Path('path') String path);

  @override
  @GET('{path}')
  Future<VisCarBestRatingStripDto> getVisCarBestRating(
      @Path('path') String path);

  @override
  @GET('{path}')
  Future<LatestLearningStripDto> getLatestLearning(@Path('path') String path);

  @override
  @GET('{path}')
  Future<VisCarTrainingTransversalStripDto> getTrainingTransversal(
      @Path('path') String path);

  @override
  @GET('{path}')
  Future<FavouritesStripDto> getFavourites(@Path('path') String path);

  @override
  @GET('{path}')
  Future<VisCarCategoryStripDto> getVisCarCategory(@Path('path') String path);

  @override
  @GET('{path}')
  Future<CalendarStripDto> getCalendar(@Path('path') String path);

  @override
  @GET('{path}')
  Future<ContinueLearningDto> getContinueLearning(@Path('path') String path);

  @override
  @GET('{path}')
  Future<SmartLearningStripDto> getSmartLearning(@Path('path') String path);
}
