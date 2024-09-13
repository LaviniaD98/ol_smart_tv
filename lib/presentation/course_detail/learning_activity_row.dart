import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_learning_smart_tv/core/utils/nav.dart';
import 'package:open_learning_smart_tv/domain/entities/detail/detail_page_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/cubit/detail_page_cubit.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../color_management/color_manager.dart';
import '../../theme/app_theme.dart';
import '../common/widgets/cards/learning_card.dart';
import '../wall/wall_strip_content_simple_page.dart';

class LearningActivityRow extends StatefulWidget {
  final List<LearningObjectModel> items;
  final DetailPageModel parentModel;
  final String? parentId;
  final String? grandParentId;
  final bool enable;
  final bool isGridView;
  final VoidCallback? returnFromDetailCallback;

  const LearningActivityRow({
    super.key,
    required this.items,
    required this.parentModel,
    this.parentId,
    this.grandParentId,
    this.enable = true,
    this.isGridView = false,
    this.returnFromDetailCallback,
  });

  static const _padding = EdgeInsets.symmetric(horizontal: Dimens.spacingM);

  @override
  State<LearningActivityRow> createState() => _LearningActivityRowState();
}

class _LearningActivityRowState extends State<LearningActivityRow> {
  final autoScrollController = AutoScrollController(
    viewportBoundaryGetter: () => const Rect.fromLTRB(0, 340, 0, 0),
    axis: Axis.vertical,
  );

  final _focusNode = FocusScopeNode(debugLabel: 'LearningActivityRow');

  late List<LearningObjectModel> items;

  @override
  void initState() {
    super.initState();
    items = widget.items;
  }

  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: <ShortcutActivator, VoidCallback>{
        const SingleActivator(LogicalKeyboardKey.arrowLeft): () {
          final res = _focusNode.focusInDirection(TraversalDirection.left);

          if (res == false) {
            context.read<DetailPageCubit>().leftPanelNode?.requestFocus();
          }
        },
      },
      child: FocusScope(
        node: _focusNode,
        onFocusChange: (value) {},
        child: Builder(
          builder: (context) {
            if (widget.isGridView) {
              return GridView.builder(
                controller: autoScrollController,
                clipBehavior: Clip.none,
                padding: const EdgeInsets.only(
                  left: Dimens.hViewPadding,
                  right: Dimens.hViewPadding - 24,
                  top: Dimens.spacingM,
                  bottom: 200,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 12,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return AutoScrollTag(
                    key: ValueKey(index),
                    controller: autoScrollController,
                    index: index,
                    child: LearningCard(
                      enable: items[index].isEnable ?? true,
                      data: items[index],
                      parentDetailPageModel: widget.parentModel,
                      parentId: widget.parentId,
                      grandParentId: widget.grandParentId,
                      isGridViewItem: true,
                      returnFromDetailCallback: widget.returnFromDetailCallback,
                      onFocusChange: (p0) {
                        if (p0) {
                          scrollToPosition(index);
                        }
                      },
                    ),
                  );
                },
              );
            }
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: _header(context)),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: Dimens.learningCardHeight,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: LearningActivityRow._padding,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: Dimens.spacingXS),
                      itemCount: widget.items.length,
                      itemBuilder: (context, index) {
                        return LearningCard(
                          enable: widget.items[index].isEnable ?? true,
                          data: widget.items[index],
                          parentDetailPageModel: widget.parentModel,
                          parentId: widget.parentId,
                          grandParentId: widget.grandParentId,
                          returnFromDetailCallback:
                              widget.returnFromDetailCallback,
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    if (widget.items.length < 4) return const SizedBox(height: Dimens.spacingL);
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.spacingM,
          vertical: Dimens.spacingM,
        ),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: widget.enable
              ? () {
                  Nav.push(
                    context,
                    screen: WallStripContentSimplePage(
                      WallStripContentSimplePageArgs(
                        title: widget.parentModel.title ?? '',
                        parentModel: widget.parentModel,
                        items: widget.items,
                        parentId: widget.parentId,
                        grandParentId: widget.grandParentId,
                      ),
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

  int? currentIndex;

  Future<void> scrollToPosition(int index) async {
    currentIndex = index;
    await autoScrollController.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.begin,
    );
  }
}
