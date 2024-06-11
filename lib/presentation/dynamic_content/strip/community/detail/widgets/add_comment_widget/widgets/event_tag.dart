import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../core/utils/extension.dart';
import '../../../../../../../../color_management/color_manager.dart';
import '../../../../../../../../remote_theming/labels/labels_manager.dart';
import '../../../../../../../../theme/app_theme.dart';
import '../cubit/add_comment_widget_cubit.dart';

class EventTag extends StatelessWidget {
  final EventData event;
  const EventTag(this.event, {super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: Dimens.spacingXXS),
        child: Row(
          children: [
            Expanded(
              child: _getEventWidget(context, event),
            ),
            const SizedBox(width: Dimens.spacingS),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                context.read<AddCommentWidgetCubit>().reset();
              },
              child: Container(
                padding: const EdgeInsets.all(
                  Dimens.spacingXXXS,
                ),
                decoration: BoxDecoration(
                  color: ColorManager().getColorBackgroundDisabled(),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  size: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getEventWidget(BuildContext context, EventData? event) =>
      switch (event?.type) {
        EventInputType.addAnswer => _answer,
        EventInputType.editAnswer => _editAnswer,
        EventInputType.editComment => _comment,
        _ => const SizedBox.shrink(),
      };

  Widget get _answer => Text.rich(
        TextSpan(
          children: [
            TextSpan(
                text: LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.community_reply_to)),
            TextSpan(
              text:
                  ' ${event.data.name?.capitalize ?? ''} ${event.data.surname?.capitalize ?? ''}',
              style: AppTextTheme.caption(
                size: 10,
                weight: FontWeight.w900,
              ),
            ),
          ],
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTextTheme.caption(
          size: 10,
          color: ColorManager().getColorTextPrimary(),
        ),
      );

  Widget get _editAnswer => Text(
        LabelsManager().getRemoteStringFromLabelKeys(
            RemoteLabelKeys.community_modify_answer),
        style: AppTextTheme.caption(
          color: ColorManager().getColorTextPrimary(),
        ),
      );

  Widget get _comment => Text(
        LabelsManager().getRemoteStringFromLabelKeys(
            RemoteLabelKeys.community_modify_comment),
        style: AppTextTheme.caption(
          color: ColorManager().getColorTextPrimary(),
        ),
      );
}
