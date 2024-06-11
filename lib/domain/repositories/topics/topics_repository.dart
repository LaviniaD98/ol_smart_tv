import 'package:dartz/dartz.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';
import '../../entities/topics/topics_model.dart';

abstract class TopicsRepository {
  Future<Either<Failure, TopicsModel>> getTopics();
}
