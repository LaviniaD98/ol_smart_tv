import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../color_management/color_manager.dart';
import '../../../../../core/utils/utility.dart';
import '../../../../../domain/entities/community/community_data_model.dart';
import '../../../../../domain/enums/types.dart';
import '../../../../../remote_theming/labels/labels_manager.dart';
import '../../../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../../../theme/app_theme.dart';
import '../../../../common/widgets/dialog/ol_okcancel_dialog.dart';

class PostControls extends StatelessWidget {

  final CommunityDataModel post;
  final EdgeInsets? padding;
  final bool canEdit;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const PostControls({
    super.key,
    required this.post,
    this.padding,
    this.canEdit = false,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final type = PostType.fromString(post.postType);
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/time.svg',
            width: 18,
            colorFilter: ColorFilter.mode(
              ColorManager().getColorSystemPrimary01(),
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: Dimens.spacingXXS),
          Text(
            formatPostDate(DateTime.tryParse(post.created ?? '')),
            style: AppTextTheme.caption(
              color: ColorManager().getColorTextPrimary(),
            ),
          ),
          if (type == PostType.TALK && (post.body?.isNotEmpty == true || post.attachments?.brightcove != null)) ...[
            const SizedBox(width: Dimens.spacingS),
            SvgPicture.asset(
              'assets/icons/reading_time.svg',
              height: 19,
              colorFilter: ColorFilter.mode(ColorManager().getColorSystemPrimary01(), BlendMode.srcIn),
            ),
            const SizedBox(width: Dimens.spacingXXS),
            Text(
              formatReadingTime(post.body, post.attachments),
              style: AppTextTheme.caption(color: ColorManager().getColorTextPrimary()),
            ),
          ],
          if(canEdit && type != PostType.TALK) ...[
            const SizedBox(width: Dimens.spacingM),
            const Spacer(),
            GestureDetector(
              onTap: onEdit,
              child: Text(
                LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.modify),
                style: AppTextTheme.caption(
                  color: ColorManager().getColorTextPrimaryCta(),
                ),
              ),
            ),
            const SizedBox(width: Dimens.spacingM),
            GestureDetector(
              child: Text(
                LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.delete),
                style: AppTextTheme.caption(
                  color: ColorManager().getColorTextPrimaryCta(),
                ),
              ),
              onTap: () {
                OlOkCancelDialog.show(
                  context,
                  title: LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.post_delete_popup_title),
                  message: LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.post_delete_popup_message),
                  okActionLabel: LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.post_delete_popup_confirm),
                  cancelActionLabel: LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.post_delete_popup_cancel),
                  okCallback: onDelete,
                );
              },
            ),
          ],
        ],
      ),
    );
  }
}
