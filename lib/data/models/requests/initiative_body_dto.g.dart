// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initiative_body_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$InitiativeBodyDtoToJson(InitiativeBodyDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('sessionId', instance.sessionId);
  val['initiativeId'] = instance.initiativeId;
  return val;
}
