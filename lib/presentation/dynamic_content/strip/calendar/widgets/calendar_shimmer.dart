import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../theme/app_theme.dart';
import 'inner_calendar_shimmer.dart';

class CalendarShimmer extends StatelessWidget {
  const CalendarShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.white.withOpacity(.09),
      highlightColor: AppColors.primaryFaded,
      period: const Duration(seconds: 2),
      child: Container(
        margin: const EdgeInsets.all(Dimens.spacingL),
        padding: const EdgeInsets.all(Dimens.spacingM),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.3),
          borderRadius: BorderRadius.circular(Dimens.radius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: Dimens.spacingXXL),
              child: Row(
                children: List.generate(
                  7,
                      (index) => Expanded(
                    child: Container(
                      height: 60,
                      margin: const EdgeInsets.symmetric(
                          horizontal: Dimens.spacingXS),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.2),
                          borderRadius: BorderRadius.circular(Dimens.spacingXS)),
                    ),
                  ),
                ),
              ),
            ),
            const Divider(height: Dimens.spacingXXXL, color: AppColors.grey),
            const InnerCalendarShimmer(),
          ],
        ),
      ),
    );
  }
}
