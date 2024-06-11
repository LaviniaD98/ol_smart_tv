// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sessionid_request_body_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$SessionIdRequestBodyDtoToJson(
    SessionIdRequestBodyDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('courseId', instance.courseId);
  writeNotNull('learnerId', instance.learnerId);
  writeNotNull('learnerName', instance.learnerName);
  writeNotNull('tokenJwt', instance.tokenJwt);
  writeNotNull('iframeSrc', instance.iframeSrc);
  writeNotNull('userEmail', instance.userEmail);
  writeNotNull('userName', instance.userName);
  writeNotNull('corporateId', instance.corporateId);
  writeNotNull('initiativeId', instance.initiativeId);
  writeNotNull('pathId', instance.pathId);
  writeNotNull('activityId', instance.activityId);
  writeNotNull('LO_type', instance.LO_type);
  writeNotNull('domain', instance.domain);
  writeNotNull('objectDescription', instance.objectDescription);
  writeNotNull('objectName', instance.objectName);
  writeNotNull('viteSCORMTracker', instance.viteSCORMTracker);
  writeNotNull('viteXAPITracker', instance.viteXAPITracker);
  writeNotNull('linkedInLOId', instance.linkedInLOId);
  writeNotNull('loType', instance.loType);
  writeNotNull('sessionId', instance.sessionId);
  writeNotNull('tentativeId', instance.tentativeId);
  writeNotNull('trackOnClick', instance.trackOnClick);
  writeNotNull('surveyId', instance.surveyId);
  return val;
}
