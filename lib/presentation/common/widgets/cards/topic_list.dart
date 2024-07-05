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
    if (topics.isEmpty) {
      return const SizedBox.shrink();
    }

    return Wrap(
      runSpacing: 8,
      spacing: 8,
      children: [
        ...topics.map(
          (e) => TopicTag(
            label: e,
            color: color,
            margin: const EdgeInsets.only(right: Dimens.spacingXXS),
          ),
        ),
      ],
    );
  }
}
