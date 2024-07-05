// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'UserDto',
      json,
      ($checkedConvert) {
        final val = UserDto(
          $checkedConvert('id_user', (v) => (v as num?)?.toInt()),
          $checkedConvert('organization_id', (v) => (v as num?)?.toInt()),
          $checkedConvert('external_id', (v) => v as String?),
          $checkedConvert('name', (v) => v as String?),
          $checkedConvert('surname', (v) => v as String?),
          $checkedConvert('email', (v) => v as String?),
          $checkedConvert('phone_number', (v) => v as String?),
          $checkedConvert('address', (v) => v as String?),
          $checkedConvert('job', (v) => (v as num?)?.toInt()),
          $checkedConvert('status', (v) => v as String?),
          $checkedConvert(
              'roles',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => $enumDecode(_$UserRolesEnumMap, e))
                  .toList()),
          $checkedConvert('permissions',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          $checkedConvert('uog',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          $checkedConvert(
              'skills',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => (e as num).toInt())
                  .toList()),
          $checkedConvert(
              'personas',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => $enumDecode(_$UserPersonasEnumMap, e))
                  .toList()),
          $checkedConvert('initiative_id', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
      fieldKeyMap: const {
        'idUser': 'id_user',
        'organizationId': 'organization_id',
        'externalId': 'external_id',
        'phoneNumber': 'phone_number',
        'initiativeid': 'initiative_id'
      },
    );

const _$UserRolesEnumMap = {
  UserRoles.BUSINESS_ADMIN: 'BUSINESS_ADMIN',
  UserRoles.HR: 'HR',
  UserRoles.LEARNER: 'LEARNER',
  UserRoles.MANAGER: 'MANAGER',
  UserRoles.PRODUCT_OWNER: 'PRODUCT_OWNER',
  UserRoles.TEACHER: 'TEACHER',
};

const _$UserPersonasEnumMap = {
  UserPersonas.DIRIGENTE: 'DIRIGENTE',
  UserPersonas.IMPIEGATO: 'IMPIEGATO',
  UserPersonas.LEADERSHIP: 'LEADERSHIP',
  UserPersonas.NEOASSUNTO: 'NEOASSUNTO',
  UserPersonas.QUADRO: 'QUADRO',
};
