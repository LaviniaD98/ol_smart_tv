// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'self_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelfDto _$SelfDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'SelfDto',
      json,
      ($checkedConvert) {
        final val = SelfDto(
          $checkedConvert('name', (v) => v as String?),
          $checkedConvert('surname', (v) => v as String?),
          $checkedConvert('external_id', (v) => v as String?),
          $checkedConvert('email', (v) => v as String?),
          $checkedConvert('phone_number', (v) => v as String?),
          $checkedConvert('address', (v) => v as String?),
          $checkedConvert('gender', (v) => v as String?),
          $checkedConvert('fiscal_code', (v) => v as String?),
          $checkedConvert('country_code', (v) => v as String?),
          $checkedConvert('country_description', (v) => v as String?),
          $checkedConvert('birthday', (v) => v as int?),
          $checkedConvert('birth_country', (v) => v as String?),
          $checkedConvert('birth_province', (v) => v as String?),
          $checkedConvert('ateco_code', (v) => v as String?),
          $checkedConvert('branch', (v) => v as String?),
          $checkedConvert('external_employee_flag', (v) => v as bool?),
          $checkedConvert('contractual_framework_code', (v) => v as String?),
          $checkedConvert('contractual_framework_type', (v) => v as String?),
          $checkedConvert('new_hire_flag', (v) => v as bool?),
          $checkedConvert('hire_date', (v) => v as int?),
          $checkedConvert('termination_date', (v) => v as int?),
          $checkedConvert('contract_type', (v) => v as String?),
          $checkedConvert('schedule_type', (v) => v as String?),
          $checkedConvert('ccnl', (v) => v as String?),
          $checkedConvert('language', (v) => v as String?),
          $checkedConvert('supervisor', (v) => v as String?),
          $checkedConvert('board_flag', (v) => v as bool?),
          $checkedConvert('receieved_credentials_flag', (v) => v as bool?),
          $checkedConvert('privacy_consent_flag', (v) => v as bool?),
          $checkedConvert('smart_working_flag', (v) => v as bool?),
          $checkedConvert('roles',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          $checkedConvert(
              'initiatives',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => IdLabelDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          $checkedConvert('internal_employee_flag', (v) => v as bool?),
          $checkedConvert('persona',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          $checkedConvert(
              'job',
              (v) => v == null
                  ? null
                  : IdLabelDto.fromJson(v as Map<String, dynamic>)),
          $checkedConvert(
              'industry',
              (v) => v == null
                  ? null
                  : IdLabelDto.fromJson(v as Map<String, dynamic>)),
          $checkedConvert(
              'profession',
              (v) => v == null
                  ? null
                  : IdLabelDto.fromJson(v as Map<String, dynamic>)),
          $checkedConvert('admin_flag', (v) => v as bool?),
          $checkedConvert('smart_learning_hours', (v) => v as int?),
          $checkedConvert('onboarding_flag', (v) => v as bool?),
          $checkedConvert(
              'uog',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => UogDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          $checkedConvert(
              'level1_proficiency',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => IdLabelDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          $checkedConvert(
              'level2_proficiency',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => IdLabelDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          $checkedConvert(
              'level3_proficiency',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => IdLabelDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          $checkedConvert(
              'level4_proficiency',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => IdLabelDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          $checkedConvert(
              'level5_proficiency',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => IdLabelDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          $checkedConvert('c1value', (v) => v as String?),
          $checkedConvert('c2value', (v) => v as String?),
          $checkedConvert('c3value', (v) => v as String?),
          $checkedConvert('c4value', (v) => v as String?),
          $checkedConvert('c5value', (v) => v as String?),
          $checkedConvert('c6value', (v) => v as String?),
          $checkedConvert('c7value', (v) => v as String?),
          $checkedConvert('c8value', (v) => v as String?),
          $checkedConvert('c9value', (v) => v as String?),
          $checkedConvert('c10value', (v) => v as String?),
          $checkedConvert('c11value', (v) => v as String?),
          $checkedConvert('c12value', (v) => v as String?),
          $checkedConvert('c13value', (v) => v as String?),
          $checkedConvert('c14value', (v) => v as String?),
          $checkedConvert('c15value', (v) => v as String?),
          $checkedConvert('c16value', (v) => v as String?),
          $checkedConvert('c17value', (v) => v as String?),
          $checkedConvert('c18value', (v) => v as String?),
          $checkedConvert('c19value', (v) => v as String?),
          $checkedConvert('c20value', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'externalId': 'external_id',
        'phoneNumber': 'phone_number',
        'fiscalCode': 'fiscal_code',
        'countryCode': 'country_code',
        'countryDescription': 'country_description',
        'birthCountry': 'birth_country',
        'birthProvince': 'birth_province',
        'atecoCode': 'ateco_code',
        'externalEmployeeFlag': 'external_employee_flag',
        'contractualCrameworkCode': 'contractual_framework_code',
        'contractualFrameworkType': 'contractual_framework_type',
        'newHireFlag': 'new_hire_flag',
        'hireDate': 'hire_date',
        'terminationDate': 'termination_date',
        'contractType': 'contract_type',
        'scheduleType': 'schedule_type',
        'boardFlag': 'board_flag',
        'receievedCredentialsFlag': 'receieved_credentials_flag',
        'privacyConsentFlag': 'privacy_consent_flag',
        'smartWorkingFlag': 'smart_working_flag',
        'internalEmployeeFlag': 'internal_employee_flag',
        'adminFlag': 'admin_flag',
        'smartLearningHours': 'smart_learning_hours',
        'onboardingFlag': 'onboarding_flag',
        'uogList': 'uog',
        'level1Proficiency': 'level1_proficiency',
        'level2Proficiency': 'level2_proficiency',
        'level3Proficiency': 'level3_proficiency',
        'level4Proficiency': 'level4_proficiency',
        'level5Proficiency': 'level5_proficiency'
      },
    );
