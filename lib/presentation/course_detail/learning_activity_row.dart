import 'package:open_learning_smart_tv/domain/entities/detail/detail_page_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../color_management/color_manager.dart';
import '../../theme/app_theme.dart';
import '../common/widgets/cards/learning_card.dart';
import '../wall/wall_strip_content_simple_page.dart';

class LearningActivityRow extends StatelessWidget {
  final List<LearningObjectModel> items;
  final DetailPageModel parentModel;
  final String? parentId;
  final String? grandParentId;
  final bool enable;
  final VoidCallback? returnFromDetailCallback;

  const LearningActivityRow({
    super.key,
    required this.items,
    required this.parentModel,
    this.parentId,
    this.grandParentId,
    this.enable = true,
    this.returnFromDetailCallback,
  });

  static const _padding = EdgeInsets.symmetric(horizontal: Dimens.spacingM);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: _header(context)),
        SliverToBoxAdapter(
          child: SizedBox(
            height: Dimens.learningCardHeight,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: _padding,
              separatorBuilder: (context, index) =>
                  const SizedBox(width: Dimens.spacingXS),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return LearningCard(
                  enable: items[index].isEnable ?? true,
                  data: items[index],
                  parentDetailPageModel: parentModel,
                  parentId: parentId,
                  grandParentId: grandParentId,
                  returnFromDetailCallback: returnFromDetailCallback,
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _header(BuildContext context) {
    if (items.length < 4) return const SizedBox(height: Dimens.spacingL);
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.spacingM,
          vertical: Dimens.spacingM,
        ),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: enable
              ? () {
                  context.pushNamed(
                    WallStripContentSimplePage.routeName,
                    extra: WallStripContentSimplePageArgs(
                      title: parentModel.title ?? '',
                      parentModel: parentModel,
                      items: items,
                      parentId: parentId,
                      grandParentId: grandParentId,
                    ),
                  );
                }
              : null,
          child: Transform.scale(
              scale: 0.9999,
              child: SvgPicture.asset(
                "assets/icons/right_arrow.svg",
                colorFilter: ColorFilter.mode(
                  ColorManager().getColorTextPrimary(),
                  BlendMode.srcIn,
                ),
              )),
        ),
      ),
    );
  }
}
