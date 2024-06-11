import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sessionid_request_body_dto.g.dart';

@JsonSerializable(
  createFactory: false,
  ignoreUnannotated: true,
  includeIfNull: false,
  explicitToJson: true,
)
class SessionIdRequestBodyDto extends Equatable {
  const SessionIdRequestBodyDto({
      this.courseId,
      this.learnerId,
      this.learnerName,
      this.tokenJwt,
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
      this.viteSCORMTracker,
      this.viteXAPITracker,
      this.linkedInLOId,
      this.loType,
      this.sessionId,
      this.tentativeId,
      this.trackOnClick,
      this.surveyId,
  });

  Map<String, dynamic> toJson() => _$SessionIdRequestBodyDtoToJson(this);

  @JsonKey()
  final int? courseId;
  @JsonKey()
  final int? learnerId;
  @JsonKey()
  final String? learnerName;
  @JsonKey()
  final String? tokenJwt;
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
  final String? viteSCORMTracker;
  @JsonKey()
  final String? viteXAPITracker;
  @JsonKey()
  final String? linkedInLOId;
  @JsonKey()
  final String? loType;
  @JsonKey()
  final String? sessionId;
  @JsonKey()
  final int? tentativeId;
  @JsonKey()
  final bool? trackOnClick;
  @JsonKey()
  final int? surveyId;

  @override
  List<Object?> get props => [
    courseId,
    learnerId,
    learnerName,
    tokenJwt,
    iframeSrc,
    userEmail,
    userName,
    corporateId,
    initiativeId,
    pathId,
    activityId,
    LO_type,
    domain,
    objectDescription,
    objectName,
    viteSCORMTracker,
    viteXAPITracker,
    linkedInLOId,
    loType,
    tentativeId
  ];
}