import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/detail/detail_page_model.dart';
import '../../theme/app_theme.dart';
import '../common/widgets/app_bar/styled_app_bar.dart';
import '../common/widgets/cards/wall/learning_card_wall.dart';

class WallStripContentSimplePage extends StatelessWidget {
  static String routeName = 'wall-view';

  final WallStripContentSimplePageArgs args;

  const WallStripContentSimplePage(this.args, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StyledAppBar(title: args.title),
      body: SafeArea(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: AppTheme.backgroundGradient,
          ),
          child: ListView.separated(
            padding: const EdgeInsets.all(Dimens.spacingM),
            itemCount: args.items.length,
            itemBuilder: (context, index) => LearningCardWall(
              args.items[index],
              parentModel: args.parentModel,
              parentId: args.parentId,
              grandParentId: args.grandParentId,
            ),
            separatorBuilder: (_, __) =>
                const SizedBox(height: Dimens.spacingM),
          ),
        ),
      ),
    );
  }
}

class WallStripContentSimplePageArgs {
  final List<LearningObjectModel> items;
  final String title;
  final DetailPageModel? parentModel;
  final String? parentId;
  final String? grandParentId;

  const WallStripContentSimplePageArgs({
    required this.items,
    required this.title,
    this.parentModel,
    this.parentId,
    this.grandParentId,
  });
}
