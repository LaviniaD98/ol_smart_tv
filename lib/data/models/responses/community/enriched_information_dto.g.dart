// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enriched_information_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnrichedInformationDto _$EnrichedInformationDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'EnrichedInformationDto',
      json,
      ($checkedConvert) {
        final val = EnrichedInformationDto(
          los: $checkedConvert(
              'los',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => LosDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          initiatives: $checkedConvert(
              'initiatives',
              (v) => (v as List<dynamic>?)
                  ?.map(
                      (e) => InitiativeDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          users: $checkedConvert(
              'users',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      CommunityUserDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );
