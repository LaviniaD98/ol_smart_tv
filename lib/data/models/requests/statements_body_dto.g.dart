// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statements_body_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$StatementsDtoToJson(StatementsDto instance) =>
    <String, dynamic>{
      'actor': instance.actor.toJson(),
      'context': instance.context.toJson(),
      if (instance.id case final value?) 'id': value,
      'object': instance.object.toJson(),
      if (instance.result?.toJson() case final value?) 'result': value,
      'verb': instance.verb.toJson(),
      'version': instance.version,
      if (instance.timestamp case final value?) 'timestamp': value,
      if (instance.stored case final value?) 'stored': value,
    };

Map<String, dynamic> _$ActorToJson(Actor instance) => <String, dynamic>{
      'mbox': instance.mbox,
      'name': instance.name,
      'objectType': instance.objectType,
    };

Map<String, dynamic> _$ContextToJson(Context instance) => <String, dynamic>{
      'contextActivities': instance.contextActivities,
      'registration': instance.registration,
    };

Map<String, dynamic> _$StatementsObjectToJson(StatementsObject instance) =>
    <String, dynamic>{
      if (instance.definition?.toJson() case final value?) 'definition': value,
      'id': instance.id,
      'objectType': instance.objectType,
    };

Map<String, dynamic> _$DefinitionToJson(Definition instance) =>
    <String, dynamic>{
      'description': instance.description,
      'name': instance.name,
    };

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      if (instance.completion case final value?) 'completion': value,
      if (instance.duration case final value?) 'duration': value,
      if (instance.score?.toJson() case final value?) 'score': value,
      if (instance.success case final value?) 'success': value,
    };

Map<String, dynamic> _$ScoreToJson(Score instance) => <String, dynamic>{
      'scaled': instance.scaled,
    };

Map<String, dynamic> _$VerbToJson(Verb instance) => <String, dynamic>{
      'display': instance.display,
      'id': instance.id,
    };
