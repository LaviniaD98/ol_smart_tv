import 'package:open_learning_smart_tv/data/models/responses/generic/course_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/certificate_model.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';

import '../../../data/models/responses/generic/badge_dto.dart';

class CourseModel {
  CourseModel(
      {required this.id,
      required this.title,
      required this.isMandatory,
      required this.status,
      required this.coverId,
      required this.coverPrivateURL,
      required this.coverPublicURL,
      required this.coverVideoId,
      required this.coverVideoPrivateURL,
      required this.coverVideoPublicURL,
      required this.learningObjectType,
      required this.learningObjectTypology,
      required this.shortDescription,
      required this.prereqOrderNumber,
      required this.duration,
      required this.percentageOfCompletion,
      required this.learningActivityNumber,
      required this.toolNumber,
      required this.badgeId,
      required this.certificateId,
      required this.badge,
      required this.certificate,
      required this.topicTags,
      required this.prereqType,
      required this.isEnable,
      required this.enrollType,
      required this.expirationDate});

  factory CourseModel.fromDto(CourseDto dto) {
    return CourseModel(
      id: dto.id,
      title: dto.title,
      isMandatory: dto.isMandatory,
      status: dto.status,
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
      expirationDate: dto.expirationDate,
    );
  }

  final int? id;
  final String? title;
  final bool? isMandatory;
  final String? status;
  final int? coverId;
  final String? coverPrivateURL;
  final String? coverPublicURL;
  final int? coverVideoId;
  final String? coverVideoPrivateURL;
  final String? coverVideoPublicURL;
  final LearningObjectType learningObjectType;
  final LearningObjectTypology learningObjectTypology;
  final String? shortDescription;
  final int? prereqOrderNumber;
  final int? duration;
  final String? percentageOfCompletion;
  final int? learningActivityNumber;
  final int? toolNumber;
  final int? badgeId;
  final int? certificateId;
  final BadgeDto? badge;
  final CertificateModel? certificate;
  final List<String>? topicTags;
  final String? prereqType;
  final bool? isEnable;
  final EnrollType? enrollType;
  final List<int>? expirationDate;
}
