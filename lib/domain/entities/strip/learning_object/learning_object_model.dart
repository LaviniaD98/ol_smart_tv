import 'package:open_learning_smart_tv/domain/entities/generic/teacher_model.dart';
import '../../../../data/models/responses/strip/learning_object_dto.dart';
import '../../../enums/types.dart';
import '../../generic/badge_model.dart';
import '../../generic/certificate_model.dart';
import '../../generic/edition_model.dart';
import '../../../../core/utils/extension.dart';

class LearningObjectModel {
  LearningObjectModel({
    required this.id,
    required this.iconStatus,
    required this.learningObjectType,
    required this.learningObjectTypology,
    required this.daysToShow,
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
    this.aiItemType,
    this.isFavourite,
    this.isTest,
    this.isSurvey,
    this.surveyId,
    this.trackOnClick,
    this.isSuggestedHR,
    this.isSuggestedAI,
    this.ratingScore,
    this.enrollType,
    this.topicTags,
    this.topicTagIds,
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
    this.ecmRegistration,
    this.ecmSpecialization,
  });

  factory LearningObjectModel.fromDto(LearningObjectDto dto) {
    return LearningObjectModel(
      id: dto.id,
      learningObjectType: dto.learningObjectType,
      iconStatus: _cardStatus(dto),
      learningObjectTypology: dto.learningObjectTypology,
      parentId: dto.parentId,
      grandParentId: dto.grandParentId,
      coverId: dto.coverId,
      brightcoveId: dto.brightcoveId,
      badgeId: dto.badgeId,
      certificateId: dto.certificateId,
      editionId: dto.editionId,
      coverPrivateURL: dto.coverPrivateURL,
      coverPublicURL: dto.coverPublicURL,
      videoId: dto.videoId,
      editionNumber: dto.editionNumber,
      videoPrivateURL: dto.videoPrivateURL,
      videoPublicURL: dto.videoPublicURL,
      title: dto.title,
      aiItemType: dto.aiItemType,
      isFavourite: dto.isFavourite,
      isTest: dto.isTest,
      isSurvey: dto.isSurvey,
      surveyId: dto.surveyId,
      trackOnClick: dto.trackOnClick ?? false,
      isSuggestedHR: dto.isSuggestedHR,
      isSuggestedAI: dto.isSuggestedAI,
      ratingScore: dto.ratingScore,
      enrollType: dto.enrollType,
      topicTags: dto.topicTags,
      topicTagIds: dto.topicTagIds,
      daysToShow: dto.daysToShow
              ?.map((e) => e.convertToDateTime)
              .whereType<DateTime>()
              .toList() ??
          [],
      duration: dto.duration,
      availablePlaces: dto.availablePlaces,
      enrolledDates: dto.enrolledDates,
      expirationDate: dto.expirationDate?.convertToDateTime,
      isExpired: dto.isExpired,
      isToBeHidden: dto.isToBeHidden,
      date: dto.date,
      shortDescription: dto.shortDescription,
      status: dto.status,
      percentageOfCompletion: dto.percentageOfCompletion,
      isMandatory: dto.isMandatory,
      isFixedExpiration: dto.isFixedExpiration,
      startDate: dto.startDate?.convertToDateTime,
      endDate: dto.endDate?.convertToDateTime,
      startTime: _timeFormat(dto.startTime),
      endTime: _timeFormat(dto.endTime),
      badge: dto.badge != null ? BadgeModel.fromDto(dto.badge!) : null,
      certificate: dto.certificate != null
          ? CertificateModel.fromDto(dto.certificate!)
          : null,
      editions: dto.editions?.map((e) => EditionModel.fromDto(e)).toList(),
      agendaHighlightEditions: dto.agendaHighlightEditions
          ?.map((e) => EditionModel.fromDto(e))
          .toList(),
      courseId: dto.courseId,
      isEnable: dto.isEnable,
      isStandAlone: dto.isStandAlone,
      prereqOrderNumber: dto.prereqOrderNumber,
      coverVideoId: dto.coverVideoId,
      coverVideoPrivateURL: dto.coverVideoPrivateURL,
      coverVideoPublicURL: dto.coverVideoPublicURL,
      longDescription: dto.longDescription,
      lastViewedDate: dto.lastViewedDate?.convertToDateTime,
      prereqType: dto.prereqType,
      teachers: dto.teachers
          ?.map((e) => TeacherModel(
              id: e.id,
              completeName: e.completeName,
              operationalField: e.operationalField,
              image: e.image))
          .toList(),
      toolNumber: dto.toolNumber,
      link: dto.link,
      fruitionFlag: dto.fruitionFlag,
      tentativeId: dto.tentativeId,
      ecmRegistration: dto.ecmRegistration,
      ecmSpecialization: dto.ecmSpecialization,
    );
  }

  final int id;
  final IconStatus iconStatus;
  final LearningObjectType learningObjectType;
  final LearningObjectTypology learningObjectTypology;
  final int? parentId;
  final int? grandParentId;
  final int? coverId;
  final int? badgeId;
  final int? certificateId;
  final int? editionId;
  final String? coverPrivateURL;
  final String? coverPublicURL;
  final String? brightcoveId;
  final int? videoId;
  final int? editionNumber;
  final String? videoPrivateURL;
  final String? videoPublicURL;
  final String? title;
  final String? aiItemType;
  bool? isFavourite;
  final bool? isTest;
  final bool? isSurvey;
  final int? surveyId;
  final bool? trackOnClick;
  final bool? isSuggestedHR;
  final bool? isSuggestedAI;
  final double? ratingScore;
  final EnrollType? enrollType;
  final List<String>? topicTags;
  final List<int>? topicTagIds;
  final List<DateTime> daysToShow;
  final int? duration;
  final int? availablePlaces;
  final List<String>? enrolledDates;
  final DateTime? expirationDate;
  final bool? isExpired;
  final bool? isToBeHidden;
  final String? date;
  final String? shortDescription;
  final String? status;
  final String? percentageOfCompletion;
  final bool? isMandatory;
  final bool? isFixedExpiration;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? startTime;
  final String? endTime;
  final BadgeModel? badge;
  final CertificateModel? certificate;
  final List<EditionModel>? editions;
  final List<EditionModel>? agendaHighlightEditions;
  final int? courseId;
  final bool? isEnable;
  final bool? isStandAlone;
  final int? prereqOrderNumber;
  final int? coverVideoId;
  final String? coverVideoPrivateURL;
  final String? coverVideoPublicURL;
  final String? longDescription;
  final DateTime? lastViewedDate;
  final String? prereqType;
  final List<TeacherModel>? teachers;
  final int? toolNumber;
  final String? link;
  final bool? fruitionFlag;
  final int? tentativeId;
  final bool? ecmRegistration;
  final bool? ecmSpecialization;

  static String? _timeFormat(String? value) {
    if (value == null) return null;
    final hours = value.split(':').first.replaceAll(' ', '').padLeft(2, '0');
    final minutes = value.split(':').last.replaceAll(' ', '').padRight(2, '0');
    return '$hours:$minutes';
  }

  static IconStatus _cardStatus(LearningObjectDto dto) {
    DateTime? expirationDateParsed = dto.expirationDate?.convertToDateTime;
    if (dto.isSuggestedAI == true) {
      return IconStatus.suggestedAI;
    } else if (dto.isSuggestedHR == true) {
      return IconStatus.suggestedHR;
    } else if (dto.status == 'C') {
      return IconStatus.completed;
    } else if (dto.isExpired == true || _isDateExpired(expirationDateParsed)) {
      return IconStatus.expired;
    } else if (dto.isMandatory == true) {
      return IconStatus.mandatory;
    } else {
      return IconStatus.idle;
    }
  }

  bool isToj() {
    return (learningObjectType == LearningObjectType.async) &&
        (learningObjectTypology == LearningObjectTypology.material ||
            learningObjectTypology == LearningObjectTypology.goals ||
            learningObjectTypology == LearningObjectTypology.meeting ||
            learningObjectTypology == LearningObjectTypology.finalBalance);
  }

  static bool _isDateExpired(DateTime? expirationDateParsed) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final bool? isExpired = expirationDateParsed?.isBefore(today);
    return isExpired == true;
  }
}
