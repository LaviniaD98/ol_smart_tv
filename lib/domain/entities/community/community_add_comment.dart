import '../../../data/models/responses/community/community_add_comment_dto.dart';

class CommunityAddCommentModel {
  CommunityAddCommentModel({
    this.id,
    this.message,
  });

  factory CommunityAddCommentModel.fromDto(CommunityAddCommentModelDto dto) {
    return CommunityAddCommentModel(
      id: dto.id,
      message: dto.message,
    );
  }

  final String? id;
  final String? message;
}