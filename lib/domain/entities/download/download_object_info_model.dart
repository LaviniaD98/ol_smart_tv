import 'package:open_learning_smart_tv/data/models/responses/download/download_object_info_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/download/source_model.dart';
import 'package:collection/collection.dart';

class DownloadObjectInfoModel {
  DownloadObjectInfoModel({
    this.sources,
    this.poster,
    this.thumbnail,
    this.accountId,
    this.duration,
    this.id,
  });

  factory DownloadObjectInfoModel.fromDto(DownloadObjectInfoDto? dto) {
    return DownloadObjectInfoModel(
      sources: dto?.sources
          ?.map((dto) => SourceModel(
                codecs: dto.codecs,
                extXVersion: dto.extXVersion,
                type: dto.type,
                profiles: dto.profiles,
                avgBitrate: dto.avgBitrate,
                codec: dto.codec,
                container: dto.container,
                duration: dto.duration,
                height: dto.height,
                width: dto.width,
                size: dto.size,
                src: dto.src,
              ))
          .toList(),
      poster: dto?.poster,
      thumbnail: dto?.thumbnail,
      accountId: dto?.accountId,
      duration: dto?.duration,
      id: dto?.id,
    );
  }

  final List<SourceModel>? sources;
  final String? poster;
  final String? thumbnail;
  final String? accountId;
  final int? duration;
  final String? id;

  SourceModel? getDownloadableContent() {
    SourceModel? bestMatch;
    if (sources?.isNotEmpty == true) {
      sources?.forEach((source) {
        if (source.container == "MP4") {
          if (bestMatch == null) {
            bestMatch = source;
          } else {
            bestMatch = _compareHttps(bestMatch, source);
            bestMatch = _compareSize(bestMatch, source);
          }
        }
      });
    }
    return bestMatch;
  }

  SourceModel? getVideoContent() {
    if (sources == null || sources!.isEmpty) return null;
    final mpegHttps = sources!.firstWhereOrNull((element) =>
        element.type == 'application/x-mpegURL' &&
        element.src?.startsWith('https:') == true);
    if (mpegHttps != null) return mpegHttps;
    final mpegHttp = sources!.firstWhereOrNull((element) =>
        element.type == 'application/x-mpegURL' &&
        element.src?.startsWith('http:') == true);
    if (mpegHttp != null) return mpegHttp;
    final dashHttps = sources!.firstWhereOrNull((element) =>
        element.type == 'application/dash+xml' &&
        element.src?.startsWith('https:') == true);
    if (dashHttps != null) return dashHttps;
    final dashHttp = sources!.firstWhereOrNull((element) =>
        element.type == 'aapplication/dash+xml' &&
        element.src?.startsWith('http:') == true);
    if (dashHttp != null) return dashHttp;
    return null;
  }

  SourceModel? _compareHttps(
      SourceModel? currentBestMatch, SourceModel? possibleBestMatch) {
    if (currentBestMatch?.src?.startsWith("https:") == true) {
      return currentBestMatch;
    } else if (currentBestMatch?.src?.startsWith("http:") == true &&
        possibleBestMatch?.src?.startsWith("https:") == true) {
      return possibleBestMatch;
    }
    return currentBestMatch;
  }

  SourceModel? _compareSize(
      SourceModel? currentBestMatch, SourceModel? possibleBestMatch) {
    if (currentBestMatch?.src?.startsWith("https:") == true &&
        possibleBestMatch?.src?.startsWith("http:") == true) {
      return currentBestMatch;
    } else if (currentBestMatch?.src?.startsWith("http:") == true &&
        possibleBestMatch?.src?.startsWith("https:") == true) {
      return possibleBestMatch;
    } else {
      if (currentBestMatch != null &&
          possibleBestMatch != null &&
          (currentBestMatch.size! >= possibleBestMatch.size!)) {
        return currentBestMatch;
      } else {
        return possibleBestMatch;
      }
    }
  }
}
