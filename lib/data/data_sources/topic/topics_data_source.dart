import 'package:open_learning_smart_tv/data/models/responses/topics/topics_dto.dart';

abstract class TopicsDataSource {
  Future<TopicsDto> getTopics();
}
