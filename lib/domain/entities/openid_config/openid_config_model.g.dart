// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openid_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenidConfigModel _$OpenidConfigModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'OpenidConfigModel',
      json,
      ($checkedConvert) {
        final val = OpenidConfigModel(
          authorizationEndpoint:
              $checkedConvert('authorization_endpoint', (v) => v as String?),
          idTokenSigningAlgValuesSupported: $checkedConvert(
              'id_token_signing_alg_values_supported',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          issuer: $checkedConvert('issuer', (v) => v as String?),
          jwksUri: $checkedConvert('jwks_uri', (v) => v as String?),
          responseTypesSupported: $checkedConvert('response_types_supported',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          scopesSupported: $checkedConvert('scopes_supported',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          subjectTypesSupported: $checkedConvert('subject_types_supported',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          tokenEndpoint: $checkedConvert('token_endpoint', (v) => v as String?),
          tokenEndpointAuthMethodsSupported: $checkedConvert(
              'token_endpoint_auth_methods_supported',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          userinfoEndpoint:
              $checkedConvert('userinfo_endpoint', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'authorizationEndpoint': 'authorization_endpoint',
        'idTokenSigningAlgValuesSupported':
            'id_token_signing_alg_values_supported',
        'jwksUri': 'jwks_uri',
        'responseTypesSupported': 'response_types_supported',
        'scopesSupported': 'scopes_supported',
        'subjectTypesSupported': 'subject_types_supported',
        'tokenEndpoint': 'token_endpoint',
        'tokenEndpointAuthMethodsSupported':
            'token_endpoint_auth_methods_supported',
        'userinfoEndpoint': 'userinfo_endpoint'
      },
    );

Map<String, dynamic> _$OpenidConfigModelToJson(OpenidConfigModel instance) =>
    <String, dynamic>{
      'authorization_endpoint': instance.authorizationEndpoint,
      'id_token_signing_alg_values_supported':
          instance.idTokenSigningAlgValuesSupported,
      'issuer': instance.issuer,
      'jwks_uri': instance.jwksUri,
      'response_types_supported': instance.responseTypesSupported,
      'scopes_supported': instance.scopesSupported,
      'subject_types_supported': instance.subjectTypesSupported,
      'token_endpoint': instance.tokenEndpoint,
      'token_endpoint_auth_methods_supported':
          instance.tokenEndpointAuthMethodsSupported,
      'userinfo_endpoint': instance.userinfoEndpoint,
    };
