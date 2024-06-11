import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'linkedin_request_body_dto.g.dart';

@JsonSerializable(
  createFactory: false,
  ignoreUnannotated: true,
  includeIfNull: false,
  explicitToJson: true,
)
class LinkedinRequestBodyDto extends Equatable {
  const LinkedinRequestBodyDto(this.courseId,this.learnerId,this.learnerName,this.sessionId,this.linkedInLOId,this.userEmail,this.userName,this.corporateId,this.initiativeId,
      this.pathId,this.activityId,this.loType,this.domain,this.objectDescription,this.objectName
      );

  Map<String, dynamic> toJson() => _$LinkedinRequestBodyDtoToJson(this);

  @JsonKey()
  final int? courseId;
  @JsonKey()
  final int? learnerId;
  @JsonKey()
  final String? learnerName;
  @JsonKey()
  final String? sessionId;
  @JsonKey()
  final String? linkedInLOId;
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
  final String? loType;
  @JsonKey()
  final String? domain;
  @JsonKey()
  final String? objectDescription;
  @JsonKey()
  final String? objectName;

  factory LinkedinRequestBodyDto.fromPredefinedConfig({
    int? courseId, int? learnerId, String? learnerName,String? tokenJwt,String? iframeSrc,String? userEmail,String? userName,int? corporateId,
    int? initiativeId,int? pathId,int? activityId,String? LO_type,String? domain,String? objectDescription,String? objectName,}) {
    return LinkedinRequestBodyDto(courseId,learnerId,learnerName,tokenJwt,iframeSrc,userEmail,userName,corporateId,initiativeId,pathId,activityId,LO_type,domain,objectDescription,objectName);
  }

  @override
  List<Object?> get props => [
    courseId,
    learnerId,
    learnerName,
    sessionId,
    linkedInLOId,
    userEmail,
    userName,
    corporateId,
    initiativeId,
    pathId,
    activityId,
    loType,
    domain,
    objectDescription,
    objectName
  ];
}