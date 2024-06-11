// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageDto _$PageDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'PageDto',
      json,
      ($checkedConvert) {
        final val = PageDto(
          $checkedConvert('pageName', (v) => v as String),
          $checkedConvert(
              'relativePaths',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      RelativePathDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );
