import 'package:json_annotation/json_annotation.dart';

part 'session_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class SessionDto {
  SessionDto(this.sessionId);

  factory SessionDto.fromJson(Map<String, dynamic> json) => _$SessionDtoFromJson(json);

  @JsonKey(name: 'sessionId')
  final String sessionId;
}
