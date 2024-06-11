import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../../domain/entities/community/comment/comment_model.dart';
import '../../../../../../../../remote_theming/labels/labels_manager.dart';
import '../../../../../../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../../../../../../theme/app_theme.dart';
import '../../../../../../../common/widgets/dialog/ol_okcancel_dialog.dart';
import '../../../../../../../common/widgets/user_avatar/user_avatar.dart';
import '../../../../detail/widgets/add_comment_widget/cubit/add_comment_widget_cubit.dart';
import '../../comment_item_content.dart';

class AnswerItem extends StatelessWidget {
  static const _size = 36.0;
  final CommentModel data;
  final String? apiPath;
  final VoidCallback onSuccess;

  const AnswerItem(
    this.data, {
    super.key,
    required this.onSuccess,
    this.apiPath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimens.spacingM),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAvatar(
            id: data.ownerId,
            name: data.name,
            surname: data.surname,
            size: _size,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: Dimens.spacingS),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommentItemContent(data),
                  if(data.canEdit) Row(
                    children: [
                      TextButton(
                        style: AppButtonStyle.textSmall,
                        onPressed: () {
                          final event = EventData(
                            type: EventInputType.editAnswer,
                            data: data,
                            onSuccess: onSuccess,
                          );
                          context.read<AddCommentWidgetCubit>().edit(event);
                        },
                        child: Text(LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.modify)),
                      ),
                      const SizedBox(width: Dimens.spacingS),
                      TextButton(
                        style: AppButtonStyle.textSmall,
                        onPressed: () {
                          OlOkCancelDialog.show(
                              context,
                              title: LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.comment_delete_popup_title),
                              message: LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.post_delete_popup_message),
                              okActionLabel: LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.post_delete_popup_confirm),
                              cancelActionLabel: LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.post_delete_popup_cancel),
                              okCallback: () {
                                context.read<AddCommentWidgetCubit>().deleteAnswer(
                                  id: data.commentId,
                                  onSuccess: onSuccess,
                                  apiPath: apiPath,
                                );
                              });
                        },
                        child: Text(
                          LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.delete),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CommentItemArgs {
  final int userId;
  final String? name;
  final String? surname;

  const CommentItemArgs({
    required this.userId,
    this.name,
    this.surname,
  });
}
