import 'package:flutter/material.dart';

import '../../../../../theme/app_theme.dart';

class InnerCalendarShimmer extends StatelessWidget {
  const InnerCalendarShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 80,
          height: 21,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: .2),
            borderRadius: BorderRadius.circular(Dimens.spacingXL),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: Dimens.spacingXL, bottom: Dimens.spacingXL),
          child: Row(
            children: List.generate(
              2,
              (index) => Expanded(
                child: Container(
                  height: 70,
                  padding: const EdgeInsets.only(left: Dimens.spacingS),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: AppColors.white.withValues(alpha: .2),
                        width: 2,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: .2),
                          borderRadius: BorderRadius.circular(Dimens.spacingXS),
                        ),
                      ),
                      const SizedBox(height: Dimens.spacingXXS),
                      Container(
                        width: 50,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: .2),
                          borderRadius: BorderRadius.circular(Dimens.spacingXS),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
