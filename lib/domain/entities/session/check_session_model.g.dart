// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckSessionModel _$CheckSessionModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CheckSessionModel',
      json,
      ($checkedConvert) {
        final val = CheckSessionModel(
          sessionId: $checkedConvert('sessionId', (v) => v as String?),
          initiativeId: $checkedConvert('initiativeId', (v) => v as String?),
          user: $checkedConvert(
              'user',
              (v) => v == null
                  ? null
                  : UserModel.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$CheckSessionModelToJson(CheckSessionModel instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'initiativeId': instance.initiativeId,
      'user': instance.user,
    };
