// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ecm_pager_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EcmPagerDto _$EcmPagerDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'EcmPagerDto',
      json,
      ($checkedConvert) {
        final val = EcmPagerDto(
          totalElements:
              $checkedConvert('total_elements', (v) => (v as num?)?.toInt()),
          totalPages:
              $checkedConvert('total_pages', (v) => (v as num?)?.toInt()),
          page: $checkedConvert('num_page', (v) => (v as num?)?.toInt()),
          pageSize: $checkedConvert('page_size', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
      fieldKeyMap: const {
        'totalElements': 'total_elements',
        'totalPages': 'total_pages',
        'page': 'num_page',
        'pageSize': 'page_size'
      },
    );
