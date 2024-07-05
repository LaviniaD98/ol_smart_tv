// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetadataDto _$MetadataDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'MetadataDto',
      json,
      ($checkedConvert) {
        final val = MetadataDto(
          $checkedConvert('totalPages', (v) => (v as num).toInt()),
          $checkedConvert('totalElements', (v) => (v as num).toInt()),
          $checkedConvert(
              'output',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      RelativePathDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );
