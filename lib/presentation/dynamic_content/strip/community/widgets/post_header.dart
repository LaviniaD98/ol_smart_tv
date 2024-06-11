import 'package:flutter/material.dart';

import '../../../../../color_management/color_manager.dart';
import '../../../../../domain/entities/community/community_data_model.dart';
import '../../../../../domain/enums/types.dart';
import '../../../../../theme/app_theme.dart';
import '../../../../common/widgets/user_info.dart';
import '../detail/widgets/post_badge_type.dart';
import 'post_controls.dart';

class PostHeader extends StatelessWidget {
  static const _imageSize = 40.0;

  final CommunityDataModel post;
  final bool canEdit;
  final bool showInfo;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const PostHeader({
    super.key,
    required this.post,
    this.showInfo = true,
    this.canEdit = false,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final type = PostType.fromString(post.postType);
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: UserInfo(
                name: post.owner?.name,
                lastName: post.owner?.surname,
                imageSize: _imageSize,
                imageUrl: post.owner?.profileImageUrl,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.spacingXS),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimens.radiusTag),
                color: ColorManager().getColorSystemPrimary02(),
              ),
              child: PostBadgeType(type),
            ),
          ],
        ),
        if(showInfo) PostControls(
          padding: const EdgeInsets.only(left: _imageSize + Dimens.spacingM),
          post: post,
          canEdit: canEdit,
          onEdit: onEdit,
          onDelete: onDelete,
        ),
      ],
    );
  }
}
