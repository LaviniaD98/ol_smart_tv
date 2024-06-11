// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uog_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UogDto _$UogDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'UogDto',
      json,
      ($checkedConvert) {
        final val = UogDto(
          $checkedConvert('uog', (v) => v as String?),
          $checkedConvert('uog_description', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'uogDescription': 'uog_description'},
    );
