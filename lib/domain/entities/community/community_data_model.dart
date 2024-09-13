import 'package:open_learning_smart_tv/data/models/responses/community/attachments_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/community/attachments_model.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/responses/community/community_data_dto.dart';
import '../../enums/types.dart';
import 'community_topic_model.dart';
import 'community_user_model.dart';
import 'los_model.dart';

class CommunityDataModel extends Equatable {
  const CommunityDataModel({
    required this.topic,
    required this.learningObjectTypology,
    this.commentCount,
    this.attachments,
    this.ownerId,
    this.commentId,
    this.created,
    this.postType,
    this.publishDate,
    this.title,
    this.body,
    this.bodyTrim,
    this.subtitle,
    this.id,
    this.likes,
    this.changed,
    this.userId,
    this.loId,
    this.learningObject,
    this.owner,
    this.reply,
  });

  static AttachmentsModel? _getFirstAttachment(dynamic attachments) {
    if ((attachments is List && attachments.isEmpty) || attachments == null) {
      return null;
    } else if (attachments is List) {
      return AttachmentsModel.fromDto(
          AttachmentsDto.fromJson((attachments.first as Map<String, dynamic>)));
    } else {
      return AttachmentsModel.fromDto(
          AttachmentsDto.fromJson((attachments as Map<String, dynamic>)));
    }
  }

  factory CommunityDataModel.fromDto(
      CommunityDataDto dto, LosModel learningObject, CommunityUserModel owner) {
    return CommunityDataModel(
      commentCount: dto.commentCount,
      attachments: _getFirstAttachment(dto.attachments),
      ownerId: dto.ownerId,
      commentId: dto.commentId,
      created: dto.created,
      postType: dto.postType,
      publishDate: dto.publishDate,
      title: dto.title,
      body: dto.body,
      bodyTrim: dto.bodyTrim,
      subtitle: dto.subtitle,
      topic:
          dto.topic?.map((e) => CommunityTopicModel.fromDto(e)).toList() ?? [],
      id: dto.id,
      likes: dto.likes,
      changed: dto.changed,
      userId: dto.userId,
      loId: dto.loId,
      learningObjectTypology: dto.learningObjectTypology,
      learningObject: learningObject,
      owner: owner,
      reply: dto.reply,
    );
  }

  final String? commentCount;
  final AttachmentsModel? attachments;
  final String? ownerId;
  final String? commentId;
  final String? created;
  final String? postType;
  final String? publishDate;
  final String? title;
  final String? body;
  final String? bodyTrim;
  final String? subtitle;
  final List<CommunityTopicModel> topic;
  final String? id;
  final String? likes;
  final String? changed;
  final String? userId;
  final String? loId;
  final LearningObjectTypology learningObjectTypology;
  final LosModel? learningObject;
  final CommunityUserModel? owner;
  final String? reply;

  @override
  List<Object?> get props => [
        commentCount,
        attachments,
        ownerId,
        commentId,
        created,
        postType,
        publishDate,
        title,
        body,
        bodyTrim,
        subtitle,
        topic,
        id,
        likes,
        changed,
        userId,
        loId,
        learningObjectTypology,
        learningObject,
        owner,
        reply,
      ];
}
