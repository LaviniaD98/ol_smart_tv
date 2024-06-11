import 'package:freezed_annotation/freezed_annotation.dart';

part 'community_topic_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class CommunityTopicDto {
  CommunityTopicDto({this.code, this.filtered, this.name});

  factory CommunityTopicDto.fromJson(Map<String, dynamic> json) => _$CommunityTopicDtoFromJson(json);

  @JsonKey(name: "code")
  final String? code;
  @JsonKey(name: "filtered")
  final bool? filtered;
  @JsonKey(name: "name")
  final String? name;
}