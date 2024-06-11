import 'package:flutter/material.dart';

import '../../../../theme/app_theme.dart';
import '../tag/topic_tag.dart';

class TopicWrap extends StatelessWidget {
  final List<String> topics;
  final EdgeInsets? padding;
  final Color? color;
  final bool truncate;

  const TopicWrap(
    this.topics, {
    super.key,
    this.padding,
    this.color,
    this.truncate = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: topics.length >= 3 && truncate ? _adaptive : _linear,
    );
  }

  Widget get _adaptive {
    final topicsPreview = topics.sublist(0, 2).asMap().entries.map(
          (e) {
        return TopicTag(
          label: e.value,
          color: color,
          boxFit: BoxFit.fitWidth,
        );
      },
    ).toList()..add(TopicTag(
      label: '+${topics.length - 2}',
      color: color,
      boxFit: BoxFit.fitWidth,
    ));

    return Wrap(
      spacing: Dimens.spacingXXS,
      runSpacing: Dimens.spacingXXS,
      children: topicsPreview,
    );
  }

  Widget get _linear => Wrap(
    spacing: Dimens.spacingXXS,
    runSpacing: Dimens.spacingXXS,
    children: topics
        .asMap()
        .entries
        .map(
          (e) => TopicTag(
            label: e.value,
            color: color,
            boxFit: BoxFit.fitWidth,
          ),
    ).toList(),
  );
}
