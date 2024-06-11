import 'package:open_learning_smart_tv/data/models/responses/generic/badge_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/generic/certificate_dto.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class CourseDto {
  CourseDto(
      this.id,
      this.title,
      this.isMandatory,
      this.status,
      this.coverId,
      this.coverPrivateURL,
      this.coverPublicURL,
      this.coverVideoId,
      this.coverVideoPrivateURL,
      this.coverVideoPublicURL,
      this.prereqOrderNumber,
      this.learningObjectType,
      this.learningObjectTypology,
      this.shortDescription,
      this.duration,
      this.percentageOfCompletion,
      this.learningActivityNumber,
      this.toolNumber,
      this.badgeId,
      this.certificateId,
      this.badge,
      this.certificate,
      this.topicTags,
      this.prereqType,
      this.isEnable,
      this.enrollType,
      this.expirationDate);

  factory CourseDto.fromJson(Map<String, dynamic> json) =>
      _$CourseDtoFromJson(json);

  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "isMandatory")
  final bool? isMandatory;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "coverId")
  final int? coverId;
  @JsonKey(name: "coverPrivateURL")
  final String? coverPrivateURL;
  @JsonKey(name: "coverPublicURL")
  final String? coverPublicURL;
  @JsonKey(name: "coverVideoId")
  final int? coverVideoId;
  @JsonKey(name: "coverVideoPrivateURL")
  final String? coverVideoPrivateURL;
  @JsonKey(name: "coverVideoPublicURL")
  final String? coverVideoPublicURL;
  @JsonKey(name: "prereqOrderNumber")
  final int? prereqOrderNumber;

  /*@JsonKey(name: "learningObjectType")
  final String? learningObjectType;
  @JsonKey(name: "learningObjectTypology")
  final String? learningObjectTypology;*/

  @JsonKey(unknownEnumValue: LearningObjectType.unknown)
  final LearningObjectType learningObjectType;
  @JsonKey(unknownEnumValue: LearningObjectTypology.unknown)
  final LearningObjectTypology learningObjectTypology;

  @JsonKey(name: "shortDescription")
  final String? shortDescription;
  @JsonKey(name: "duration")
  final int? duration;
  @JsonKey(name: "percentageOfCompletion")
  final String? percentageOfCompletion;
  @JsonKey(name: "learningActivityNumber")
  final int? learningActivityNumber;
  @JsonKey(name: "toolNumber")
  final int? toolNumber;
  @JsonKey(name: "badgeId")
  final int? badgeId;
  @JsonKey(name: "certificateId")
  final int? certificateId;
  @JsonKey(name: "badge")
  final BadgeDto? badge;
  @JsonKey(name: "certificate")
  final CertificateDto? certificate;
  @JsonKey(name: "topicTags")
  final List<String>? topicTags;
  @JsonKey(name: "prereqType")
  final String? prereqType;
  @JsonKey(name: "isEnable")
  final bool? isEnable;
  @JsonKey(unknownEnumValue: EnrollType.unknown)
  final EnrollType? enrollType;
  @JsonKey(name: "expirationDate")
  final List<int>? expirationDate;
}
