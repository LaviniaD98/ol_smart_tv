import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/enums/types.dart';
import 'community_topic_dto.dart';

part 'community_data_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class CommunityDataDto {
  CommunityDataDto({
    this.commentCount,
    this.attachments,
    this.ownerId,
    this.commentId,
    this.created,
    this.postType,
    this.publishDate,
    this.title,
    this.body,
    this.bodyTrim,
    this.subtitle,
    this.topic,
    this.id,
    this.likes,
    this.changed,
    this.userId,
    this.loId,
    required this.learningObjectTypology,
    this.reply,
  });

  factory CommunityDataDto.fromJson(Map<String, dynamic> json) =>
      _$CommunityDataDtoFromJson(json);

  @JsonKey(name: "comment_count")
  final String? commentCount;
  @JsonKey(name: "attachments")
  final dynamic attachments;
  @JsonKey(name: "owner_id")
  final String? ownerId;
  @JsonKey(name: "comment_id")
  final String? commentId;
  @JsonKey(name: "created")
  final String? created;
  @JsonKey(name: "post_type")
  final String? postType;
  @JsonKey(name: "publishDate")
  final String? publishDate;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "body")
  final String? body;
  @JsonKey(name: "body_trim")
  final String? bodyTrim;
  @JsonKey(name: "subtitle")
  final String? subtitle;
  @JsonKey(name: "topic")
  final List<CommunityTopicDto>? topic;
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "likes")
  final String? likes;
  @JsonKey(name: "changed")
  final String? changed;
  @JsonKey(name: "user_id")
  final String? userId;
  @JsonKey(name: "lo_id")
  final String? loId;
  @JsonKey(
      name: "lo_type",
      defaultValue: LearningObjectTypology.unknown,
      unknownEnumValue: LearningObjectTypology.unknown)
  final LearningObjectTypology learningObjectTypology;
  @JsonKey(name: "reply")
  final String? reply;
}
