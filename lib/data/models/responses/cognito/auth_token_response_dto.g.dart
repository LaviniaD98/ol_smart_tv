// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_token_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthTokenResponseDto _$AuthTokenResponseDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'AuthTokenResponseDto',
      json,
      ($checkedConvert) {
        final val = AuthTokenResponseDto(
          $checkedConvert('id_token', (v) => v as String?),
          $checkedConvert('access_token', (v) => v as String?),
          $checkedConvert('refresh_token', (v) => v as String?),
          $checkedConvert('expires_in', (v) => (v as num?)?.toInt()),
          $checkedConvert('token_type', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'idToken': 'id_token',
        'accessToken': 'access_token',
        'refreshToken': 'refresh_token',
        'expiresIn': 'expires_in',
        'tokenType': 'token_type'
      },
    );
