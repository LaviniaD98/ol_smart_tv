import 'package:json_annotation/json_annotation.dart';

part 'auth_token_qr_response_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class AuthTokenQrResponseDto {
  AuthTokenQrResponseDto(this.idToken, this.accessToken, this.refreshToken,
      this.expiresIn, this.tokenType);

  factory AuthTokenQrResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenQrResponseDtoFromJson(json);

  final String? idToken;
  final String? accessToken;
  final String? refreshToken;
  final int? expiresIn;
  final String? tokenType;
}
