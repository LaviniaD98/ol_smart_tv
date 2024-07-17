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
import 'package:open_learning_smart_tv/presentation/common/widgets/error/error_screen.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/topics_filter/topics_filter_list.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/cubit/dynamic_all_content_cubit.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/standard/strip_row_content.dart';
import 'package:open_learning_smart_tv/presentation/main/explore/explore_carousel.dart';
import 'package:open_learning_smart_tv/presentation/main/explore/object_details_view.dart';
import 'package:open_learning_smart_tv/presentation/main/main_state_cubit.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({required this.dynamicRoutes, super.key});

  final List<MenuRoute> dynamicRoutes;

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with AutomaticKeepAliveClientMixin {
  final _focusNode = FocusScopeNode(debugLabel: 'Explore');
  final OrderedTraversalPolicy _policy = OrderedTraversalPolicy();

  final autoScrollController = AutoScrollController(
    viewportBoundaryGetter: () => const Rect.fromLTRB(0, 340, 0, 0),
    axis: Axis.vertical,
  );

  ValueNotifier<LearningObjectModel?> focusedObjectNotifier =
      ValueNotifier(null);

  bool isScrolling = false;

  MenuRoute? currentMenuRoute;

  @override
  void initState() {
    super.initState();

    context.read<MainStateCubit>().exploreFocusNode = _focusNode;

    currentMenuRoute = widget.dynamicRoutes.firstWhereOrNull(
      (element) => element.routeName == 'visExplore',
    );
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
        create: (_) => getIt<DynamicAllContentCubit>()
          ..init(currentMenuRoute?.apiPath ?? ''),
        child: RefreshIndicator(
          color: ColorManager().getColorTextPrimaryCta(),
          backgroundColor: ColorManager().getColorBackgroundPrimaryLighter(),
          onRefresh: () => context.read<DynamicAllContentCubit>().refresh(
                currentMenuRoute?.apiPath ?? '',
              ),

          /// Dynamic Strip
          child: BlocConsumer<DynamicAllContentCubit, DynamicAllContentState>(
            listener: (context, state) {
              state.maybeWhen(
                success: (_) {},
                loading: () {},
                error: (f) {},
                orElse: () {},
              );
            },
            listenWhen: (previous, current) {
              return current.maybeWhen(
                success: (_) => true,
                orElse: () => false,
              );
            },
            builder: (context, state) => state.map(
              success: (success) {
                // success.page.strips.insert(
                //   1,
                //   const StripRow.smartLearning(
                //     id: 0000001,
                //     apiPath: '',
                //     labelMapping: 'topicsFilter',
                //   ),
                // );

                return _stripRows(success);
              },
              loading: (value) => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (value) => ErrorScreen(
                title: LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.error,
                ),
                message: value.failure.error ??
                    LabelsManager().getRemoteStringFromLabelKeys(
                      RemoteLabelKeys.error_occurred,
                    ),
                onReload: () => context.read<DynamicAllContentCubit>().init(
                      currentMenuRoute?.apiPath ?? '',
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _stripRows(Success value) {
    final source = List<Map<StripRow, List<LearningObjectModel>>>.from(
        value.rowItems ?? []);
    source.removeWhere((element) => element.entries.firstOrNull == null);
    return CallbackShortcuts(
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
          child: Stack(
            children: [
              ListView.builder(
                controller: autoScrollController,
                itemCount: source.length,
                padding: const EdgeInsets.only(bottom: 800),
                itemBuilder: (context, index) {
                  return AutoScrollTag(
                    key: ValueKey(index),
                    controller: autoScrollController,
                    index: index,
                    child: itemBuilder(r: source[index], index: index),
                  );
                },
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: ValueListenableBuilder<LearningObjectModel?>(
                  valueListenable: focusedObjectNotifier,
                  builder: (context, value, _) {
                    return AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: focusedObjectNotifier.value != null ? 1 : 0,
                      child: ObjectDetailsView(value: value),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
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
    } else if (row.key.labelMapping == 'topicsFilter') {
      return FocusTraversalOrder(
        order: NumericFocusOrder(index.toDouble()),
        child: Padding(
          padding: const EdgeInsets.only(top: 58.0, bottom: 28),
          child: TopicsFilterList.navigation(onTap: (value) {}),
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
  bool get wantKeepAlive => true;
}
