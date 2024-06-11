import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_token_body_dto.g.dart';

@JsonSerializable(
  createFactory: false,
  ignoreUnannotated: true,
  includeIfNull: false,
  explicitToJson: true,
)
class AuthTokenBodyDto extends Equatable {
  const AuthTokenBodyDto(this.clientId, this.code, this.grantType, this.scope, this.redirectUri);

  Map<String, dynamic> toJson() => _$AuthTokenBodyDtoToJson(this);

  @JsonKey(name: 'client_id')
  final String clientId;

  @JsonKey(name: 'code')
  final String code;

  @JsonKey(name: 'grant_type')
  final String grantType;

  @JsonKey(name: 'scope')
  final String scope;

  @JsonKey(name: 'redirect_uri')
  final String redirectUri;

  factory AuthTokenBodyDto.fromPredefinedConfig({
    required String clientId, required String code, required String grantType, required String scope, required String redirectUri}) {
    return AuthTokenBodyDto(clientId, code, grantType, scope, redirectUri);
  }

  @override
  List<Object?> get props => [
    clientId,
    code,
    grantType,
    redirectUri
  ];
}
