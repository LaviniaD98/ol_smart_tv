import 'package:flutter/material.dart';

import '../../../../theme/app_theme.dart';
import '../tag/topic_tag.dart';

class TopicList extends StatelessWidget {
  final List<String> topics;
  final EdgeInsets? padding;
  final Color? color;
  final Color? textColor;
  final int? topicsLimit;

  const TopicList(
    this.topics, {
    super.key,
    this.padding,
    this.color,
    this.textColor,
    this.topicsLimit,
  });

  @override
  Widget build(BuildContext context) {
    if (topics.isEmpty) {
      return const SizedBox.shrink();
    }

    final topicsFinal =
        topicsLimit != null ? topics.take(topicsLimit!) : topics;

    return Wrap(
      runSpacing: 8,
      spacing: 8,
      children: [
        ...topicsFinal.map(
          (e) => TopicTag(
            label: e,
            color: color,
            textColor: textColor,
            margin: const EdgeInsets.only(right: Dimens.spacingXXS),
          ),
        ),
      ],
    );
  }
}
