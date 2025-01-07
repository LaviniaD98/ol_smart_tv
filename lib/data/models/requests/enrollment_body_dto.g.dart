// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enrollment_body_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$EnrollmentDtoToJson(EnrollmentDto instance) =>
    <String, dynamic>{
      if (instance.approverEId case final value?) 'approverEId': value,
      if (instance.domainId case final value?) 'domainId': value,
      if (instance.enrollDate case final value?) 'enrollDate': value,
      if (instance.enrollType case final value?) 'enrollType': value,
      if (instance.learningObject?.toJson() case final value?)
        'learningObject': value,
      if (instance.mandatory case final value?) 'mandatory': value,
      if (instance.userId case final value?) 'userId': value,
    };
