import 'package:open_learning_smart_tv/data/data_sources/strip/strip_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';

import '../../../domain/entities/strip/row/strip_row.dart';
import '../../../domain/entities/wall/wall_model.dart';
import '../../../domain/repositories/wall/wall_repository.dart';

@LazySingleton(as: WallRepository)
class WallRepositoryImpl implements WallRepository {
  final StripDataSource _stripDataSource;

  WallRepositoryImpl(this._stripDataSource);

  @override
  Future<Either<Failure, WallModel>> getStripWall(StripRow strip, String path) {
    return strip.maybeMap(
      visCarSuggested: (_) => catchFailure(() async {
        final res = await _stripDataSource.getSuggested(path);
        return WallModel.fromDto(res.items, res.metadata);
      }),
      visForYou: (_) => catchFailure(() async {
        final res = await _stripDataSource.getVisForYou(path);
        return WallModel.fromDto(res.items, res.metadata);
      }),
      trainingMandatory: (_) => catchFailure(() async {
        final res = await _stripDataSource.getTrainingMandatory(path);
        return WallModel.fromDto(res.items, res.metadata);
      }),
      sliderTopContentExplore: (_) => catchFailure(() async {
        final res = await _stripDataSource.getSliderTopContent(path);
        return WallModel.fromDto(res.items, res.metadata);
      }),
      visCarBestRating: (_) => catchFailure(() async {
        final res = await _stripDataSource.getVisCarBestRating(path);
        return WallModel.fromDto(res.items, res.metadata);
      }),
      latestLearning: (_) => catchFailure(() async {
        final res = await _stripDataSource.getLatestLearning(path);
        return WallModel.fromDto(res.items, res.metadata);
      }),
      visCarTrainingTransversal: (_) => catchFailure(() async {
        final res = await _stripDataSource.getTrainingTransversal(path);
        return WallModel.fromDto(res.items, res.metadata);
      }),
      visCarCategory: (_) => catchFailure(() async {
        final res = await _stripDataSource.getVisCarCategory(path);
        return WallModel.fromDto(res.items, res.metadata);
      }),
      widgetContinueLearning: (_) => catchFailure(() async {
        final res = await _stripDataSource.getContinueLearning(path);
        return WallModel.fromDto(res.items, res.metadata);
      }),
      favourites: (_) => catchFailure(() async {
        final res = await _stripDataSource.getFavourites(path);
        return WallModel.fromDto(res.items, res.metadata);
      }),
      smartLearning: (_) => catchFailure(() async {
        final res = await _stripDataSource.getSmartLearning(path);
        return WallModel.fromDto(res.items, res.metadata);
      }),
      orElse: () =>
          Future.value(const Left(Failure(error: 'Unknown Strip Row Type'))),
    );
  }
}
