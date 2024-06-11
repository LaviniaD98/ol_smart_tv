import 'package:open_learning_smart_tv/domain/repositories/topics/topics_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';

import '../../entities/topics/topics_model.dart';

@lazySingleton
class GetTopicsUseCase {
  final TopicsRepository _topicsRepository;
  GetTopicsUseCase(this._topicsRepository);
  Future<Either<Failure, TopicsModel>> call() {
    return _topicsRepository.getTopics();
  }
}
