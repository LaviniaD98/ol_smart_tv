import 'package:flutter/services.dart';
import 'package:open_learning_smart_tv/app_manager.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
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
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
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

  static Widget shimmerLoader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Shimmer.fromColors(
          baseColor: AppColors.white.withOpacity(.1),
          highlightColor: AppColors.primaryFaded.withOpacity(.5),
          child: Container(
            margin: const EdgeInsets.only(
              left: Dimens.hViewPadding,
              right: Dimens.hViewPadding,
            ),
            width: 200,
            clipBehavior: Clip.none,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.3),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              '', //'A',
              style: AppTextTheme.subtitle(
                weight: FontWeight.w700,
                size: 32,
                color: Colors.black,
              ),
            ),
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
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(
                left: Dimens.hViewPadding,
                right: Dimens.hViewPadding,
              ),
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) =>
                  const SizedBox(width: Dimens.spacingXS),
              itemCount: 4,
              itemBuilder: (context, index) {
                return const LearningCardShimmer();
              },
            ),
          ),
        ),
        const SizedBox(height: 38),
      ],
    );
  }

  @override
  State<StripRowContent> createState() => StripRowContentState();
}

class StripRowContentState extends State<StripRowContent>
    with AutomaticKeepAliveClientMixin {
  static const detailsHeight = 411.0;
  late OlFocusScopeNode focusNode;
  final OrderedTraversalPolicy _policy = OrderedTraversalPolicy();
  late PageController pageController;

  final autoScrollController = AutoScrollController(
    viewportBoundaryGetter: () =>
        const Rect.fromLTRB(Dimens.hViewPadding, 0, 0, 0),
    axis: Axis.horizontal,
  );
  int currentFocusIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();

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
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                Stack(
                  children: [
                    Opacity(
                      opacity: 0,
                      child: SizedBox(
                        height: 0,
                        child: PageView.builder(
                          itemCount: strip.value.length,
                          controller: pageController,
                          itemBuilder: (context, index) {
                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 38,
                        bottom: 20,
                      ),
                      child: SizedBox(
                        height: Dimens.learningCardTVHeight,
                        child: ListView.separated(
                          controller: autoScrollController,
                          scrollDirection: Axis.horizontal,
                          clipBehavior: Clip.none,
                          padding: const EdgeInsets.only(
                            left: Dimens.hViewPadding,
                            right: Dimens.hPadding,
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: Dimens.spacingXS),
                          itemCount: strip.value.length,
                          itemBuilder: (context, index) {
                            final item = strip.value[index];
                            final cell = AutoScrollTag(
                              key: ValueKey(index),
                              controller: autoScrollController,
                              index: index,
                              child: LearningCard(
                                data: item,
                                onFocusChange: (hasFocus) {
                                  if (hasFocus) {
                                    pageController.animateToPage(
                                      index,
                                      duration:
                                          const Duration(milliseconds: 200),
                                      curve: Curves.easeInOut,
                                    );
                                    currentFocusIndex = index;
                                    widget.focusedObjectNotifier?.value = item;
                                    scrollToPosition(index);
                                  }
                                },
                              ),
                            );

                            return CallbackShortcuts(
                              bindings: <ShortcutActivator, VoidCallback>{
                                const SingleActivator(LogicalKeyboardKey.enter):
                                    () => pushDetails(item: item),
                                const SingleActivator(
                                        LogicalKeyboardKey.select):
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
                Align(
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: strip.value.length,
                    effect: ScrollingDotsEffect(
                      dotHeight: 12,
                      dotWidth: 12,
                      activeDotScale: 1.3,
                      spacing: 16,
                      maxVisibleDots: 9,
                      activeStrokeWidth: 3,
                      //fixedCenter: true,
                      activeDotColor: OLColors.textPrimary,
                      dotColor: OLColors.textPrimary.withOpacity(0.4),
                    ),
                    onDotClicked: (index) {},
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> scrollToPosition(int index) async {
    await autoScrollController.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.begin,
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

  @override
  bool get wantKeepAlive => true;
}
