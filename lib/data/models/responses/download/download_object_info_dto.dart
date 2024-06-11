import 'package:open_learning_smart_tv/data/models/responses/download/source_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'download_object_info_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class DownloadObjectInfoDto {
  DownloadObjectInfoDto(
    this.sources,
    this.poster,
    this.thumbnail,
    this.accountId,
    this.name,
    this.duration,
    this.id,
  );

  factory DownloadObjectInfoDto.fromJson(Map<String, dynamic> json) =>
      _$DownloadObjectInfoDtoFromJson(json);

  @JsonKey(name: "sources")
  final List<SourceDto>? sources;
  @JsonKey(name: "poster")
  final String? poster;
  @JsonKey(name: "thumbnail")
  final String? thumbnail;
  @JsonKey(name: "account_id")
  final String? accountId;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "duration")
  final int? duration;
  @JsonKey(name: "id")
  final String? id;
}
