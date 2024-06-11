import 'package:open_learning_smart_tv/data/models/responses/generic/teacher_dto.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../generic/badge_dto.dart';
import '../generic/certificate_dto.dart';
import '../generic/edition_dto.dart';

part 'learning_object_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class LearningObjectDto {
  LearningObjectDto(
    this.id,
    this.parentId,
    this.grandParentId,
    this.coverId,
    this.badgeId,
    this.certificateId,
    this.editionId,
    this.coverPrivateURL,
    this.coverPublicURL,
    this.brightcoveId,
    this.videoId,
    this.editionNumber,
    this.videoPrivateURL,
    this.videoPublicURL,
    this.title,
    this.learningObjectType,
    this.learningObjectTypology,
    this.isTest,
    this.isSurvey,
    this.surveyId,
    this.trackOnClick,
    this.aiItemType,
    this.isFavourite,
    this.isSuggestedHR,
    this.isSuggestedAI,
    this.ratingScore,
    this.enrollType,
    this.topicTags,
    this.topicTagIds,
    this.daysToShow,
    this.duration,
    this.availablePlaces,
    this.enrolledDates,
    this.expirationDate,
    this.isExpired,
    this.isToBeHidden,
    this.date,
    this.shortDescription,
    this.status,
    this.percentageOfCompletion,
    this.isMandatory,
    this.isFixedExpiration,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.badge,
    this.certificate,
    this.editions,
    this.agendaHighlightEditions,
    this.courseId,
    this.isEnable,
    this.isStandAlone,
    this.prereqOrderNumber,
    this.coverVideoId,
    this.coverVideoPrivateURL,
    this.coverVideoPublicURL,
    this.longDescription,
    this.lastViewedDate,
    this.prereqType,
    this.teachers,
    this.toolNumber,
    this.link,
    this.fruitionFlag,
    this.tentativeId,
  );

  factory LearningObjectDto.fromJson(Map<String, dynamic> json) =>
      _$LearningObjectDtoFromJson(json);

  @JsonKey()
  final int id;
  @JsonKey()
  final int? parentId;
  @JsonKey()
  final int? grandParentId;
  @JsonKey()
  final int? coverId;
  @JsonKey()
  final int? badgeId;
  @JsonKey()
  final int? certificateId;
  @JsonKey()
  final int? editionId;
  @JsonKey()
  final String? coverPrivateURL;
  @JsonKey()
  final String? coverPublicURL;
  @JsonKey(name: 'brightCoverId')
  final String? brightcoveId;
  @JsonKey()
  final int? videoId;
  @JsonKey()
  final int? editionNumber;
  @JsonKey()
  final String? videoPrivateURL;
  @JsonKey()
  final String? videoPublicURL;
  @JsonKey()
  final String? title;
  @JsonKey(unknownEnumValue: LearningObjectType.unknown)
  final LearningObjectType learningObjectType;
  @JsonKey(unknownEnumValue: LearningObjectTypology.unknown)
  final LearningObjectTypology learningObjectTypology;
  @JsonKey()
  final bool? isTest;
  @JsonKey()
  final bool? isSurvey;
  @JsonKey()
  final int? surveyId;
  @JsonKey()
  final bool? trackOnClick;
  @JsonKey()
  final String? aiItemType;
  @JsonKey()
  final bool? isFavourite;
  @JsonKey()
  final bool? isSuggestedHR;
  @JsonKey()
  final bool? isSuggestedAI;
  @JsonKey()
  final double? ratingScore;
  @JsonKey()
  final EnrollType? enrollType;
  @JsonKey()
  final List<String>? topicTags;
  @JsonKey()
  final List<int>? topicTagIds;
  @JsonKey()
  final List<List<int>>? daysToShow;
  @JsonKey()
  final int? duration;
  @JsonKey()
  final int? availablePlaces;
  @JsonKey()
  final List<String>? enrolledDates;
  @JsonKey()
  final List<int>? expirationDate;
  @JsonKey()
  final bool? isExpired;
  @JsonKey()
  final bool? isToBeHidden;
  @JsonKey()
  final String? date;
  @JsonKey()
  final String? shortDescription;
  @JsonKey()
  final String? status;
  @JsonKey()
  final String? percentageOfCompletion;
  @JsonKey()
  final bool? isMandatory;
  @JsonKey()
  final bool? isFixedExpiration;
  @JsonKey()
  final List<int>? startDate;
  @JsonKey()
  final List<int>? endDate;
  @JsonKey()
  final String? startTime;
  @JsonKey()
  final String? endTime;
  @JsonKey()
  final BadgeDto? badge;
  @JsonKey()
  final CertificateDto? certificate;
  @JsonKey()
  final List<EditionDto>? editions;
  @JsonKey()
  final List<EditionDto>? agendaHighlightEditions;
  @JsonKey()
  final int? courseId;
  @JsonKey()
  final bool? isEnable;
  @JsonKey()
  final bool? isStandAlone;
  @JsonKey()
  final int? prereqOrderNumber;
  @JsonKey()
  final int? coverVideoId;
  @JsonKey()
  final String? coverVideoPrivateURL;
  @JsonKey()
  final String? coverVideoPublicURL;
  @JsonKey()
  final String? longDescription;
  @JsonKey()
  final List<int>? lastViewedDate;
  @JsonKey()
  final String? prereqType;
  @JsonKey(name: "teachers")
  final List<TeacherDto>? teachers;
  @JsonKey()
  final int? toolNumber;
  @JsonKey()
  final String? link;
  @JsonKey(name: "fruitionFlag")
  final bool? fruitionFlag;
  @JsonKey()
  final int? tentativeId;
}
