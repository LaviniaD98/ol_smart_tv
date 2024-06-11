import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'community_data_dto.dart';
import 'community_pager_dto.dart';
import 'community_topic_dto.dart';
import 'enriched_information_dto.dart';
import 'extended_information_dto.dart';

part 'community_posts_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class CommunityPostsDto {
  CommunityPostsDto({
    this.enrichedInformation,
    this.extendedInformation,
    this.data,
    this.pager,
    this.topic,
    this.countDataObj,
  });

  factory CommunityPostsDto.fromJson(Map<String, dynamic> json) => _$CommunityPostsDtoFromJson(json);
  factory CommunityPostsDto.fromResponse(String res) => CommunityPostsDto.fromJson(jsonDecode(res));

  @JsonKey(name: "enrichedInformation")
  final EnrichedInformationDto? enrichedInformation;
  @JsonKey(name: "extendedInformation")
  final ExtendedInformationDto? extendedInformation;
  @JsonKey(name: "data")
  final List<CommunityDataDto>? data;
  @JsonKey(name: "pager")
  final CommunityPagerDto? pager;
  @JsonKey(name: "topic")
  final List<CommunityTopicDto>? topic;
  @JsonKey(name: "count_data_obj")
  final double? countDataObj;
}