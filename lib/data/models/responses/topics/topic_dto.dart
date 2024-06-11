import 'package:open_learning_smart_tv/data/models/responses/generic/url_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'topic_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class TopicDto {
  TopicDto(
      this.name, this.order, this.id, this.learningObjectAssociated, this.url);

  factory TopicDto.fromJson(Map<String, dynamic> json) =>
      _$TopicDtoFromJson(json);

  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "order")
  final int order;
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "learning_object_associated")
  final int learningObjectAssociated;
  @JsonKey(name: "url")
  final UrlDto url;
}
