import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/row/strip_row.dart';
import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';
import 'package:open_learning_smart_tv/presentation/main/favorites/favorite_card.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../../../../theme/app_theme.dart';

class FavoritesVerticalCarousel extends StatefulWidget {
  final Map<StripRow, List<LearningObjectModel>> strip;
  final void Function(bool)? onFocusChange;

  const FavoritesVerticalCarousel({
    super.key,
    required this.strip,
    this.onFocusChange,
  });
  @override
  State<FavoritesVerticalCarousel> createState() =>
      FavoritesVerticalCarouselState();
}

class FavoritesVerticalCarouselState extends State<FavoritesVerticalCarousel>
    with AutomaticKeepAliveClientMixin {
  late OlFocusScopeNode focusNode;
  final OrderedTraversalPolicy _policy = OrderedTraversalPolicy();

  final autoScrollController = AutoScrollController(
    viewportBoundaryGetter: () => const Rect.fromLTRB(0, 100, 0, 0),
    axis: Axis.vertical,
  );

  int currentFocusIndex = 0;

  @override
  void initState() {
    super.initState();

    focusNode = OlFocusScopeNode(
      id: 'FAVORITES-----${widget.strip.keys.firstOrNull?.labelMapping}',
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
        const SingleActivator(LogicalKeyboardKey.arrowUp): () {
          if (currentFocusIndex > 0) {
            _policy.previous(focusNode);
          }
        },
        const SingleActivator(LogicalKeyboardKey.arrowDown): () {
          if (currentFocusIndex < strip.value.length - 1) {
            _policy.next(focusNode);
          }
        },
      },
      child: FocusTraversalGroup(
        key: ValueKey(strip.key.labelMapping),
        policy: _policy,
        child: FocusScope(
          node: focusNode,
          onFocusChange: (value) {
            widget.onFocusChange?.call(value);
          },
          child: ListView.separated(
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
              return FavoriteCard(
                data: item,
                index: index,
                onFocusChange: (hasFocus) {
                  if (hasFocus) {
                    currentFocusIndex = index;
                  }
                },
              );
            },
          ),
        ),
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
