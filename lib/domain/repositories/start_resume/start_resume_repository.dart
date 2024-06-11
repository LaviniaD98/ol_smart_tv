import 'package:dartz/dartz.dart';
import '../../../data/models/failure.dart';
import '../../entities/strip/learning_object/learning_object_model.dart';

abstract class StartResumeRepository {
  Future<Either<Failure, LearningObjectModel>> startResume(String path);
}