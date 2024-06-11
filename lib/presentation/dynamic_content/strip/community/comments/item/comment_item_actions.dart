import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/comments/item/answers/answers.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/detail/widgets/add_comment_widget/cubit/add_comment_widget_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/dependency_injection/dependency_injection.dart';
import '../../../../../../domain/entities/community/comment/comment_model.dart';
import '../../../../../../remote_theming/labels/labels_manager.dart';
import '../../../../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../../../../theme/app_theme.dart';
import '../../../../../common/widgets/dialog/ol_okcancel_dialog.dart';
import 'answers/cubit/answers_cubit.dart';

class CommentItemAction extends StatelessWidget {
  final CommentModel data;
  final String? apiPath;
  const CommentItemAction(this.data, {super.key, this.apiPath});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AnswersCubit>(
      create: (_) => getIt<AnswersCubit>(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              BlocBuilder<AnswersCubit, AnswersState>(
                  builder: (context, state) {
                final event = EventData(
                  type: EventInputType.addAnswer,
                  data: data,
                  onSuccess: () =>
                      context.read<AnswersCubit>().refresh(data, apiPath),
                );
                return TextButton(
                  style: AppButtonStyle.textSmall,
                  onPressed: () {
                    context.read<AddCommentWidgetCubit>().reply(event);
                  },
                  child: Text(
                    LabelsManager()
                        .getRemoteStringFromLabelKeys(RemoteLabelKeys.reply),
                  ),
                );
              }),
              if (data.canEdit) ...[
                const SizedBox(width: Dimens.spacingS),
                TextButton(
                  style: AppButtonStyle.textSmall,
                  onPressed: () {
                    final event = EventData(
                      type: EventInputType.editComment,
                      data: data,
                    );
                    context.read<AddCommentWidgetCubit>().edit(event);
                  },
                  child: Text(
                    LabelsManager()
                        .getRemoteStringFromLabelKeys(RemoteLabelKeys.modify),
                  ),
                ),
                const SizedBox(width: Dimens.spacingS),
                TextButton(
                  style: AppButtonStyle.textSmall,
                  onPressed: () {
                    OlOkCancelDialog.show(context,
                        title: LabelsManager().getRemoteStringFromLabelKeys(
                            RemoteLabelKeys.comment_delete_popup_title),
                        message: LabelsManager().getRemoteStringFromLabelKeys(
                            RemoteLabelKeys.post_delete_popup_message),
                        okActionLabel: LabelsManager()
                            .getRemoteStringFromLabelKeys(
                                RemoteLabelKeys.post_delete_popup_confirm),
                        cancelActionLabel: LabelsManager()
                            .getRemoteStringFromLabelKeys(
                                RemoteLabelKeys.post_delete_popup_cancel),
                        okCallback: () {
                      context.read<AddCommentWidgetCubit>().deleteComment(
                            id: data.commentId,
                            apiPath: apiPath,
                          );
                    });
                  },
                  child: Text(
                    LabelsManager()
                        .getRemoteStringFromLabelKeys(RemoteLabelKeys.delete),
                  ),
                ),
              ],
            ],
          ),
          BlocBuilder<AnswersCubit, AnswersState>(builder: (context, state) {
            if (data.reply > 0 || state.answers.isNotEmpty)
              return Answers(data, apiPath: apiPath);
            return const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}
