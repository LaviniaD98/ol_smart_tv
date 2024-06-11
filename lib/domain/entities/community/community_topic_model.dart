import 'package:open_learning_smart_tv/data/models/responses/community/community_topic_dto.dart';

class CommunityTopicModel {
  CommunityTopicModel({
    this.code,
    this.filtered,
    this.name,
  });

  factory CommunityTopicModel.fromDto(CommunityTopicDto dto) {
    return CommunityTopicModel(
      code: dto.code,
      filtered: dto.filtered,
      name: dto.name,
    );
  }

  final String? code;
  final bool? filtered;
  final String? name;
}
