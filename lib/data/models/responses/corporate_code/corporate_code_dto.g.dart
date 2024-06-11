// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'corporate_code_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CorporateCodeDto _$CorporateCodeDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CorporateCodeDto',
      json,
      ($checkedConvert) {
        final val = CorporateCodeDto(
          $checkedConvert('id', (v) => v as int?),
          $checkedConvert('name', (v) => v as String?),
          $checkedConvert('country', (v) => v as String?),
          $checkedConvert('province', (v) => v as String?),
          $checkedConvert('city', (v) => v as String?),
          $checkedConvert('postal_code', (v) => v as String?),
          $checkedConvert('address', (v) => v as String?),
          $checkedConvert('business_name', (v) => v as String?),
          $checkedConvert('fiscal_code', (v) => v as String?),
          $checkedConvert('contact_emails',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          $checkedConvert('term_of_payment', (v) => v as String?),
          $checkedConvert('pec', (v) => v as String?),
          $checkedConvert('sdi', (v) => v as String?),
          $checkedConvert(
              'login_type', (v) => $enumDecodeNullable(_$LoginTypeEnumMap, v)),
          $checkedConvert('client_id', (v) => v as String?),
          $checkedConvert('userpool_id', (v) => v as String?),
          $checkedConvert('corporate_domain', (v) => v as String?),
          $checkedConvert('onboarding', (v) => v as bool?),
          $checkedConvert('creation_date', (v) => v as String?),
          $checkedConvert('update_date', (v) => v as String?),
          $checkedConvert('updated_by', (v) => v as String?),
          $checkedConvert('initiative_list',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          $checkedConvert('status', (v) => v as String?),
          $checkedConvert('link_admin_theme', (v) => v as String?),
          $checkedConvert('welcome_email_extrasystem_flag', (v) => v as bool?),
          $checkedConvert('enable_community_flag', (v) => v as bool?),
          $checkedConvert('ssoLoginUrl', (v) => v as String?),
          $checkedConvert('sso_redirect_url', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'postalCode': 'postal_code',
        'businessName': 'business_name',
        'fiscalCode': 'fiscal_code',
        'contactEmails': 'contact_emails',
        'termOfPayment': 'term_of_payment',
        'loginType': 'login_type',
        'clientId': 'client_id',
        'userpoolId': 'userpool_id',
        'corporateDomain': 'corporate_domain',
        'creationDate': 'creation_date',
        'updateDate': 'update_date',
        'updatedBy': 'updated_by',
        'initiativeList': 'initiative_list',
        'linkAdminTheme': 'link_admin_theme',
        'welcomeEmailExtrasystemFlag': 'welcome_email_extrasystem_flag',
        'enableCommunityFlag': 'enable_community_flag',
        'ssoRedirectUrl': 'sso_redirect_url'
      },
    );

const _$LoginTypeEnumMap = {
  LoginType.SSO: 'SSO',
  LoginType.SSO_ONLY: 'SSO_ONLY',
  LoginType.USERNAME_PASSWORD: 'USERNAME_PASSWORD',
};
