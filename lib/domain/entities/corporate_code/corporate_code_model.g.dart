// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'corporate_code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CorporateCodeModel _$CorporateCodeModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CorporateCodeModel',
      json,
      ($checkedConvert) {
        final val = CorporateCodeModel(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          name: $checkedConvert('name', (v) => v as String?),
          country: $checkedConvert('country', (v) => v as String?),
          province: $checkedConvert('province', (v) => v as String?),
          city: $checkedConvert('city', (v) => v as String?),
          postalCode: $checkedConvert('postal_code', (v) => v as String?),
          address: $checkedConvert('address', (v) => v as String?),
          businessName: $checkedConvert('business_name', (v) => v as String?),
          fiscalCode: $checkedConvert('fiscal_code', (v) => v as String?),
          contactEmails: $checkedConvert('contact_emails',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          termOfPayment:
              $checkedConvert('term_of_payment', (v) => v as String?),
          pec: $checkedConvert('pec', (v) => v as String?),
          sdi: $checkedConvert('sdi', (v) => v as String?),
          loginType: $checkedConvert(
              'login_type', (v) => $enumDecodeNullable(_$LoginTypeEnumMap, v)),
          clientId: $checkedConvert('client_id', (v) => v as String?),
          userpoolId: $checkedConvert('userpool_id', (v) => v as String?),
          corporateDomain:
              $checkedConvert('corporate_domain', (v) => v as String?),
          onboarding: $checkedConvert('onboarding', (v) => v as bool?),
          creationDate: $checkedConvert('creation_date', (v) => v as String?),
          updateDate: $checkedConvert('update_date', (v) => v as String?),
          updatedBy: $checkedConvert('updated_by', (v) => v as String?),
          initiativeList: $checkedConvert('initiative_list',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          status: $checkedConvert('status', (v) => v as String?),
          linkAdminTheme:
              $checkedConvert('link_admin_theme', (v) => v as String?),
          welcomeEmailExtrasystemFlag: $checkedConvert(
              'welcome_email_extrasystem_flag', (v) => v as bool?),
          enableCommunityFlag:
              $checkedConvert('enable_community_flag', (v) => v as bool?),
          ssoRedirectUrl:
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

Map<String, dynamic> _$CorporateCodeModelToJson(CorporateCodeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country': instance.country,
      'province': instance.province,
      'city': instance.city,
      'postal_code': instance.postalCode,
      'address': instance.address,
      'business_name': instance.businessName,
      'fiscal_code': instance.fiscalCode,
      'contact_emails': instance.contactEmails,
      'term_of_payment': instance.termOfPayment,
      'pec': instance.pec,
      'sdi': instance.sdi,
      'login_type': _$LoginTypeEnumMap[instance.loginType],
      'client_id': instance.clientId,
      'userpool_id': instance.userpoolId,
      'corporate_domain': instance.corporateDomain,
      'onboarding': instance.onboarding,
      'creation_date': instance.creationDate,
      'update_date': instance.updateDate,
      'updated_by': instance.updatedBy,
      'initiative_list': instance.initiativeList,
      'status': instance.status,
      'link_admin_theme': instance.linkAdminTheme,
      'welcome_email_extrasystem_flag': instance.welcomeEmailExtrasystemFlag,
      'enable_community_flag': instance.enableCommunityFlag,
      'sso_redirect_url': instance.ssoRedirectUrl,
    };

const _$LoginTypeEnumMap = {
  LoginType.SSO: 'SSO',
  LoginType.SSO_ONLY: 'SSO_ONLY',
  LoginType.USERNAME_PASSWORD: 'USERNAME_PASSWORD',
};
