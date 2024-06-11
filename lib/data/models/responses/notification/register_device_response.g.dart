// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_device_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterDeviceResponse _$RegisterDeviceResponseFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'RegisterDeviceResponse',
      json,
      ($checkedConvert) {
        final val = RegisterDeviceResponse(
          $checkedConvert('address', (v) => v as String?),
          $checkedConvert('channelType', (v) => v as String?),
          $checkedConvert('creationDate', (v) => v as String?),
          $checkedConvert('effectiveDate', (v) => v as String?),
          $checkedConvert('endPoint', (v) => v as String?),
          $checkedConvert('errorManagement', (v) => v as String?),
          $checkedConvert('errorResponse', (v) => v as String?),
          $checkedConvert('requestId', (v) => v as String?),
          $checkedConvert('resultCode', (v) => v as String?),
          $checkedConvert('statusDeviceToken', (v) => v as String?),
          $checkedConvert('success', (v) => v as bool?),
        );
        return val;
      },
    );
