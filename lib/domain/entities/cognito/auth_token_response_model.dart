import 'package:open_learning_smart_tv/data/models/responses/cognito/auth_token_response_dto.dart';
import 'package:equatable/equatable.dart';

class AuthTokenResponseModel extends Equatable {
  final String? idToken;
  final String? accessToken;
  final String? refreshToken;
  final int? expiresIn;
  final String? tokenType;

  const AuthTokenResponseModel({
    this.idToken,
    this.accessToken,
    this.refreshToken,
    this.expiresIn,
    this.tokenType,
  });

  factory AuthTokenResponseModel.fromResponse(AuthTokenResponseDto response) {
    return AuthTokenResponseModel(
      idToken: response.idToken,
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
      expiresIn: response.expiresIn,
      tokenType: response.tokenType,
    );
  }

  @override
  List<Object?> get props => [
        idToken,
        accessToken,
        refreshToken,
        expiresIn,
        tokenType,
      ];
}
