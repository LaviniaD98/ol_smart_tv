import 'package:open_learning_smart_tv/domain/entities/community/community_posts_model.dart';
import 'package:collection/collection.dart';
import '../../../../core/dependency_injection/dependency_injection.dart';
import '../../../use_cases/get_secure_stored_user_info_use_case.dart';
import '../community_data_model.dart';
import '../community_user_model.dart';

class CommentModel {
  const CommentModel({
    this.ownerId,
    this.name,
    this.surname,
    this.body,
    this.created,
    this.changed,
    required this.commentId,
    required this.reply,
    required this.canEdit,
  });

  final int commentId;
  final int? ownerId;
  final String? name;
  final String? surname;
  final String? body;
  final DateTime? created;
  final DateTime? changed;
  final int reply;
  final bool canEdit;

  factory CommentModel.fromData({
    required CommunityDataModel data,
    required CommunityUserModel? user,
    required bool canEdit,
  }) {
    return CommentModel(
      name: user?.name ?? '',
      surname: user?.surname ?? '',
      reply: int.tryParse(data.reply ?? '0') ?? 0,
      body: data.body ?? '',
      commentId: int.parse(data.commentId!),
      ownerId: int.tryParse(data.ownerId ?? ''),
      changed: data.changed != null ? DateTime.tryParse(data.changed!) : null,
      created: data.created != null ? DateTime.tryParse(data.created!) : null,
      canEdit: canEdit,
    );
  }

  static Future<List<CommentModel>> getListFromPost(
      CommunityPostsModel post) async {
    final userModel = await getIt<GetSecureStoredUserInfoUseCase>()();
    final users = post.enrichedInformation?.users;
    return post.data
        .where(
            (element) => element.ownerId != null && element.commentId != null)
        .map((e) {
      final user = users?.firstWhereOrNull((element) =>
          element.ownerId != null &&
          element.ownerId!.isNotEmpty &&
          element.ownerId == e.ownerId);
      final canEdit = userModel?.user?.idUser != null
          ? userModel?.user?.idUser == int.parse(e.ownerId ?? '')
          : false;
      return CommentModel.fromData(
        data: e,
        user: user,
        canEdit: canEdit,
      );
    }).toList();
  }
}
