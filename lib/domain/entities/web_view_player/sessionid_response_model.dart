import 'package:open_learning_smart_tv/data/models/responses/web_view_player/sessionid_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sessionid_response_model.g.dart';

@JsonSerializable(createToJson: true, checked: true)
class SessionIdResponseModel {
  SessionIdResponseModel(
    this.sessionId,
    this.accessToken,
  );

  Map<String, dynamic> toJson() => _$SessionIdResponseModelToJson(this);
  factory SessionIdResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SessionIdResponseModelFromJson(json);

  factory SessionIdResponseModel.fromResponse(SessionIdResponseDto dto) {
    return SessionIdResponseModel(dto.sessionId, dto.tokenJwt);
  }

  @JsonKey()
  final String? sessionId;
  @JsonKey()
  final String? accessToken;
}
