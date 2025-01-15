import 'package:flutter/services.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';
import 'package:open_learning_smart_tv/presentation/main/main_state_cubit.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/dependency_injection/dependency_injection.dart';
import '../../../../domain/entities/topics/topic_model.dart';
import '../../../../remote_theming/labels/labels_manager.dart';
import '../../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../../theme/app_theme.dart';
import 'cubit/topics_filter_cubit.dart';
import 'widgets/topic_filter_item.dart';

class TopicsFilterList extends StatefulWidget {
  static const _padding = EdgeInsets.symmetric(horizontal: 20);

  final TopicsFilterListType type;
  final List<String>? initialFilters;
  final OnTapReload? onReload;
  final OnTapNavigation? onTap;
  final void Function(bool)? onFocusChanged;

  const TopicsFilterList._({
    super.key,
    this.initialFilters,
    required this.type,
    this.onReload,
    this.onTap,
    this.onFocusChanged,
  });

  factory TopicsFilterList.reload({
    Key? key,
    List<String>? initialFilters,
    required OnTapReload onTapReload,
    void Function(bool)? onFocusChanged,
  }) {
    return TopicsFilterList._(
      key: key,
      initialFilters: initialFilters,
      type: TopicsFilterListType.reload,
      onReload: onTapReload,
      onFocusChanged: onFocusChanged,
    );
  }

  factory TopicsFilterList.navigation({
    Key? key,
    required OnTapNavigation onTap,
    void Function(bool)? onFocusChanged,
    List<String>? initialFilters,
  }) {
    return TopicsFilterList._(
      key: key,
      type: TopicsFilterListType.navigation,
      onTap: onTap,
      onFocusChanged: onFocusChanged,
      initialFilters: initialFilters,
    );
  }

  @override
  State<TopicsFilterList> createState() => _TopicsFilterListState();
}

class _TopicsFilterListState extends State<TopicsFilterList> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TopicsFilterCubit>()..init(),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 100),
        child: BlocBuilder<TopicsFilterCubit, TopicsFilterState>(
          builder: (context, state) => state.maybeWhen(
            loading: () => _shimmerLoader,
            success: (topics) {
              if (topics.isNotEmpty) {
                return switch (widget.type) {
                  TopicsFilterListType.navigation => _TopicsFilterNavigation(
                      key: const ValueKey('_TopicsFilterNavigation'),
                      topics: topics,
                      selectedTopicIds: widget.initialFilters ?? [],
                      onTap: widget.onTap!,
                      onFocusChanged: widget.onFocusChanged,
                    ),
                  TopicsFilterListType.reload => _TopicsFilterReload(
                      key: const ValueKey('_TopicsFilterReload'),
                      initialFilters: widget.initialFilters,
                      topics: topics,
                      onTapReload: widget.onReload!,
                    ),
                };
              } else {
                return const SizedBox.shrink();
              }
            },
            orElse: () => const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }

  Widget get _shimmerLoader {
    return Shimmer.fromColors(
      baseColor: AppColors.white.withValues(alpha: .09),
      highlightColor: AppColors.primaryFaded,
      period: const Duration(seconds: 2),
      child: Container(
        height: 120,
        margin: const EdgeInsets.only(
          bottom: 30 + Dimens.spacingM,
          top: 58.0,
        ),
        child: SizedBox(
          height: Dimens.learningCardHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: TopicsFilterList._padding,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) =>
                const SizedBox(width: Dimens.spacingM),
            itemCount: 20,
            itemBuilder: (context, index) {
              return const TopicFilterItemShimmer();
            },
          ),
        ),
      ),
    );
  }
}

/// Reload Parent
class _TopicsFilterReload extends StatefulWidget {
  final List<TopicModel> topics;
  final List<String>? initialFilters;
  final OnTapReload onTapReload;

  const _TopicsFilterReload({
    super.key,
    this.initialFilters,
    required this.onTapReload,
    required this.topics,
  });

  @override
  State<_TopicsFilterReload> createState() => _TopicsFilterReloadState();
}

class _TopicsFilterReloadState extends State<_TopicsFilterReload> {
  late List<String> filters;

  @override
  void initState() {
    filters = widget.initialFilters ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      key: widget.key,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 60,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            separatorBuilder: (context, index) =>
                const SizedBox(width: Dimens.spacingM),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final tag = widget.topics[index];
              final isSelected = filters.contains(tag.id.toString());
              return TopicFilterItem(
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      filters.remove(tag.id.toString());
                    } else {
                      filters.add(tag.id.toString());
                    }
                    widget.onTapReload(filters);
                  });
                },
                path: tag.url?.publicUrl,
                isSelected: isSelected,
                label: tag.name,
              );
            },
            itemCount: widget.topics.length,
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          height: 30,
          margin: const EdgeInsets.symmetric(horizontal: Dimens.spacingL),
          child: filters.isNotEmpty
              ? InkWell(
                  onTap: () {
                    setState(() {
                      filters.clear();
                      widget.onTapReload(filters);
                    });
                  },
                  child: Text(
                    LabelsManager()
                        .getRemoteStringFromLabelKeys(RemoteLabelKeys.deselect)
                        .replaceFirst('{{count}}', '${filters.length}'),
                    style: AppTextTheme.caption(
                      weight: FontWeight.w500,
                      color: ColorManager().getColorTextPrimaryCta(),
                    ),
                  ),
                )
              : const SizedBox(height: Dimens.spacingM),
        ),
      ],
    );
  }
}

/// Navigation
class _TopicsFilterNavigation extends StatefulWidget {
  final OnTapNavigation onTap;
  final List<TopicModel> topics;
  final List<String> selectedTopicIds;
  final void Function(bool)? onFocusChanged;

  const _TopicsFilterNavigation({
    super.key,
    required this.onTap,
    required this.topics,
    required this.selectedTopicIds,
    this.onFocusChanged,
  });

  @override
  State<_TopicsFilterNavigation> createState() =>
      _TopicsFilterNavigationState();
}

class _TopicsFilterNavigationState extends State<_TopicsFilterNavigation> {
  late OlFocusScopeNode focusNode;

  final autoScrollController = AutoScrollController(
    viewportBoundaryGetter: () =>
        const Rect.fromLTRB(Dimens.hViewPadding + 200, 0, 0, 0),
    axis: Axis.horizontal,
  );
  int currentFocusIndex = 0;

  final OrderedTraversalPolicy _policy = OrderedTraversalPolicy();

  @override
  void initState() {
    super.initState();
    focusNode = OlFocusScopeNode(id: '_TopicsFilterNavigation');
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          if (currentFocusIndex < widget.topics.length - 1) {
            _policy.next(focusNode);
          }
        },
      },
      child: FocusScope(
        node: focusNode,
        onFocusChange: widget.onFocusChanged,
        child: Padding(
          key: widget.key,
          padding: const EdgeInsets.only(
            bottom: 30 + Dimens.spacingM,
            top: 58.0,
          ),
          child: SizedBox(
            height: 120,
            child: ListView.separated(
              controller: autoScrollController,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              separatorBuilder: (context, index) =>
                  const SizedBox(width: Dimens.spacingM),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final topic = widget.topics[index];
                return AutoScrollTag(
                  key: ValueKey(index),
                  controller: autoScrollController,
                  index: index,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 56),
                    child: TopicFilterItem(
                      onTap: () => widget.onTap(topic),
                      onFocusChange: (p0) {
                        if (p0) {
                          scrollToPosition(index);
                        }
                      },
                      path: topic.url?.publicUrl,
                      isSelected: widget.selectedTopicIds
                          .any((e) => e == topic.id.toString()),
                      label: topic.name,
                    ),
                  ),
                );
              },
              itemCount: widget.topics.length,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> scrollToPosition(int index) async {
    currentFocusIndex = index;
    await autoScrollController.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.begin,
    );
  }
}

typedef OnTapReload = Function(List<String>);
typedef OnTapNavigation = Function(TopicModel?);

enum TopicsFilterListType { navigation, reload }
