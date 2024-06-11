import 'package:open_learning_smart_tv/data/models/responses/topics/topic_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'topics_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class TopicsDto {
  TopicsDto(this.output);

  factory TopicsDto.fromJson(Map<String, dynamic> json) =>
      _$TopicsDtoFromJson(json);

  @JsonKey(name: "output")
  final List<TopicDto>? output;
}
