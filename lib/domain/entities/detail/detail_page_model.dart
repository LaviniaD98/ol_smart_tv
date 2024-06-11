import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/data/models/responses/generic/detail_page_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/community/community_posts_model.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/badge_model.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/certificate_model.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/course_model.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/editions_model.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/releated_learning_activity_response_model.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/teacher_model.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/tool_response_model.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/useful_link_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:equatable/equatable.dart';

import '../generic/agenda_model.dart';
import '../strip/learning_object/meeting_details_model.dart';

class DetailPageModel extends Equatable {
  DetailPageModel({
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
    required this.learningObjectType,
    required this.learningObjectTypology,
    this.enrollId,
    this.enrollType,
    this.ecmType,
    this.ecmStartDate,
    this.ecmEndDate,
    required this.ecmRegistration,
    required this.ecmSpecialization,
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
    required this.iconStatus,
    this.downloadFlag,
    this.fruitionFlag,
    this.meetingDetails,
  });

  factory DetailPageModel.fromDto(DetailPageDto dto) {
    return DetailPageModel(
      id: dto.id,
      title: dto.title,
      coverId: dto.coverId,
      coverPrivateURL: dto.coverPrivateURL,
      coverPublicURL: dto.coverPublicURL,
      coverVideoId: dto.coverVideoId,
      coverVideoPrivateURL: dto.coverVideoPrivateURL,
      coverVideoPublicURL: dto.coverVideoPublicURL,
      brightCoverId: dto.brightCoverId,
      isMandatory: dto.isMandatory,
      isStandAlone: dto.isStandAlone,
      link: dto.link,
      badgeId: dto.badgeId,
      certificateId: dto.certificateId,
      testId: dto.testId,
      learningObjectType: dto.learningObjectType,
      learningObjectTypology: dto.learningObjectTypology,
      enrollId: dto.enrollId,
      enrollType: dto.enrollType,
      ecmType: dto.ecmType,
      ecmStartDate: dto.ecmStartDate,
      ecmEndDate: dto.ecmEndDate,
      ecmRegistration: dto.ecmRegistration ?? false,
      ecmSpecialization: dto.ecmSpecialization ?? false,
      sponsors: dto.sponsors,
      isFavourite: dto.isFavourite,
      averageRatingScore: dto.averageRatingScore,
      isPrereqEnable: dto.isPrereqEnable,
      prereqType: dto.prereqType,
      topicTags: dto.topicTags,
      topicTagIds: dto.topicTagIds,
      badgeIds: dto.badgeIds,
      certificateIds: dto.certificateIds,
      duration: dto.duration,
      status: dto.status ?? "",
      percentageOfCompletion: dto.percentageOfCompletion,
      shortDescription: dto.shortDescription,
      longDescription: dto.longDescription,
      publicationDate: dto.publicationDate,
      obsolescenceDate: dto.obsolescenceDate,
      expirationDate: dto.expirationDate,
      isExpirationDateHard: dto.isExpirationDateHard,
      courseNumber: dto.courseNumber,
      learningActivityNumber: dto.learningActivityNumber,
      toolNumber: dto.toolNumber,
      badgeNumber: dto.badgeNumber,
      downloadFlag: dto.downloadFlag,
      fruitionFlag: dto.fruitionFlag,
      meetingDetails: (dto.meetingDetails?.isNotEmpty == true)
          ? MeetingDetailsModel.fromDto(dto.meetingDetails?.first)
          : null,
      teachers: dto.teachers
          ?.map((dto) => TeacherModel(
              id: dto.id,
              completeName: dto.completeName,
              operationalField: dto.operationalField,
              image: dto.image))
          .toList(),
      agenda: dto.agenda
          ?.map((dto) => AgendaModel(
                isBreak: dto.isBreak,
                item: dto.item,
              ))
          .toList(),
      badge: dto.badge != null ? BadgeModel.fromDto(dto.badge) : null,
      certificate: dto.certificate != null
          ? CertificateModel.fromDto(dto.certificate)
          : null,
      iconStatus: _detailStatus(dto),
      courses: dto.courses
          ?.map((dto) => CourseModel(
              id: dto.id,
              title: dto.title,
              isMandatory: dto.isMandatory,
              status: dto.status ?? "",
              coverId: dto.coverId,
              coverPrivateURL: dto.coverPrivateURL,
              coverPublicURL: dto.coverPublicURL,
              coverVideoId: dto.coverVideoId,
              coverVideoPrivateURL: dto.coverVideoPrivateURL,
              coverVideoPublicURL: dto.coverVideoPublicURL,
              learningObjectType: dto.learningObjectType,
              learningObjectTypology: dto.learningObjectTypology,
              shortDescription: dto.shortDescription,
              prereqOrderNumber: dto.prereqOrderNumber,
              duration: dto.duration,
              percentageOfCompletion: dto.percentageOfCompletion,
              learningActivityNumber: dto.learningActivityNumber,
              toolNumber: dto.toolNumber,
              badgeId: dto.badgeId,
              certificateId: dto.certificateId,
              badge: dto.badge,
              certificate: CertificateModel.fromDto(dto.certificate),
              topicTags: dto.topicTags,
              prereqType: dto.prereqType,
              isEnable: dto.isEnable,
              enrollType: dto.enrollType,
              expirationDate: dto.expirationDate))
          .toList(),
      learningActivities: dto.learningActivities
          ?.map((dto) => LearningObjectModel.fromDto(dto))
          .toList(),
      usefulLinks: dto.usefulLinks
          ?.map((dto) => UsefulLinkModel(
              url: dto.url,
              urlLabel: dto.urlLabel,
              description: dto.description))
          .toList(),
    );
  }

  final int? id;
  final String? title;
  final int? coverId;
  final String? coverPrivateURL;
  final String? coverPublicURL;
  final int? coverVideoId;
  final String? coverVideoPrivateURL;
  final String? coverVideoPublicURL;
  final String? brightCoverId;
  final bool? isMandatory;
  final bool? isStandAlone;
  final String? link;
  final int? badgeId;
  final int? certificateId;
  final int? testId;
  final LearningObjectType learningObjectType;
  final LearningObjectTypology learningObjectTypology;
  final int? enrollId;
  final EnrollType? enrollType;

  final String? ecmType;
  final List<int>? ecmStartDate;
  final List<int>? ecmEndDate;
  final bool ecmRegistration;
  final bool ecmSpecialization;
  final List<String>? sponsors;

  bool? isFavourite;
  final double? averageRatingScore;
  final bool? isPrereqEnable;
  final String? prereqType;
  final List<String>? topicTags;
  final List<int>? topicTagIds;
  final List<int>? badgeIds;
  final List<int>? certificateIds;
  final int? duration;
  final String? status;
  final String? percentageOfCompletion;
  final String? shortDescription;
  final String? longDescription;
  final List<int>? publicationDate;
  final List<int>? obsolescenceDate;
  final List<int>? expirationDate;
  final bool? isExpirationDateHard;
  final int? courseNumber;
  final int? learningActivityNumber;
  final int? toolNumber;
  final int? badgeNumber;
  final List<TeacherModel>? teachers;
  final List<AgendaModel>? agenda;
  final BadgeModel? badge;
  final CertificateModel? certificate;
  final List<CourseModel>? courses;
  final List<LearningObjectModel>? learningActivities;
  final List<UsefulLinkModel>? usefulLinks;
  final IconStatus iconStatus;
  final bool? downloadFlag;
  final bool? fruitionFlag;
  final MeetingDetailsModel? meetingDetails;

  EditionsModel? editionsModel;
  ToolResponseModel? toolResponseModel;
  ReleatedLearningActivityResponseModel? releatedLearningActivityResponseModel;
  CommunityPostsModel? sharedPostsModel;

  set editions(EditionsModel editionsModel) {
    this.editionsModel = editionsModel;
  }

  set toolResponse(ToolResponseModel toolResponseModel) {
    this.toolResponseModel = toolResponseModel;
  }

  set releatedLearningActivity(
      ReleatedLearningActivityResponseModel
          releatedLearningActivityResponseModel) {
    this.releatedLearningActivityResponseModel =
        releatedLearningActivityResponseModel;
  }

  set sharedPosts(CommunityPostsModel sharedPostsModel) {
    this.sharedPostsModel = sharedPostsModel;
  }

  static IconStatus _detailStatus(DetailPageDto dto) {
    DateTime? expirationDateParsed = dto.expirationDate?.convertToDateTime;
    if (dto.status == 'C') {
      return IconStatus.completed;
    } else if (_isExpired(expirationDateParsed)) {
      return IconStatus.expired;
    } else if (dto.isMandatory == true) {
      return IconStatus.mandatory;
    } else {
      return IconStatus.idle;
    }
  }

  static bool _isExpired(DateTime? expirationDateParsed) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final bool? isExpired = expirationDateParsed?.isBefore(today);
    return isExpired == true;
  }

  bool isToj() {
    return (learningObjectType == LearningObjectType.async) &&
        (learningObjectTypology == LearningObjectTypology.material ||
            learningObjectTypology == LearningObjectTypology.goals ||
            learningObjectTypology == LearningObjectTypology.meeting ||
            learningObjectTypology == LearningObjectTypology.finalBalance);
  }

  @override
  List<Object?> get props => [
        id,
        title,
        coverId,
        coverPrivateURL,
        coverPublicURL,
        coverVideoId,
        coverVideoPrivateURL,
        coverVideoPublicURL,
        brightCoverId,
        isMandatory,
        isStandAlone,
        link,
        badgeId,
        certificateId,
        testId,
        learningObjectType,
        learningObjectTypology,
        enrollId,
        enrollType,
        ecmType,
        ecmStartDate,
        ecmEndDate,
        ecmRegistration,
        ecmSpecialization,
        sponsors,
        isFavourite,
        averageRatingScore,
        isPrereqEnable,
        prereqType,
        topicTags,
        topicTagIds,
        badgeIds,
        certificateIds,
        duration,
        status,
        percentageOfCompletion,
        shortDescription,
        longDescription,
        publicationDate,
        obsolescenceDate,
        expirationDate,
        isExpirationDateHard,
        courseNumber,
        learningActivityNumber,
        toolNumber,
        badgeNumber,
        teachers,
        agenda,
        badge,
        certificate,
        courses,
        learningActivities,
        usefulLinks,
        iconStatus,
        downloadFlag,
        fruitionFlag,
      ];
}
