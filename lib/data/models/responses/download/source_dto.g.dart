// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SourceDto _$SourceDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'SourceDto',
      json,
      ($checkedConvert) {
        final val = SourceDto(
          $checkedConvert('poster_sources',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          $checkedConvert('thumbnail_sources',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          $checkedConvert('codecs', (v) => v as String?),
          $checkedConvert('ext_x_version', (v) => v as String?),
          $checkedConvert('type', (v) => v as String?),
          $checkedConvert('profiles', (v) => v as String?),
          $checkedConvert('avg_bitrate', (v) => (v as num?)?.toInt()),
          $checkedConvert('codec', (v) => v as String?),
          $checkedConvert('container', (v) => v as String?),
          $checkedConvert('duration', (v) => (v as num?)?.toInt()),
          $checkedConvert('height', (v) => (v as num?)?.toInt()),
          $checkedConvert('width', (v) => (v as num?)?.toInt()),
          $checkedConvert('size', (v) => (v as num?)?.toInt()),
          $checkedConvert('src', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'posterSources': 'poster_sources',
        'thumbnailSources': 'thumbnail_sources',
        'extXVersion': 'ext_x_version',
        'avgBitrate': 'avg_bitrate'
      },
    );
