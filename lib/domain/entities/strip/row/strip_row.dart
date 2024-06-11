import 'package:freezed_annotation/freezed_annotation.dart';
part 'strip_row.freezed.dart';

@freezed
class StripRow with _$StripRow {
  const factory StripRow.widgetCalendar({
    required int id,
    required String apiPath,
    String? title,
    bool? preSelected,
    String? labelMapping,
  }) = WidgetCalendar;
  const factory StripRow.widgetContinueLearning({
    required int id,
    required String apiPath,
    String? title,
    bool? preSelected,
    String? labelMapping,
  }) = WidgetContinueLearning;
  const factory StripRow.visForYou({
    required int id,
    required String apiPath,
    String? title,
    bool? preSelected,
    String? labelMapping,
  }) = VisForYou;
  const factory StripRow.sliderTopContentExplore({
    required int id,
    required String apiPath,
    String? title,
    bool? preSelected,
    String? labelMapping,
  }) = SliderTopContentExplore;
  const factory StripRow.trainingMandatory({
    required int id,
    required String apiPath,
    String? title,
    bool? preSelected,
    String? labelMapping,
  }) = TrainingMandatory;
  const factory StripRow.visCarSuggested({
    required int id,
    required String apiPath,
    String? title,
    bool? preSelected,
    String? labelMapping,
  }) = VisCarSuggested;
  const factory StripRow.visCarTrainingTransversal({
    required int id,
    required String apiPath,
    String? title,
    bool? preSelected,
    String? labelMapping,
  }) = VisCarTrainingTransversal;
  const factory StripRow.visCarBestRating({
    required int id,
    required String apiPath,
    String? title,
    bool? preSelected,
    String? labelMapping,
  }) = VisCarBestRating;
  const factory StripRow.latestLearning({
    required int id,
    required String apiPath,
    String? title,
    bool? preSelected,
    String? labelMapping,
  }) = LatestLearning;
  const factory StripRow.favourites({
    required int id,
    required String apiPath,
    String? title,
    bool? preSelected,
    String? labelMapping,
  }) = Favourites;
  const factory StripRow.visCarCategory({
    required int id,
    required String apiPath,
    String? title,
    bool? preSelected,
    String? labelMapping,
  }) = VisCarCategory;

  ///App object for wall page
  const factory StripRow.smartLearning({
    required int id,
    required String apiPath,
    String? title,
    bool? preSelected,
    String? labelMapping,
    DateTime? startTime,
    DateTime? endTime,
  }) = SmartLearning;
}