import 'package:json_annotation/json_annotation.dart';

part 'source_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class SourceDto {
  SourceDto(
    this.posterSources,
    this.thumbnailSources,
    this.codecs,
    this.extXVersion,
    this.type,
    this.profiles,
    this.avgBitrate,
    this.codec,
    this.container,
    this.duration,
    this.height,
    this.width,
    this.size,
    this.src,
  );

  factory SourceDto.fromJson(Map<String, dynamic> json) =>
      _$SourceDtoFromJson(json);

  @JsonKey(name: "poster_sources")
  final List<String>? posterSources;
  @JsonKey(name: "thumbnail_sources")
  final List<String>? thumbnailSources;
  @JsonKey(name: "codecs")
  final String? codecs;
  @JsonKey(name: "ext_x_version")
  final String? extXVersion;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "profiles")
  final String? profiles;
  @JsonKey(name: "avg_bitrate")
  final int? avgBitrate;
  @JsonKey(name: "codec")
  final String? codec;
  @JsonKey(name: "container")
  final String? container;
  @JsonKey(name: "duration")
  final int? duration;
  @JsonKey(name: "height")
  final int? height;
  @JsonKey(name: "width")
  final int? width;
  @JsonKey(name: "size")
  final int? size;
  @JsonKey(name: "src")
  final String? src;
}
