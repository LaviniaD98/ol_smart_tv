import 'package:open_learning_smart_tv/data/models/responses/generic/agenda_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/generic/badge_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/generic/certificate_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/generic/course_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/generic/teacher_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/generic/useful_link_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/strip/learning_object_dto.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:json_annotation/json_annotation.dart';

import '../strip/meeting_details_dto.dart';

part 'detail_page_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class DetailPageDto {
  DetailPageDto(
      this.id,
      this.title,
      this.coverId,
      this.coverPrivateURL,
      this.coverPublicURL,
      this.coverVideoId,
      this.coverVideoPrivateURL,
      this.coverVideoPublicURL,
      this.brightCoverId,
      this.isMandatory,
      this.isStandAlone,
      this.link,
      this.badgeId,
      this.certificateId,
      this.testId,
      this.learningObjectType,
      this.learningObjectTypology,
      this.enrollId,
      this.enrollType,
      this.ecmType,
      this.ecmStartDate,
      this.ecmEndDate,
      this.ecmRegistration,
      this.ecmSpecialization,
      this.sponsors,
      this.isFavourite,
      this.averageRatingScore,
      this.isPrereqEnable,
      this.prereqType,
      this.topicTags,
      this.topicTagIds,
      this.badgeIds,
      this.certificateIds,
      this.duration,
      this.status,
      this.percentageOfCompletion,
      this.shortDescription,
      this.longDescription,
      this.publicationDate,
      this.obsolescenceDate,
      this.expirationDate,
      this.isExpirationDateHard,
      this.courseNumber,
      this.learningActivityNumber,
      this.toolNumber,
      this.badgeNumber,
      this.teachers,
      this.agenda,
      this.badge,
      this.certificate,
      this.courses,
      this.learningActivities,
      this.usefulLinks,
      this.downloadFlag,
      this.fruitionFlag,
      this.meetingDetails);

  factory DetailPageDto.fromJson(Map<String, dynamic> json) =>
      _$DetailPageDtoFromJson(json);

  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "title")
  final String? title;
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
  @JsonKey(name: "brightCoverId")
  final String? brightCoverId;
  @JsonKey(name: "isMandatory")
  final bool? isMandatory;
  @JsonKey(name: "isStandAlone")
  final bool? isStandAlone;
  @JsonKey(name: "link")
  final String? link;
  @JsonKey(name: "badgeId")
  final int? badgeId;
  @JsonKey(name: "certificateId")
  final int? certificateId;
  @JsonKey(name: "testId")
  final int? testId;
  @JsonKey(unknownEnumValue: LearningObjectType.unknown)
  final LearningObjectType learningObjectType;
  @JsonKey(unknownEnumValue: LearningObjectTypology.unknown)
  final LearningObjectTypology learningObjectTypology;
  @JsonKey(name: 'enrollId')
  final int? enrollId;
  @JsonKey(unknownEnumValue: EnrollType.unknown)
  final EnrollType? enrollType;

  @JsonKey(name: "ecmType")
  final String? ecmType;
  @JsonKey(name: "ecmStartDate")
  List<int>? ecmStartDate;
  @JsonKey(name: "ecmEndDate")
  List<int>? ecmEndDate;
  @JsonKey(name: "ecmRegistration")
  final bool? ecmRegistration;
  @JsonKey(name: "ecm_specialization")
  final bool? ecmSpecialization;
  @JsonKey()
  final List<String>? sponsors;
  @JsonKey(name: "isFavourite")
  final bool? isFavourite;
  @JsonKey(name: "averageRatingScore")
  final double? averageRatingScore;
  @JsonKey(name: "isPrereqEnable")
  final bool? isPrereqEnable;
  @JsonKey(name: "prereqType")
  final String? prereqType;
  @JsonKey(name: "topicTags")
  final List<String>? topicTags;
  @JsonKey(name: "topicTagIds")
  final List<int>? topicTagIds;
  @JsonKey(name: "badgeIds")
  final List<int>? badgeIds;
  @JsonKey(name: "certificateIds")
  final List<int>? certificateIds;
  @JsonKey(name: "duration")
  final int? duration;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "percentageOfCompletion")
  final String? percentageOfCompletion;
  @JsonKey(name: "shortDescription")
  final String? shortDescription;
  @JsonKey(name: "longDescription")
  final String? longDescription;
  @JsonKey(name: "publicationDate")
  final List<int>? publicationDate;
  @JsonKey(name: "obsolescenceDate")
  final List<int>? obsolescenceDate;
  @JsonKey(name: "expirationDate")
  final List<int>? expirationDate;
  @JsonKey(name: "isExpirationDateHard")
  final bool? isExpirationDateHard;
  @JsonKey(name: "courseNumber")
  final int? courseNumber;
  @JsonKey(name: "learningActivityNumber")
  final int? learningActivityNumber;
  @JsonKey(name: "toolNumber")
  final int? toolNumber;
  @JsonKey(name: "badgeNumber")
  final int? badgeNumber;
  @JsonKey(name: "teachers")
  final List<TeacherDto>? teachers;
  @JsonKey(name: "agenda")
  final List<AgendaDto>? agenda;
  @JsonKey(name: "badge")
  final BadgeDto? badge;
  @JsonKey(name: "certificate")
  final CertificateDto? certificate;
  @JsonKey(name: "courses")
  final List<CourseDto>? courses;
  @JsonKey(name: "learningActivities")
  final List<LearningObjectDto>? learningActivities;
  @JsonKey(name: "useful_links")
  final List<UsefulLinkDto>? usefulLinks;
  @JsonKey(name: "downloadFlag")
  final bool? downloadFlag;
  @JsonKey(name: "fruitionFlag")
  final bool? fruitionFlag;
  @JsonKey(name: "meetingDetails")
  final List<MeetingDetailsDto>? meetingDetails;
}
