// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ecm_register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$EcmRegisterRequestToJson(EcmRegisterRequest instance) =>
    <String, dynamic>{
      'disciplines': instance.disciplines.map((e) => e.toJson()).toList(),
      'professions': instance.professions.map((e) => e.toJson()).toList(),
      'sponsors': instance.sponsors.map((e) => e.toJson()).toList(),
      'isProfessional': instance.isProfessional,
      'isSponsored': instance.isSponsored,
      'LOid': instance.loId,
      'corporateId': instance.corporateId,
      'enrollId': instance.enrollId,
      'userId': instance.userId,
    };
