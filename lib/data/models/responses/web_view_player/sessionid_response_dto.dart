
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sessionid_response_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class SessionIdResponseDto {

  SessionIdResponseDto(
        this.courseId,
        this.learnerId,
        this.learnerName,
        this.tokenJwt,
        this.sessionId,
        this.iframeSrc,
        this.userEmail,
        this.userName,
        this.corporateId,
        this.initiativeId,
        this.pathId,
        this.activityId,
        this.LO_type,
        this.domain,
        this.objectDescription,
        this.objectName,
        this.webURL
      );

  factory SessionIdResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SessionIdResponseDtoFromJson(json);

  @JsonKey()
  final int? courseId;
  @JsonKey()
  final int? learnerId;
  @JsonKey()
  final String? learnerName;
  @JsonKey()
  final String? tokenJwt;
  @JsonKey()
  final String? sessionId;
  @JsonKey()
  final String? iframeSrc;
  @JsonKey()
  final String? userEmail;
  @JsonKey()
  final String? userName;
  @JsonKey()
  final int? corporateId;
  @JsonKey()
  final int? initiativeId;
  @JsonKey()
  final int? pathId;
  @JsonKey()
  final int? activityId;
  @JsonKey()
  final String? LO_type;
  @JsonKey()
  final String? domain;
  @JsonKey()
  final String? objectDescription;
  @JsonKey()
  final String? objectName;
  @JsonKey()
  final String? webURL;

}