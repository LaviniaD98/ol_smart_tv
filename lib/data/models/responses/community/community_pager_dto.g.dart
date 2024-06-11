// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_pager_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityPagerDto _$CommunityPagerDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CommunityPagerDto',
      json,
      ($checkedConvert) {
        final val = CommunityPagerDto(
          totalElements:
              $checkedConvert('total_elements', (v) => (v as num?)?.toDouble()),
          totalPages:
              $checkedConvert('total_pages', (v) => (v as num?)?.toDouble()),
          currentPage:
              $checkedConvert('current_page', (v) => (v as num?)?.toDouble()),
          pageSize:
              $checkedConvert('page_size', (v) => (v as num?)?.toDouble()),
        );
        return val;
      },
      fieldKeyMap: const {
        'totalElements': 'total_elements',
        'totalPages': 'total_pages',
        'currentPage': 'current_page',
        'pageSize': 'page_size'
      },
    );
