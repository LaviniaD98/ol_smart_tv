// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_object_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DownloadObjectInfoDto _$DownloadObjectInfoDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'DownloadObjectInfoDto',
      json,
      ($checkedConvert) {
        final val = DownloadObjectInfoDto(
          $checkedConvert(
              'sources',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => SourceDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          $checkedConvert('poster', (v) => v as String?),
          $checkedConvert('thumbnail', (v) => v as String?),
          $checkedConvert('account_id', (v) => v as String?),
          $checkedConvert('name', (v) => v as String?),
          $checkedConvert('duration', (v) => (v as num?)?.toInt()),
          $checkedConvert('id', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'accountId': 'account_id'},
    );
