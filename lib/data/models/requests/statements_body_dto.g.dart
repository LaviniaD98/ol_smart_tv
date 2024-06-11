// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statements_body_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$StatementsDtoToJson(StatementsDto instance) {
  final val = <String, dynamic>{
    'actor': instance.actor.toJson(),
    'context': instance.context.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['object'] = instance.object.toJson();
  writeNotNull('result', instance.result?.toJson());
  val['verb'] = instance.verb.toJson();
  val['version'] = instance.version;
  writeNotNull('timestamp', instance.timestamp);
  writeNotNull('stored', instance.stored);
  return val;
}

Map<String, dynamic> _$ActorToJson(Actor instance) => <String, dynamic>{
      'mbox': instance.mbox,
      'name': instance.name,
      'objectType': instance.objectType,
    };

Map<String, dynamic> _$ContextToJson(Context instance) => <String, dynamic>{
      'contextActivities': instance.contextActivities,
      'registration': instance.registration,
    };

Map<String, dynamic> _$StatementsObjectToJson(StatementsObject instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('definition', instance.definition?.toJson());
  val['id'] = instance.id;
  val['objectType'] = instance.objectType;
  return val;
}

Map<String, dynamic> _$DefinitionToJson(Definition instance) =>
    <String, dynamic>{
      'description': instance.description,
      'name': instance.name,
    };

Map<String, dynamic> _$ResultToJson(Result instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('completion', instance.completion);
  writeNotNull('duration', instance.duration);
  writeNotNull('score', instance.score?.toJson());
  writeNotNull('success', instance.success);
  return val;
}

Map<String, dynamic> _$ScoreToJson(Score instance) => <String, dynamic>{
      'scaled': instance.scaled,
    };

Map<String, dynamic> _$VerbToJson(Verb instance) => <String, dynamic>{
      'display': instance.display,
      'id': instance.id,
    };
