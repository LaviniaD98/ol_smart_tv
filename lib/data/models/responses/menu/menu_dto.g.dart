// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuDto _$MenuDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'MenuDto',
      json,
      ($checkedConvert) {
        final val = MenuDto(
          $checkedConvert('menuType', (v) => v as String?),
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
