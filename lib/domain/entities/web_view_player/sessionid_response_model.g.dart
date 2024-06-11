// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sessionid_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionIdResponseModel _$SessionIdResponseModelFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SessionIdResponseModel',
      json,
      ($checkedConvert) {
        final val = SessionIdResponseModel(
          $checkedConvert('sessionId', (v) => v as String?),
          $checkedConvert('accessToken', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$SessionIdResponseModelToJson(
        SessionIdResponseModel instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'accessToken': instance.accessToken,
    };
