import 'package:flutter/services.dart';
import 'package:open_learning_smart_tv/app_manager.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/core/dependency_injection/dependency_injection.dart';
import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/row/strip_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/cubit/detail_page_cubit.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/detail_page.dart';
import 'package:open_learning_smart_tv/presentation/main/main_state_cubit.dart';
import '../../../../theme/app_theme.dart';
import '../../../common/widgets/cards/learning_card.dart';

class StripRowContent extends StatefulWidget {
  final Map<StripRow, List<LearningObjectModel>> strip;
  final void Function(bool)? onFocusChange;
  final ValueNotifier<LearningObjectModel?>? focusedObjectNotifier;
  final int order;

  const StripRowContent({
    super.key,
    required this.strip,
    required this.order,
    this.onFocusChange,
    this.focusedObjectNotifier,
  });
  @override
  State<StripRowContent> createState() => StripRowContentState();
}

class StripRowContentState extends State<StripRowContent>
    with AutomaticKeepAliveClientMixin {
  late OlFocusScopeNode focusNode;

  static const detailsHeight = 411.0;

  final OrderedTraversalPolicy _policy = OrderedTraversalPolicy();

  int currentFocusIndex = 0;

  @override
  void initState() {
    super.initState();

    focusNode = OlFocusScopeNode(
      id: 'Explore-----${widget.strip.keys.firstOrNull?.labelMapping}',
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final strip = widget.strip.entries.firstOrNull;

    if (strip == null) {
      return const SizedBox.shrink();
    }

    return CallbackShortcuts(
      bindings: <ShortcutActivator, VoidCallback>{
        const SingleActivator(LogicalKeyboardKey.arrowLeft): () {
          if (currentFocusIndex > 0) {
            _policy.previous(focusNode);
          } else {
            final focus = context.read<MainStateCubit>().state;
            focus.requestFocus();
          }
        },
        const SingleActivator(LogicalKeyboardKey.arrowRight): () {
          if (currentFocusIndex < strip.value.length - 1) {
            _policy.next(focusNode);
          }
        },
      },
      child: FocusTraversalOrder(
        order: NumericFocusOrder(widget.order.toDouble()),
        child: FocusTraversalGroup(
          key: ValueKey(strip.key.labelMapping),
          policy: _policy,
          child: FocusScope(
            node: focusNode,
            onFocusChange: (value) {
              widget.onFocusChange?.call(value);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimens.hViewPadding,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          strip.key.label,
                          style: AppTextTheme.subtitle(
                            weight: FontWeight.w700,
                            size: 32,
                            color: ColorManager().getColorTextPrimary(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 38,
                    bottom: 44,
                  ),
                  child: SizedBox(
                    height: Dimens.learningCardTVHeight,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none,
                      padding: const EdgeInsets.only(
                        left: Dimens.hViewPadding,
                        right: Dimens.hViewPadding,
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: Dimens.spacingXS),
                      itemCount: strip.value.length,
                      itemBuilder: (context, index) {
                        final item = strip.value[index];
                        final cell = LearningCard(
                          data: item,
                          onFocusChange: (hasFocus) {
                            if (hasFocus) {
                              currentFocusIndex = index;
                              widget.focusedObjectNotifier?.value = item;
                            }
                          },
                        );

                        return CallbackShortcuts(
                          bindings: <ShortcutActivator, VoidCallback>{
                            const SingleActivator(LogicalKeyboardKey.enter):
                                () => pushDetails(item: item),
                            const SingleActivator(LogicalKeyboardKey.select):
                                () => pushDetails(item: item),
                          },
                          child: cell,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void pushDetails({required LearningObjectModel item}) async {
    final args = DetailPageArgs(
      id: item.id.toString(),
      object: item,
      parentId: item.parentId?.toString(),
      grandParentId: item.grandParentId?.toString(),
      typology: item.learningObjectTypology,
    );

    manager.pushOnStack(
      screen: BlocProvider(
        create: (_) => getIt<DetailPageCubit>()..init(args),
        child: DetailPage(args: args),
      ),
    );
  }

  // Widget get _shimmerLoader {
  //   return FocusScope(
  //     node: focusNode,
  //     onFocusChange: (value) {
  //       widget.onFocusChange?.call(value);
  //     },
  //     child: FocusTraversalGroup(
  //       key: ValueKey(widget.strip.labelMapping),
  //       child: Shimmer.fromColors(
  //         baseColor: AppColors.white.withOpacity(.09),
  //         highlightColor: AppColors.primaryFaded,
  //         period: const Duration(seconds: 2),
  //         enabled: false,
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             const SizedBox(height: 8),
  //             Container(
  //               margin: const EdgeInsets.only(
  //                 left: Dimens.hViewPadding,
  //                 right: Dimens.hViewPadding,
  //               ),
  //               width: (MediaQuery.of(context).size.width /
  //                       Dimens.learningCardRatio) *
  //                   .7,
  //               clipBehavior: Clip.none,
  //               decoration: BoxDecoration(
  //                 color: Colors.white.withOpacity(.3),
  //                 borderRadius: BorderRadius.circular(8.0),
  //               ),
  //               child: Text(
  //                 strip.labelMapping ?? '', //'A',
  //                 style: AppTextTheme.subtitle(
  //                   weight: FontWeight.w700,
  //                   size: 32,
  //                   color: Colors.black,
  //                 ),
  //               ),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.only(
  //                 top: 38,
  //                 bottom: 44,
  //               ),
  //               child: SizedBox(
  //                 height: Dimens.learningCardTVHeight,
  //                 child: ListView.separated(
  //                   clipBehavior: Clip.none,
  //                   scrollDirection: Axis.horizontal,
  //                   padding: const EdgeInsets.only(
  //                     left: Dimens.hViewPadding,
  //                     right: Dimens.hViewPadding,
  //                   ),
  //                   physics: const NeverScrollableScrollPhysics(),
  //                   separatorBuilder: (context, index) =>
  //                       const SizedBox(width: Dimens.spacingXS),
  //                   itemCount: 4,
  //                   itemBuilder: (context, index) {
  //                     return const LearningCardShimmer();
  //                   },
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  bool get wantKeepAlive => true;
}
