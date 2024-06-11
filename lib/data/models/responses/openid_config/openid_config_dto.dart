import 'package:freezed_annotation/freezed_annotation.dart';

part 'openid_config_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class OpenidConfigDto {

  OpenidConfigDto({
    this.authorizationEndpoint,
    this.idTokenSigningAlgValuesSupported,
    this.issuer,
    this.jwksUri,
    this.responseTypesSupported,
    this.scopesSupported,
    this.subjectTypesSupported,
    this.tokenEndpoint,
    this.tokenEndpointAuthMethodsSupported,
    this.userinfoEndpoint,
  });

  factory OpenidConfigDto.fromJson(Map<String, dynamic> json) => _$OpenidConfigDtoFromJson(json);

  @JsonKey(name: "authorization_endpoint")
  final String? authorizationEndpoint;
  @JsonKey(name: "id_token_signing_alg_values_supported")
  final List<String>? idTokenSigningAlgValuesSupported;
  @JsonKey(name: "issuer")
  final String? issuer;
  @JsonKey(name: "jwks_uri")
  final String? jwksUri;
  @JsonKey(name: "response_types_supported")
  final List<String>? responseTypesSupported;
  @JsonKey(name: "scopes_supported")
  final List<String>? scopesSupported;
  @JsonKey(name: "subject_types_supported")
  final List<String>? subjectTypesSupported;
  @JsonKey(name: "token_endpoint")
  final String? tokenEndpoint;
  @JsonKey(name: "token_endpoint_auth_methods_supported")
  final List<String>? tokenEndpointAuthMethodsSupported;
  @JsonKey(name: "userinfo_endpoint")
  final String? userinfoEndpoint;
}
