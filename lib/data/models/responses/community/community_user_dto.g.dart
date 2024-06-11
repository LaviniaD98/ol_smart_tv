// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityUserDto _$CommunityUserDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CommunityUserDto',
      json,
      ($checkedConvert) {
        final val = CommunityUserDto(
          corporateName: $checkedConvert('corporateName', (v) => v as String?),
          surname: $checkedConvert('surname', (v) => v as String?),
          ownerId: $checkedConvert('owner_id', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          profileImageUrl:
              $checkedConvert('profileImageUrl', (v) => v as String?),
          corporateId: $checkedConvert('corporateId', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'ownerId': 'owner_id'},
    );
