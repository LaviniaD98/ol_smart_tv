import 'package:open_learning_smart_tv/data/models/responses/openid_config/openid_config_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'openid_config_model.g.dart';

@JsonSerializable(createToJson: true, checked: true)
class OpenidConfigModel {
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

  const OpenidConfigModel({
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

  Map<String, dynamic> toJson() => _$OpenidConfigModelToJson(this);
  factory OpenidConfigModel.fromJson(Map<String, dynamic> json) =>
      _$OpenidConfigModelFromJson(json);
  factory OpenidConfigModel.fromResponse(OpenidConfigDto? response) {
    return OpenidConfigModel(
      authorizationEndpoint: response?.authorizationEndpoint,
      idTokenSigningAlgValuesSupported:
          response?.idTokenSigningAlgValuesSupported,
      issuer: response?.issuer,
      jwksUri: response?.jwksUri,
      responseTypesSupported: response?.responseTypesSupported,
      scopesSupported: response?.scopesSupported,
      subjectTypesSupported: response?.subjectTypesSupported,
      tokenEndpoint: response?.tokenEndpoint,
      tokenEndpointAuthMethodsSupported:
          response?.tokenEndpointAuthMethodsSupported,
      userinfoEndpoint: response?.userinfoEndpoint,
    );
  }
}
