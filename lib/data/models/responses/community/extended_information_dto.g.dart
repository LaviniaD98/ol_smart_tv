// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extended_information_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtendedInformationDto _$ExtendedInformationDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'ExtendedInformationDto',
      json,
      ($checkedConvert) {
        final val = ExtendedInformationDto(
          profession:
              $checkedConvert('profession', (v) => (v as num?)?.toDouble()),
          persona: $checkedConvert('persona',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          externalEmployeeFlag:
              $checkedConvert('externalEmployeeFlag', (v) => v as bool?),
          lastUpdateDate:
              $checkedConvert('lastUpdateDate', (v) => (v as num?)?.toDouble()),
          roles: $checkedConvert('roles',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          externalId: $checkedConvert('externalId', (v) => v as String?),
          newHireFlag: $checkedConvert('newHireFlag', (v) => v as bool?),
          industry: $checkedConvert('industry', (v) => (v as num?)?.toDouble()),
          creationDate:
              $checkedConvert('creationDate', (v) => (v as num?)?.toDouble()),
          uog: $checkedConvert(
              'uog',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => UogDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          corporateId:
              $checkedConvert('corporateId', (v) => (v as num?)?.toDouble()),
          idUser: $checkedConvert('idUser', (v) => (v as num?)?.toDouble()),
          skills: $checkedConvert(
              'skills',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => (e as num).toInt())
                  .toList()),
          receievedCredentialsFlag:
              $checkedConvert('receievedCredentialsFlag', (v) => v as bool?),
          onboardingFlag: $checkedConvert('onboardingFlag', (v) => v as bool?),
          privacyConsentFlag:
              $checkedConvert('privacyConsentFlag', (v) => v as bool?),
          surname: $checkedConvert('surname', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          smartWorkingFlag:
              $checkedConvert('smartWorkingFlag', (v) => v as bool?),
          initiatives: $checkedConvert(
              'initiatives',
              (v) => (v as List<dynamic>?)
                  ?.map(
                      (e) => InitiativeDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          adminFlag: $checkedConvert('adminFlag', (v) => v as bool?),
          profileImageUrl:
              $checkedConvert('profileImageUrl', (v) => v as String?),
          email: $checkedConvert('email', (v) => v as String?),
          status: $checkedConvert('status', (v) => (v as num?)?.toDouble()),
        );
        return val;
      },
    );
