import 'package:flutter/material.dart';

import '../../../../theme/app_theme.dart';
import '../tag/topic_tag.dart';

class TopicList extends StatelessWidget {
  final List<String> topics;
  final EdgeInsets? padding;
  final Color? color;

  const TopicList(
    this.topics, {
    super.key,
    this.padding,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(top: 8.0),
      child: topics.length >= 3 ? _adaptive : _linear,
    );
  }

  Widget get _adaptive => Row(
      children: [
        Expanded(
          flex: 4,
          child: Row(
            children: topics
                .sublist(0, 2)
                .asMap()
                .entries
                .map(
                  (e) => Expanded(
                child: TopicTag(
                  label: e.value,
                  color: color,
                  margin: e.key == 0
                      ? EdgeInsets.zero
                      : const EdgeInsets.only(left: Dimens.spacingXXS),
                ),
              ),
            )
                .toList(),
          ),
        ),
        Expanded(
          flex: 1,
          child: TopicTag(
            label: '+${topics.length - 2}',
            color: color,
            margin: const EdgeInsets.only(left: Dimens.spacingXXS),
          ),
        ),
      ],
    );
  Widget get _linear => Row(
    children: topics
        .asMap()
        .entries
        .map(
          (e) => Expanded(
        child: TopicTag(
          label: e.value,
          color: color,
          margin: e.key == 0
              ? EdgeInsets.zero
              : const EdgeInsets.only(left: Dimens.spacingXXS),
        ),
      ),
    ).toList(),
  );
}
