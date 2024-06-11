import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/widgets/tools/tool_item/tool_item.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/generic/tool_model.dart';
import '../../../../remote_theming/labels/labels_manager.dart';
import '../../../../remote_theming/labels/remote_labels_keys.dart';

class ToolsList extends StatelessWidget {
  const ToolsList(
    this.items, {
    super.key,
    this.learningObjectId,
  });

  final List<ToolModel> items;
  final int? learningObjectId;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(Dimens.spacingM),
          sliver: SliverToBoxAdapter(
            child: Text(
              LabelsManager()
                  .getRemoteStringFromLabelKeys(RemoteLabelKeys.doc_text),
              style: AppTextTheme.subtitle(
                  color: ColorManager().getColorTextPrimary()),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return ToolItem(
                item: items[index],
                learningObjectId: learningObjectId,
              );
            },
            childCount: items.length,
          ),
        ),
      ],
    );
  }
}
