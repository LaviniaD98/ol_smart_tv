// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enrollment_body_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$EnrollmentDtoToJson(EnrollmentDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('approverEId', instance.approverEId);
  writeNotNull('domainId', instance.domainId);
  writeNotNull('enrollDate', instance.enrollDate);
  writeNotNull('enrollType', instance.enrollType);
  writeNotNull('learningObject', instance.learningObject?.toJson());
  writeNotNull('mandatory', instance.mandatory);
  writeNotNull('userId', instance.userId);
  return val;
}
