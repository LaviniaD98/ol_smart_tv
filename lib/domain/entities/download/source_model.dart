import 'package:open_learning_smart_tv/data/models/responses/download/source_dto.dart';

class SourceModel {
  SourceModel({
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
  });

  factory SourceModel.fromDto(SourceDto? dto) {
    return SourceModel(
      posterSources: dto?.posterSources,
      thumbnailSources: dto?.thumbnailSources,
      codecs: dto?.codecs,
      extXVersion: dto?.extXVersion,
      type: dto?.type,
      profiles: dto?.profiles,
      avgBitrate: dto?.avgBitrate,
      codec: dto?.codec,
      container: dto?.container,
      duration: dto?.duration,
      height: dto?.height,
      width: dto?.width,
      size: dto?.size,
      src: dto?.src,
    );
  }

  final List<String>? posterSources;
  final List<String>? thumbnailSources;
  final String? codecs;
  final String? extXVersion;
  final String? type;
  final String? profiles;
  final int? avgBitrate;
  final String? codec;
  final String? container;
  final int? duration;
  final int? height;
  final int? width;
  final int? size;
  final String? src;
}
