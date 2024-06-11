// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'UserModel',
      json,
      ($checkedConvert) {
        final val = UserModel(
          idUser: $checkedConvert('id_user', (v) => v as int?),
          organizationId: $checkedConvert('organization_id', (v) => v as int?),
          externalId: $checkedConvert('external_id', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          surname: $checkedConvert('surname', (v) => v as String?),
          email: $checkedConvert('email', (v) => v as String?),
          phoneNumber: $checkedConvert('phone_number', (v) => v as String?),
          address: $checkedConvert('address', (v) => v as String?),
          job: $checkedConvert('job', (v) => v as int?),
          status: $checkedConvert('status', (v) => v as String?),
          roles: $checkedConvert(
              'roles',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => $enumDecode(_$UserRolesEnumMap, e))
                  .toList()),
          permissions: $checkedConvert('permissions',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          uog: $checkedConvert('uog',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          skills: $checkedConvert('skills',
              (v) => (v as List<dynamic>?)?.map((e) => e as int).toList()),
          personas: $checkedConvert(
              'personas',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => $enumDecode(_$UserPersonasEnumMap, e))
                  .toList()),
          initiativeid: $checkedConvert('initiative_id', (v) => v as int?),
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

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id_user': instance.idUser,
      'organization_id': instance.organizationId,
      'external_id': instance.externalId,
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'address': instance.address,
      'job': instance.job,
      'status': instance.status,
      'roles': instance.roles?.map((e) => _$UserRolesEnumMap[e]!).toList(),
      'permissions': instance.permissions,
      'uog': instance.uog,
      'skills': instance.skills,
      'personas':
          instance.personas?.map((e) => _$UserPersonasEnumMap[e]!).toList(),
      'initiative_id': instance.initiativeid,
    };

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
