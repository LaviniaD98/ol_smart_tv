import 'package:json_annotation/json_annotation.dart';
import 'package:open_learning_smart_tv/data/models/responses/session/user_dto.dart';

part 'check_session_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class CheckSessionDto {
  CheckSessionDto(this.sessionId, this.initiativeId, this.user);

  factory CheckSessionDto.fromJson(Map<String, dynamic> json) =>
      _$CheckSessionDtoFromJson(json);

  @JsonKey(name: "sessionId")
  final String? sessionId;
  @JsonKey(name: "initiativeId")
  final String? initiativeId;
  @JsonKey(name: "user")
  final UserDto? user;
}
