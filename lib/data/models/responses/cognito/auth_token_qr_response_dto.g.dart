// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_token_qr_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthTokenQrResponseDto _$AuthTokenQrResponseDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'AuthTokenQrResponseDto',
      json,
      ($checkedConvert) {
        final val = AuthTokenQrResponseDto(
          $checkedConvert('idToken', (v) => v as String?),
          $checkedConvert('accessToken', (v) => v as String?),
          $checkedConvert('refreshToken', (v) => v as String?),
          $checkedConvert('expiresIn', (v) => (v as num?)?.toInt()),
          $checkedConvert('tokenType', (v) => v as String?),
        );
        return val;
      },
    );
