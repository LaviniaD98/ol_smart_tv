// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_object_body_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$LearningObjectBodyDtoToJson(
    LearningObjectBodyDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('corporateId', instance.corporateId);
  writeNotNull('objectId', instance.objectId);
  return val;
}
