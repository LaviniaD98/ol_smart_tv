import 'package:flutter/material.dart';

import '../../../../../theme/app_theme.dart';

class ActivityItemAlert extends StatelessWidget {
  final String message;
  final Color color;

  const ActivityItemAlert({
    super.key,
    required this.message,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      constraints: const BoxConstraints(
        minHeight: Dimens.calendarActivityItem,
        maxHeight: Dimens.calendarActivityItem,
      ),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: color,
            width: 2,
          ),
        ),
      ),
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: Text(
        message,
        style: AppTextTheme.subtitle(
          color: color,
          weight: FontWeight.w400,
        ),
      ),
    );
  }
}
