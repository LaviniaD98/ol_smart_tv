import '../../../data/models/responses/topics/topics_dto.dart';
import '../../entities/generic/metadata_model.dart';
import 'topic_model.dart';

class TopicsModel {
  final MetadataModel? metadata;
  final List<TopicModel>? output;

  const TopicsModel({
    this.metadata,
    this.output
  });

  factory TopicsModel.fromResponse(TopicsDto response) {
    return TopicsModel(
      output: response.output?.map((e) => TopicModel.fromResponse(e)).toList()
    );
  }
}