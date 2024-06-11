import 'package:open_learning_smart_tv/data/models/responses/strip/wrapper/calendar_strip_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/strip/wrapper/continue_learning_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/strip/wrapper/slider_top_content_strip_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/strip/wrapper/training_mandatory_strip_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/strip/wrapper/vis_car_best_rating_strip_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/strip/wrapper/vis_car_training_transversal_strip_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/strip/wrapper/vis_for_you_strip_dto.dart';

import '../../models/responses/strip/wrapper/favourites_strip_dto.dart';
import '../../models/responses/strip/wrapper/latest_learning_strip_dto.dart';
import '../../models/responses/strip/wrapper/smart_learning_strip_dto.dart';
import '../../models/responses/strip/wrapper/suggested_strip_dto.dart';
import '../../models/responses/strip/wrapper/vis_car_category_strip_dto.dart';

abstract class StripDataSource {
  Future<SuggestedStripDto> getSuggested(String path);
  Future<VisForStripDto> getVisForYou(String path);
  Future<TrainingMandatoryStripDto> getTrainingMandatory(String path);
  Future<SliderTopContentStripDto> getSliderTopContent(String path);
  Future<VisCarBestRatingStripDto> getVisCarBestRating(String path);
  Future<LatestLearningStripDto> getLatestLearning(String path);
  Future<VisCarTrainingTransversalStripDto> getTrainingTransversal(String path);
  Future<FavouritesStripDto> getFavourites(String path);
  Future<VisCarCategoryStripDto> getVisCarCategory(String path);
  Future<CalendarStripDto> getCalendar(String path);
  Future<ContinueLearningDto> getContinueLearning(String path);
  Future<SmartLearningStripDto> getSmartLearning(String path);
}
