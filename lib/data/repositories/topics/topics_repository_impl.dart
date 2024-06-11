import 'package:open_learning_smart_tv/data/data_sources/topic/topics_data_source.dart';
import 'package:open_learning_smart_tv/domain/repositories/topics/topics_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';

import '../../../domain/entities/topics/topics_model.dart';

@LazySingleton(as: TopicsRepository)
class TopicsRepositoryImpl implements TopicsRepository {
  final TopicsDataSource _topicsDataSource;

  TopicsRepositoryImpl(this._topicsDataSource);

  @override
  Future<Either<Failure, TopicsModel>> getTopics() {
    return catchFailure(() async {
      final res = await _topicsDataSource.getTopics();
      return TopicsModel.fromResponse(res);
    });
  }
}
