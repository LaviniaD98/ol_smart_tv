import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/repositories/start_resume/start_resume_repository.dart';
import '../../data_sources/start_resume/start_resume_data_source.dart';

@LazySingleton(as: StartResumeRepository)
class StartResumeRepositoryImpl implements StartResumeRepository {
  final StartResumeDataSource _startResumeDataSource;
  StartResumeRepositoryImpl(this._startResumeDataSource);

  @override
  Future<Either<Failure, LearningObjectModel>> startResume(String path) {
    return catchFailure(() async {
      final res = await _startResumeDataSource.startOrResume(path);
      return LearningObjectModel.fromDto(res);
    });
  }
}
