import 'package:open_learning_smart_tv/data/models/responses/strip/learning_object_dto.dart';

abstract class StartResumeDataSource {
  Future<LearningObjectDto> startOrResume(String path);
}
