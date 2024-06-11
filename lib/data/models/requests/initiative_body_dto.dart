import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'initiative_body_dto.g.dart';

@JsonSerializable(
  createFactory: false,
  ignoreUnannotated: true,
  includeIfNull: false,
  explicitToJson: true,
)
class InitiativeBodyDto extends Equatable {
  const InitiativeBodyDto(this.sessionId, this.initiativeId);

  Map<String, dynamic> toJson() => _$InitiativeBodyDtoToJson(this);

  @JsonKey(name: 'sessionId')
  final String? sessionId;

  @JsonKey(name: 'initiativeId')
  final int initiativeId;

  factory InitiativeBodyDto.fromPredefinedConfig({
    String? sessionId, required int initiativeId}) {
    return InitiativeBodyDto(sessionId, initiativeId);
  }

  @override
  List<Object?> get props => [
    sessionId,
    initiativeId,
  ];
}
