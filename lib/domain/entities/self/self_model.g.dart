// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'self_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelfModel _$SelfModelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'SelfModel',
      json,
      ($checkedConvert) {
        final val = SelfModel(
          name: $checkedConvert('name', (v) => v as String?),
          surname: $checkedConvert('surname', (v) => v as String?),
          externalId: $checkedConvert('external_id', (v) => v as String?),
          email: $checkedConvert('email', (v) => v as String?),
          phoneNumber: $checkedConvert('phone_number', (v) => v as String?),
          address: $checkedConvert('address', (v) => v as String?),
          gender: $checkedConvert('gender', (v) => v as String?),
          fiscalCode: $checkedConvert('fiscal_code', (v) => v as String?),
          countryCode: $checkedConvert('country_code', (v) => v as String?),
          countryDescription:
              $checkedConvert('country_description', (v) => v as String?),
          birthday: $checkedConvert('birthday', (v) => (v as num?)?.toInt()),
          birthCountry: $checkedConvert('birth_country', (v) => v as String?),
          birthProvince: $checkedConvert('birth_province', (v) => v as String?),
          atecoCode: $checkedConvert('ateco_code', (v) => v as String?),
          branch: $checkedConvert('branch', (v) => v as String?),
          externalEmployeeFlag:
              $checkedConvert('external_employee_flag', (v) => v as bool?),
          contractualCrameworkCode: $checkedConvert(
              'contractual_framework_code', (v) => v as String?),
          contractualFrameworkType: $checkedConvert(
              'contractual_framework_type', (v) => v as String?),
          newHireFlag: $checkedConvert('new_hire_flag', (v) => v as bool?),
          hireDate: $checkedConvert('hire_date', (v) => (v as num?)?.toInt()),
          terminationDate:
              $checkedConvert('termination_date', (v) => (v as num?)?.toInt()),
          contractType: $checkedConvert('contract_type', (v) => v as String?),
          scheduleType: $checkedConvert('schedule_type', (v) => v as String?),
          ccnl: $checkedConvert('ccnl', (v) => v as String?),
          language: $checkedConvert('language', (v) => v as String?),
          supervisor: $checkedConvert('supervisor', (v) => v as String?),
          boardFlag: $checkedConvert('board_flag', (v) => v as bool?),
          receievedCredentialsFlag:
              $checkedConvert('receieved_credentials_flag', (v) => v as bool?),
          privacyConsentFlag:
              $checkedConvert('privacy_consent_flag', (v) => v as bool?),
          smartWorkingFlag:
              $checkedConvert('smart_working_flag', (v) => v as bool?),
          roles: $checkedConvert('roles',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          initiatives: $checkedConvert(
              'initiatives',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => IdLabelModel.fromJson(e as Map<String, dynamic>))
                  .toList()),
          internalEmployeeFlag:
              $checkedConvert('internal_employee_flag', (v) => v as bool?),
          persona: $checkedConvert('persona',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          job: $checkedConvert(
              'job',
              (v) => v == null
                  ? null
                  : IdLabelModel.fromJson(v as Map<String, dynamic>)),
          industry: $checkedConvert(
              'industry',
              (v) => v == null
                  ? null
                  : IdLabelModel.fromJson(v as Map<String, dynamic>)),
          profession: $checkedConvert(
              'profession',
              (v) => v == null
                  ? null
                  : IdLabelModel.fromJson(v as Map<String, dynamic>)),
          adminFlag: $checkedConvert('admin_flag', (v) => v as bool?),
          smartLearningHours: $checkedConvert(
              'smart_learning_hours', (v) => (v as num?)?.toInt()),
          onboardingFlag: $checkedConvert('onboarding_flag', (v) => v as bool?),
          uogList: $checkedConvert(
              'uog',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => UogModel.fromJson(e as Map<String, dynamic>))
                  .toList()),
          level1Proficiency: $checkedConvert(
              'level1_proficiency',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => IdLabelModel.fromJson(e as Map<String, dynamic>))
                  .toList()),
          level2Proficiency: $checkedConvert(
              'level2_proficiency',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => IdLabelModel.fromJson(e as Map<String, dynamic>))
                  .toList()),
          level3Proficiency: $checkedConvert(
              'level3_proficiency',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => IdLabelModel.fromJson(e as Map<String, dynamic>))
                  .toList()),
          level4Proficiency: $checkedConvert(
              'level4_proficiency',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => IdLabelModel.fromJson(e as Map<String, dynamic>))
                  .toList()),
          level5Proficiency: $checkedConvert(
              'level5_proficiency',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => IdLabelModel.fromJson(e as Map<String, dynamic>))
                  .toList()),
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

Map<String, dynamic> _$SelfModelToJson(SelfModel instance) => <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'external_id': instance.externalId,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'address': instance.address,
      'gender': instance.gender,
      'fiscal_code': instance.fiscalCode,
      'country_code': instance.countryCode,
      'country_description': instance.countryDescription,
      'birthday': instance.birthday,
      'birth_country': instance.birthCountry,
      'birth_province': instance.birthProvince,
      'ateco_code': instance.atecoCode,
      'branch': instance.branch,
      'external_employee_flag': instance.externalEmployeeFlag,
      'contractual_framework_code': instance.contractualCrameworkCode,
      'contractual_framework_type': instance.contractualFrameworkType,
      'new_hire_flag': instance.newHireFlag,
      'hire_date': instance.hireDate,
      'termination_date': instance.terminationDate,
      'contract_type': instance.contractType,
      'schedule_type': instance.scheduleType,
      'ccnl': instance.ccnl,
      'language': instance.language,
      'supervisor': instance.supervisor,
      'board_flag': instance.boardFlag,
      'receieved_credentials_flag': instance.receievedCredentialsFlag,
      'privacy_consent_flag': instance.privacyConsentFlag,
      'smart_working_flag': instance.smartWorkingFlag,
      'roles': instance.roles,
      'initiatives': instance.initiatives,
      'internal_employee_flag': instance.internalEmployeeFlag,
      'persona': instance.persona,
      'job': instance.job,
      'industry': instance.industry,
      'profession': instance.profession,
      'admin_flag': instance.adminFlag,
      'smart_learning_hours': instance.smartLearningHours,
      'onboarding_flag': instance.onboardingFlag,
      'uog': instance.uogList,
      'level1_proficiency': instance.level1Proficiency,
      'level2_proficiency': instance.level2Proficiency,
      'level3_proficiency': instance.level3Proficiency,
      'level4_proficiency': instance.level4Proficiency,
      'level5_proficiency': instance.level5Proficiency,
    };
