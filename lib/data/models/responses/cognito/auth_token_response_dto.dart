import 'package:json_annotation/json_annotation.dart';

part 'auth_token_response_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class AuthTokenResponseDto {
  AuthTokenResponseDto(this.idToken, this.accessToken, this.refreshToken, this.expiresIn, this.tokenType);

  factory AuthTokenResponseDto.fromJson(Map<String, dynamic> json) => _$AuthTokenResponseDtoFromJson(json);

  @JsonKey(name: "id_token")
  final String? idToken;
  @JsonKey(name: "access_token")
  final String? accessToken;
  @JsonKey(name: "refresh_token")
  final String? refreshToken;
  @JsonKey(name: "expires_in")
  final int? expiresIn;
  @JsonKey(name: "token_type")
  final String? tokenType;
}
