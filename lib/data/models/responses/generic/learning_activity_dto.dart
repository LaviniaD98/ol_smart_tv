import 'package:open_learning_smart_tv/data/models/responses/generic/badge_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/generic/certificate_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/generic/teacher_dto.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'learning_activity_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class LearningActivityDto {
  LearningActivityDto(
      this.id,
      this.courseId,
      this.title,
      this.isMandatory,
      this.isFavourite,
      this.ratingScore,
      this.topicTagIds,
      this.isEnable,
      this.enrollType,
      this.expirationDate,
      this.isStandAlone,
      this.prereqOrderNumber,
      this.status,
      this.coverId,
      this.badgeId,
      this.badge,
      this.certificate,
      this.coverPrivateURL,
      this.coverPublicURL,
      this.coverVideoId,
      this.coverVideoPrivateURL,
      this.coverVideoPublicURL,
      this.learningObjectType,
      this.learningObjectTypology,
      this.shortDescription,
      this.longDescription,
      this.duration,
      this.percentageOfCompletion,
      this.lastViewedDate,
      this.toolNumber,
      this.topicTags,
      this.prereqType,
      this.teachers);

  factory LearningActivityDto.fromJson(Map<String, dynamic> json) =>
      _$LearningActivityDtoFromJson(json);

  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "courseId")
  final int? courseId;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "isMandatory")
  final bool? isMandatory;
  @JsonKey(name: "isFavourite")
  final bool? isFavourite;
  @JsonKey(name: "ratingScore")
  final int? ratingScore;
  @JsonKey(name: "topicTagIds")
  final List<int>? topicTagIds;
  @JsonKey(name: "isEnable")
  final bool? isEnable;
  @JsonKey(unknownEnumValue: EnrollType.unknown)
  final EnrollType? enrollType;
  @JsonKey(name: "expirationDate")
  final List<int>? expirationDate;
  @JsonKey(name: "isStandAlone")
  final bool? isStandAlone;
  @JsonKey(name: "prereqOrderNumber")
  final int? prereqOrderNumber;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "coverId")
  final int? coverId;
  @JsonKey(name: "badgeId")
  final int? badgeId;
  @JsonKey(name: "badge")
  final BadgeDto? badge;
  @JsonKey(name: "certificate")
  final CertificateDto? certificate;
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
  @JsonKey(name: "learningObjectType")
  final String? learningObjectType;
  @JsonKey(name: "learningObjectTypology")
  final String? learningObjectTypology;
  @JsonKey(name: "shortDescription")
  final String? shortDescription;
  @JsonKey(name: "longDescription")
  final String? longDescription;
  @JsonKey(name: "duration")
  final int? duration;
  @JsonKey(name: "percentageOfCompletion")
  final String? percentageOfCompletion;
  @JsonKey(name: "lastViewedDate")
  final List<int>? lastViewedDate;
  @JsonKey(name: "toolNumber")
  final int? toolNumber;
  @JsonKey(name: "topicTags")
  final List<String>? topicTags;
  @JsonKey(name: "prereqType")
  final String? prereqType;
  @JsonKey(name: "teachers")
  final List<TeacherDto>? teachers;
}
