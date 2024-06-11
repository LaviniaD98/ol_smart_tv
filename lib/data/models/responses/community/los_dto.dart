import 'package:freezed_annotation/freezed_annotation.dart';

part 'los_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class LosDto {
  LosDto({
    this.loId,
    this.coverId,
    this.topics,
    this.description,
    this.title,
    this.publicCoverUrl,
  });

  factory LosDto.fromJson(Map<String, dynamic> json) => _$LosDtoFromJson(json);

  @JsonKey(name: 'lo_id')
  final String? loId;
  @JsonKey(name: 'coverId')
  final double? coverId;
  @JsonKey(name: 'topics')
  final List<String>? topics;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'publicCoverUrl')
  final String? publicCoverUrl;
}