import 'package:freezed_annotation/freezed_annotation.dart';

part 'statements_body_dto.g.dart';

@JsonSerializable(
  createFactory: false,
  ignoreUnannotated: true,
  includeIfNull: false,
  explicitToJson: true,
)
class StatementsDto {

  @JsonKey()
  final Actor actor;
  @JsonKey()
  final Context context;
  @JsonKey()
  final String? id;
  @JsonKey()
  final StatementsObject object;
  @JsonKey()
  final Result? result;
  @JsonKey()
  final Verb verb;
  @JsonKey()
  final String version;
  @JsonKey()
  final String? timestamp;
  @JsonKey()
  final String? stored;

  StatementsDto({
    required this.actor,
    required this.context,
    this.id,
    required this.object,
    this.result,
    required this.verb,
    required this.version,
    this.timestamp,
    this.stored,
  });

  Map<String, dynamic> toJson() => _$StatementsDtoToJson(this);

  factory StatementsDto.fromJson(Map<String, dynamic> json) {
    return StatementsDto(
      actor: Actor.fromJson(json['actor']),
      context: Context.fromJson(json['context']),
      id: json['id'],
      object: StatementsObject.fromJson(json['object']),
      result: Result.fromJson(json['result']),
      verb: Verb.fromJson(json['verb']),
      version: json['version'],
    );
  }
}

@JsonSerializable(
  createFactory: false,
  ignoreUnannotated: true,
  includeIfNull: false,
  explicitToJson: true,
)
class Actor {
  @JsonKey()
  final String mbox;
  @JsonKey()
  final String name;
  @JsonKey()
  final String objectType;

  Actor({required this.mbox, required this.name, required this.objectType});

  Map<String, dynamic> toJson() => _$ActorToJson(this);

  factory Actor.fromJson(Map<String, dynamic> json) {
    return Actor(
      mbox: json['mbox'],
      name: json['name'],
      objectType: json['objectType'],
    );
  }
}

@JsonSerializable(
  createFactory: false,
  ignoreUnannotated: true,
  includeIfNull: false,
  explicitToJson: true,
)
class Context {
  @JsonKey()
  final Map<String, dynamic> contextActivities;
  @JsonKey()
  final String registration;

  Context({required this.contextActivities, required this.registration});

  Map<String, dynamic> toJson() => _$ContextToJson(this);

  factory Context.fromJson(Map<String, dynamic> json) {
    return Context(
      contextActivities: json['contextActivities'],
      registration: json['registration'],
    );
  }
}

@JsonSerializable(
  createFactory: false,
  ignoreUnannotated: true,
  includeIfNull: false,
  explicitToJson: true,
)
class StatementsObject {
  @JsonKey()
  final Definition? definition;
  @JsonKey()
  final String id;
  @JsonKey()
  final String objectType;

  StatementsObject({this.definition, required this.id, required this.objectType});

  Map<String, dynamic> toJson() => _$StatementsObjectToJson(this);

  factory StatementsObject.fromJson(Map<String, dynamic> json) {
    return StatementsObject(
      definition: Definition.fromJson(json['definition']),
      id: json['id'],
      objectType: json['objectType'],
    );
  }
}

@JsonSerializable(
  createFactory: false,
  ignoreUnannotated: true,
  includeIfNull: false,
  explicitToJson: true,
)
class Definition {
  @JsonKey()
  final Map<String, String> description;
  @JsonKey()
  final Map<String, String> name;

  Definition({required this.description, required this.name});

  Map<String, dynamic> toJson() => _$DefinitionToJson(this);

  factory Definition.fromJson(Map<String, dynamic> json) {
    return Definition(
      description: Map<String, String>.from(json['description']),
      name: Map<String, String>.from(json['name']),
    );
  }
}

@JsonSerializable(
  createFactory: false,
  ignoreUnannotated: true,
  includeIfNull: false,
  explicitToJson: true,
)
class Result {
  @JsonKey()
  final bool? completion;
  @JsonKey()
  final String? duration;
  @JsonKey()
  final Score? score;
  @JsonKey()
  final bool? success;

  Result({this.completion, this.duration, this.score, this.success});

  Map<String, dynamic> toJson() => _$ResultToJson(this);

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      completion: json['completion'],
      duration: json['duration'],
      score: Score.fromJson(json['score']),
      success: json['success'],
    );
  }
}

@JsonSerializable(
  createFactory: false,
  ignoreUnannotated: true,
  includeIfNull: false,
  explicitToJson: true,
)
class Score {
  @JsonKey()
  final double scaled;

  Score({required this.scaled});

  Map<String, dynamic> toJson() => _$ScoreToJson(this);

  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(
      scaled: json['scaled'].toDouble(),
    );
  }
}

@JsonSerializable(
  createFactory: false,
  ignoreUnannotated: true,
  includeIfNull: false,
  explicitToJson: true,
)
class Verb {
  @JsonKey()
  final Map<String, String> display;
  @JsonKey()
  final String id;

  Verb({required this.display, required this.id});

  Map<String, dynamic> toJson() => _$VerbToJson(this);

  factory Verb.fromJson(Map<String, dynamic> json) {
    return Verb(
      display: Map<String, String>.from(json['display']),
      id: json['id'],
    );
  }
}
