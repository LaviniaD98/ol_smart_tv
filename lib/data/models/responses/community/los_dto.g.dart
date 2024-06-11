// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'los_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LosDto _$LosDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'LosDto',
      json,
      ($checkedConvert) {
        final val = LosDto(
          loId: $checkedConvert('lo_id', (v) => v as String?),
          coverId: $checkedConvert('coverId', (v) => (v as num?)?.toDouble()),
          topics: $checkedConvert('topics',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          description: $checkedConvert('description', (v) => v as String?),
          title: $checkedConvert('title', (v) => v as String?),
          publicCoverUrl:
              $checkedConvert('publicCoverUrl', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'loId': 'lo_id'},
    );
