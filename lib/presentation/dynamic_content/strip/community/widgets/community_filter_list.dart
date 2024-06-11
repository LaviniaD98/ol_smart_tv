import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/domain/entities/community/community_topic_model.dart';
import 'package:flutter/material.dart';

import '../../../../../remote_theming/labels/labels_manager.dart';
import '../../../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../../../theme/app_theme.dart';
import 'community_filter_item.dart';

class CommunityFilterList extends StatelessWidget {
  final List<CommunityTopicModel> topics;
  final List<String>? initialFilters;
  final OnTapReload? onReload;

  const CommunityFilterList({
    super.key,
    this.initialFilters,
    required this.topics,
    required this.onReload,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 100),
      child: topics.isNotEmpty
          ? _TopicsFilterReload(
              key: const ValueKey('_TopicsFilterReload'),
              initialFilters: initialFilters,
              topics: topics,
              onTapReload: onReload!,
            )
          : const SizedBox.shrink(),
    );
  }
}

/// Reload Parent
class _TopicsFilterReload extends StatefulWidget {
  final List<CommunityTopicModel> topics;
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
          height: 26,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            separatorBuilder: (context, index) =>
                const SizedBox(width: Dimens.spacingXXS),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final tag = widget.topics[index];
              final isSelected = filters.contains(tag.code);
              return CommunityFilterItem(
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      filters.remove(tag.code.toString());
                    } else {
                      filters.add(tag.code.toString());
                    }
                    widget.onTapReload(filters);
                  });
                },
                isSelected: isSelected || (tag.filtered == true),
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

typedef OnTapReload = Function(List<String>);
