// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'linkedin_request_body_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$LinkedinRequestBodyDtoToJson(
    LinkedinRequestBodyDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('courseId', instance.courseId);
  writeNotNull('learnerId', instance.learnerId);
  writeNotNull('learnerName', instance.learnerName);
  writeNotNull('sessionId', instance.sessionId);
  writeNotNull('linkedInLOId', instance.linkedInLOId);
  writeNotNull('userEmail', instance.userEmail);
  writeNotNull('userName', instance.userName);
  writeNotNull('corporateId', instance.corporateId);
  writeNotNull('initiativeId', instance.initiativeId);
  writeNotNull('pathId', instance.pathId);
  writeNotNull('activityId', instance.activityId);
  writeNotNull('loType', instance.loType);
  writeNotNull('domain', instance.domain);
  writeNotNull('objectDescription', instance.objectDescription);
  writeNotNull('objectName', instance.objectName);
  return val;
}
