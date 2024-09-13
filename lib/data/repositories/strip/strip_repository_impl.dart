import 'package:open_learning_smart_tv/data/data_sources/strip/strip_data_source.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/calendar/not_available_slots_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';

import '../../../domain/entities/strip/calendar/calendar_strip_model.dart';
import '../../../domain/entities/strip/row/strip_row.dart';
import '../../../domain/repositories/strip/strip_repository.dart';

@LazySingleton(as: StripRepository)
class StripRepositoryImpl implements StripRepository {
  final StripDataSource _stripDataSource;

  StripRepositoryImpl(this._stripDataSource);

  @override
  Future<Either<Failure, List<LearningObjectModel>>> getLearningObjectsStrip(
      StripRow strip, String path) {
    return strip.maybeMap(
      visCarSuggested: (_) => catchFailure(() async {
        final res = await _stripDataSource.getSuggested(path);
        return res.items?.map((e) => LearningObjectModel.fromDto(e)).toList() ??
            [];
      }),
      visForYou: (_) => catchFailure(() async {
        final res = await _stripDataSource.getVisForYou(path);
        return res.items?.map((e) => LearningObjectModel.fromDto(e)).toList() ??
            [];
      }),
      trainingMandatory: (_) => catchFailure(() async {
        final res = await _stripDataSource.getTrainingMandatory(path);
        return res.items?.map((e) => LearningObjectModel.fromDto(e)).toList() ??
            [];
      }),
      sliderTopContentExplore: (_) => catchFailure(() async {
        final res = await _stripDataSource.getSliderTopContent(path);
        return res.items?.map((e) => LearningObjectModel.fromDto(e)).toList() ??
            [];
      }),
      visCarBestRating: (_) => catchFailure(() async {
        final res = await _stripDataSource.getVisCarBestRating(path);
        return res.items?.map((e) => LearningObjectModel.fromDto(e)).toList() ??
            [];
      }),
      latestLearning: (_) => catchFailure(() async {
        final res = await _stripDataSource.getLatestLearning(path);
        return res.items?.map((e) => LearningObjectModel.fromDto(e)).toList() ??
            [];
      }),
      visCarTrainingTransversal: (_) => catchFailure(() async {
        final res = await _stripDataSource.getTrainingTransversal(path);
        return res.items?.map((e) => LearningObjectModel.fromDto(e)).toList() ??
            [];
      }),
      visCarCategory: (_) => catchFailure(() async {
        final res = await _stripDataSource.getVisCarCategory(path);
        return res.items?.map((e) => LearningObjectModel.fromDto(e)).toList() ??
            [];
      }),
      widgetContinueLearning: (_) => catchFailure(() async {
        final res = await _stripDataSource.getContinueLearning(path);
        return res.items?.map((e) => LearningObjectModel.fromDto(e)).toList() ??
            [];
      }),
      favourites: (_) => catchFailure(() async {
        final res = await _stripDataSource.getFavourites(path);
        return res.items?.map((e) => LearningObjectModel.fromDto(e)).toList() ??
            [];
      }),
      smartLearning: (_) => catchFailure(() async {
        final res = await _stripDataSource.getSmartLearning(path);
        return res.items?.map((e) => LearningObjectModel.fromDto(e)).toList() ??
            [];
      }),
      orElse: () =>
          Future.value(const Left(Failure(error: 'Unknown Strip Row Type'))),
    );
  }

  @override
  Future<Either<Failure, CalendarStripModel>> getCalendarStrip(String path) {
    return catchFailure(() async {
      final res = await _stripDataSource.getCalendar(path);
      return CalendarStripModel.fromDto(res);
    });
  }

  @override
  Future<Either<Failure, NotAvailableSlotsModel>> getNotAvailableSlots(
      String path) {
    return catchFailure(() async {
      final res = await _stripDataSource.getCalendar(path);
      return NotAvailableSlotsModel.fromDto(res);
    });
  }
}
