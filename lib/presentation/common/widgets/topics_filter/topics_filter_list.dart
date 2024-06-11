import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/dependency_injection/dependency_injection.dart';
import '../../../../domain/entities/topics/topic_model.dart';
import '../../../../remote_theming/labels/labels_manager.dart';
import '../../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../../theme/app_theme.dart';
import 'cubit/topics_filter_cubit.dart';
import 'widgets/topic_filter_item.dart';

class TopicsFilterList extends StatelessWidget {
  static const _padding = EdgeInsets.symmetric(horizontal: 20);

  final TopicsFilterListType type;
  final List<String>? initialFilters;
  final OnTapReload? onReload;
  final OnTapNavigation? onTap;

  const TopicsFilterList._({
    super.key,
    this.initialFilters,
    required this.type,
    this.onReload,
    this.onTap,
  });

  factory TopicsFilterList.reload({
    Key? key,
    List<String>? initialFilters,
    required OnTapReload onTapReload,
  }) {
    return TopicsFilterList._(
      key: key,
      initialFilters: initialFilters,
      type: TopicsFilterListType.reload,
      onReload: onTapReload,
    );
  }

  factory TopicsFilterList.navigation({
    Key? key,
    required OnTapNavigation onTap,
  }) {
    return TopicsFilterList._(
      key: key,
      type: TopicsFilterListType.navigation,
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TopicsFilterCubit>()..init(),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 100),
        child: BlocBuilder<TopicsFilterCubit, TopicsFilterState>(
          builder: (context, state) => state.maybeWhen(
            loading: () => _shimmerLoader,
            success: (topics) => topics.isNotEmpty
                ? switch (type) {
                    TopicsFilterListType.navigation => _TopicsFilterNavigation(
                        key: const ValueKey('_TopicsFilterNavigation'),
                        topics: topics,
                        onTap: onTap!,
                      ),
                    TopicsFilterListType.reload => _TopicsFilterReload(
                        key: const ValueKey('_TopicsFilterReload'),
                        initialFilters: initialFilters,
                        topics: topics,
                        onTapReload: onReload!,
                      ),
                  }
                : const SizedBox.shrink(),
            orElse: () => const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }

  Widget get _shimmerLoader {
    return Shimmer.fromColors(
      baseColor: AppColors.white.withOpacity(.09),
      highlightColor: AppColors.primaryFaded,
      period: const Duration(seconds: 2),
      child: Container(
        height: 60,
        margin: const EdgeInsets.only(bottom: 16.0),
        child: SizedBox(
          height: Dimens.learningCardHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: _padding,
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
class _TopicsFilterNavigation extends StatelessWidget {
  final OnTapNavigation onTap;
  final List<TopicModel> topics;

  const _TopicsFilterNavigation(
      {super.key, required this.onTap, required this.topics});

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: key,
      padding: const EdgeInsets.only(bottom: 30 + Dimens.spacingM),
      child: SizedBox(
        height: 60,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          separatorBuilder: (context, index) =>
              const SizedBox(width: Dimens.spacingM),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return TopicFilterItem(
              onTap: () => onTap(topics[index].id),
              path: topics[index].url?.publicUrl,
              isSelected: false,
              label: topics[index].name,
            );
          },
          itemCount: topics.length,
        ),
      ),
    );
  }
}

typedef OnTapReload = Function(List<String>);
typedef OnTapNavigation = Function(int?);

enum TopicsFilterListType { navigation, reload }
