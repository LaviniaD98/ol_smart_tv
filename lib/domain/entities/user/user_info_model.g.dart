// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'UserInfoModel',
      json,
      ($checkedConvert) {
        final val = UserInfoModel(
          $checkedConvert('sessionId', (v) => v as String?),
          $checkedConvert('initiativeId', (v) => (v as num?)?.toInt()),
          $checkedConvert(
              'userModel',
              (v) => v == null
                  ? null
                  : UserModel.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {'user': 'userModel'},
    );

Map<String, dynamic> _$UserInfoModelToJson(UserInfoModel instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'initiativeId': instance.initiativeId,
      'userModel': instance.user,
    };
