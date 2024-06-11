

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'community_add_comment_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class CommunityAddCommentModelDto {
  CommunityAddCommentModelDto({
    this.id,
    this.message,
  });

  factory CommunityAddCommentModelDto.fromJson(Map<String, dynamic> json) => _$CommunityAddCommentModelDtoFromJson(json);
  factory CommunityAddCommentModelDto.fromResponse(String res) => CommunityAddCommentModelDto.fromJson(jsonDecode(res));

  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "message")
  final String? message;

}