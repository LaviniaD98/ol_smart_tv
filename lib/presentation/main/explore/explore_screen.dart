import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/core/dependency_injection/dependency_injection.dart';
import 'package:open_learning_smart_tv/domain/entities/menu/route/menu_route.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/row/strip_row.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/topics_filter/topics_filter_list.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/cubit/dynamic_all_content_cubit.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/cubit/explore/explore_content_cubit.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/cubit/explore/explore_strips_cubit.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/standard/cubit/standard_strip_cubit.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/standard/strip_row_content.dart';
import 'package:open_learning_smart_tv/presentation/main/explore/explore_carousel.dart';
import 'package:open_learning_smart_tv/presentation/main/explore/object_details_view.dart';
import 'package:open_learning_smart_tv/presentation/main/main_state_cubit.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({required this.dynamicRoutes, super.key});

  final List<MenuRoute> dynamicRoutes;

  @override
  State<ExploreScreen> createState() => ExploreScreenState();
}

class ExploreScreenState extends State<ExploreScreen>
    with AutomaticKeepAliveClientMixin {
  final _focusNode = OlFocusScopeNode(id: 'Explore');
  final OrderedTraversalPolicy _policy = OrderedTraversalPolicy();

  final autoScrollController = AutoScrollController(
    viewportBoundaryGetter: () => const Rect.fromLTRB(0, 440, 0, 0),
    axis: Axis.vertical,
  );

  ValueNotifier<LearningObjectModel?> focusedObjectNotifier =
      ValueNotifier(null);

  ValueNotifier<List<String>> filtersNotifier = ValueNotifier([]);

  bool isScrolling = false;

  MenuRoute? currentMenuRoute;

  @override
  void initState() {
    super.initState();

    context.read<MainStateCubit>().exploreFocusNode = _focusNode;
    context.read<MainStateCubit>().exploreScreenState = this;

    currentMenuRoute = widget.dynamicRoutes.firstWhereOrNull(
      (element) => element.routeName == 'visExplore',
    );
  }

  void resetScroll() {
    //  scrollToPosition(0);

    context.read<MainStateCubit>().topicsFilterCubit?.refresh();
    Future.delayed(const Duration(milliseconds: 300), () {
      autoScrollController.animateTo(0,
          duration: Duration(milliseconds: 50), curve: Curves.linear);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      backgroundColor: OLColors.backgroundPrimary,
      body: BlocProvider(
        create: (context) => getIt<ExploreStripsCubit>(),
        child: CallbackShortcuts(
          bindings: <ShortcutActivator, VoidCallback>{
            const SingleActivator(LogicalKeyboardKey.arrowUp): () {
              if (isScrolling) {
                return;
              }

              _policy.previous(_focusNode);
            },
            const SingleActivator(LogicalKeyboardKey.arrowDown): () {
              if (isScrolling) {
                return;
              }
              _policy.next(_focusNode);
            },
          },
          child: FocusTraversalGroup(
            key: LabeledGlobalKey('FocusTraversalGroup - Main'),
            policy: _policy,
            child: FocusScope(
              node: _focusNode,
              onFocusChange: (value) {
                if (!value) {
                  focusedObjectNotifier.value = null;
                }
              },
              child: RefreshIndicator(
                color: ColorManager().getColorTextPrimaryCta(),
                backgroundColor:
                    ColorManager().getColorBackgroundPrimaryLighter(),
                onRefresh: () => context.read<DynamicAllContentCubit>().refresh(
                      currentMenuRoute?.apiPath ?? '',
                    ),
                child: BlocConsumer<ExploreContentCubit, ExploreContentState>(
                  listenWhen: (previous, current) => previous != current,
                  listener: (context, state) {
                    state.when(
                      success: (success, v, c, a, strios, d) {
                        context.read<MainStateCubit>().exploreStripsCubit =
                            context.read<ExploreStripsCubit>();

                        if (strios != null) {
                          context
                              .read<ExploreStripsCubit>()
                              .init(strips: strios);
                        }
                      },
                      loading: () {},
                      error: (e) {},
                    );
                  },
                  builder: (context, state) {
                    return state.map(
                      success: (success) {
                        return Stack(
                          children: [
                            CustomScrollView(
                              controller: autoScrollController,
                              slivers: [
                                if (success.exploreCarousel != null) ...[
                                  buildExploreBigCarousel(
                                    exploreCarousel: success.exploreCarousel,
                                  ),
                                ],
                                buildFilterRow(),
                                buildOtherStrips(strips: success.strips ?? []),
                              ],
                            ),
                            Positioned(
                              left: 0,
                              right: 0,
                              top: 0,
                              child:
                                  ValueListenableBuilder<LearningObjectModel?>(
                                valueListenable: focusedObjectNotifier,
                                builder: (context, value, _) {
                                  return AnimatedOpacity(
                                    duration: const Duration(milliseconds: 200),
                                    opacity: focusedObjectNotifier.value != null
                                        ? 1
                                        : 0,
                                    child: ObjectDetailsView(value: value),
                                  );
                                },
                              ),
                            )
                          ],
                        );
                      },
                      loading: (value) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      error: (value) => const SizedBox.shrink(),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildExploreBigCarousel({required StripRow? exploreCarousel}) {
    return BlocProvider(
      create: (context) =>
          getIt<StandardStripCubit>()..fetch(strip: exploreCarousel),
      child: BlocBuilder<StandardStripCubit, StandardStripState>(
        builder: (context, state) => state.map(
          success: (value) {
            context.read<MainStateCubit>().exploreBigCarouselCubit =
                context.read<StandardStripCubit>();

            return SliverToBoxAdapter(
              child: AutoScrollTag(
                key: const ValueKey(0),
                controller: autoScrollController,
                index: 0,
                child: itemBuilder(
                  r: {exploreCarousel!: value.items},
                  index: 0,
                ),
              ),
            );
          },
          loading: (value) {
            return SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: ExploreCarousel.shimmerLoader(),
              ),
            );
          },
          error: (_) => const SliverToBoxAdapter(child: SizedBox.shrink()),
        ),
      ),
    );
  }

  Widget buildFilterRow() {
    return SliverToBoxAdapter(
      child: AutoScrollTag(
        key: const ValueKey(1),
        controller: autoScrollController,
        index: 1,
        child: FocusTraversalOrder(
          order: const NumericFocusOrder(1),
          child: ValueListenableBuilder(
              valueListenable: filtersNotifier,
              builder: (context, filters, _) {
                return TopicsFilterList.navigation(
                  initialFilters: filters,
                  exposingCubit: (p0) {
                    context.read<MainStateCubit>().topicsFilterCubit = p0;
                  },
                  onFocusChanged: (p0) {
                    if (p0) {
                      focusedObjectNotifier.value = null;
                      scrollToPosition(1);
                    }
                  },
                  onTap: (value) {
                    if (value != null) {
                      final f = List<String>.from(filters);
                      if (f.contains(value.id.toString())) {
                        f.remove(value.id.toString());
                      } else {
                        f.add(value.id.toString());
                      }

                      context
                          .read<ExploreStripsCubit>()
                          .refreshStrips(filters: f);

                      filtersNotifier.value = List.from(f);
                    }
                  },
                );
              }),
        ),
      ),
    );
  }

  Widget buildOtherStrips({required List<StripRow> strips}) {
    if (strips.isEmpty) {
      return const SliverToBoxAdapter();
    }
    return BlocConsumer<ExploreStripsCubit, ExploreStripsState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (_, filters, refreshing) {},
          loading: () {},
          error: (f) {},
          orElse: () {},
        );
      },
      listenWhen: (previous, current) {
        return current.maybeWhen(
          success: (_, filters, refreshing) => true,
          orElse: () => false,
        );
      },
      builder: (context, state) => state.map(
        success: (success) {
          final items = List<Map<StripRow, List<LearningObjectModel>>>.from(
            success.rowItems ?? [],
          );

          items.removeWhere((element) => element.entries.firstOrNull == null);

          return _stripRows(
            source: items,
            filters: success.filters,
            refreshingStrips: success.refreshingStrips ?? false,
          );
        },
        loading: (value) => SliverToBoxAdapter(
          child: Column(
            children: [
              StripRowContent.shimmerLoader(),
              StripRowContent.shimmerLoader(),
            ],
          ),
        ),
        error: (value) => const SliverToBoxAdapter(),
      ),
    );
  }

  Widget _stripRows({
    required List<Map<StripRow, List<LearningObjectModel>>> source,
    List<String>? filters,
    required bool refreshingStrips,
  }) {
    int delta = 2; // 1 represents the topics row

    if (refreshingStrips) {
      return SliverToBoxAdapter(
        child: Column(
          children: [
            StripRowContent.shimmerLoader(),
            StripRowContent.shimmerLoader(),
          ],
        ),
      );
    }

    if (source.isEmpty) {
      return SliverToBoxAdapter(
        child: Container(
          height: 100,
          width: 600,
          padding: const EdgeInsets.symmetric(
              vertical: 30, horizontal: Dimens.hPadding),
          child: Text(
            LabelsManager().getRemoteStringFromLabelKeys(
              RemoteLabelKeys.no_results_for_filters,
            ),
            style: AppTextTheme.subtitle(
              weight: FontWeight.w500,
              color: ColorManager().getColorTextPrimary(),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 800),
      sliver: SliverList.builder(
        itemCount: source.length,
        itemBuilder: (context, index) {
          return AutoScrollTag(
            key: ValueKey(index + delta),
            controller: autoScrollController,
            index: index + delta,
            child: itemBuilder(
              r: source[index],
              index: index + delta,
            ),
          );
        },
      ),
    );
  }

  Widget itemBuilder({
    required Map<StripRow, List<LearningObjectModel>> r,
    required int index,
  }) {
    final row = r.entries.firstOrNull;

    if (row == null) {
      return const SizedBox.shrink();
    }

    if (row.key.labelMapping == 'sliderTopContentExplore') {
      return FocusTraversalOrder(
        order: NumericFocusOrder(index.toDouble()),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: ExploreCarousel(
            row: r,
            onFocusChange: (p0) {
              if (p0) {
                focusedObjectNotifier.value = null;
                scrollToPosition(index);
              }
            },
          ),
        ),
      );
    } else if (row.key.labelMapping == 'visCarTrainingTransversal') {
      return buildElementsRow(index: index, row: r);
    } else {
      return buildElementsRow(index: index, row: r);
    }
    /* if (row.key.labelMapping == 'visCarTrainingTransversal') {
      return buildElementsRow(index: index, row: r);
    } else if (row.key.labelMapping == 'carConteSpeciDurata') {
      return buildElementsRow(index: index, row: r);
    } else if (row.key.labelMapping == 'trainingMandatory') {
      return buildElementsRow(index: index, row: r);
    } else if (row.key.labelMapping == 'carConteSpeciDurata') {
      return buildElementsRow(index: index, row: r);
    } else if (row.key.labelMapping == 'widgetCalendar') {
      return const SizedBox.shrink();
      // return FocusTraversalOrder(
      //   order: NumericFocusOrder(index.toDouble()),
      //   child: CalendarStripRow(
      //     row,
      //     smartLearningEnabled:
      //         value.smartConfig?.smartLearning == true,
      //   ),
      // );
    } else if (row.key.labelMapping == 'widgetContinueLearning') {
      return const SizedBox.shrink();
      // return FocusTraversalOrder(
      //   order: NumericFocusOrder(index.toDouble()),
      //   child: ContinueLearningStripRow(strip: row),
      // );
    } else if (row.key.labelMapping == 'favourites') {
      return const SizedBox.shrink();
      // return FocusTraversalOrder(
      //   order: NumericFocusOrder(index.toDouble()),
      //   child: FavouritesStripRow(strip: row),
      // );
    } else if (row.key.labelMapping == 'visCarSuggested') {
      return buildElementsRow(index: index, row: r);
    } else if (row.key.labelMapping == 'carConteSpeciDurata') {
      return buildElementsRow(index: index, row: r);
    } else if (row.key.labelMapping == 'visCarBestRating') {
      return buildElementsRow(index: index, row: r);
    } else if (row.key.labelMapping == 'visCarCategory') {
      return buildElementsRow(index: index, row: r);
    } else if (row.key.labelMapping == 'visForyou') {
      return buildElementsRow(index: index, row: r);
    }
    return const SizedBox.shrink();
    */
  }

  Widget buildElementsRow({
    required Map<StripRow, List<LearningObjectModel>> row,
    required int index,
  }) {
    return StripRowContent(
      focusedObjectNotifier: focusedObjectNotifier,
      order: index,
      strip: row,
      onFocusChange: (p0) {
        if (p0) {
          scrollToPosition(index);
        }
      },
    );
  }

  Future<void> scrollToPosition(int index) async {
    await autoScrollController.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.begin,
    );
  }

  @override
  bool get wantKeepAlive => false;
}
