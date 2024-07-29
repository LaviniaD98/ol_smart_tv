import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';

class ListHeaderTitle extends StatelessWidget {
  const ListHeaderTitle({
    super.key,
    required this.title,
    this.searchTitle,
  });

  final String title;
  final String? searchTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(
              top: 60,
              bottom: 50,
              left: Dimens.hViewPadding,
              right: Dimens.hViewPadding,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.8, 1],
                colors: [
                  OLColors.backgroundPrimary,
                  OLColors.backgroundPrimary.withOpacity(0),
                ],
              ),
            ),
            child: RichText(
              text: TextSpan(
                style: AppTextTheme.body(
                  weight: FontWeight.w700,
                  size: 32,
                  color: ColorManager().getColorTextPrimary(),
                ),
                children: [
                  /// Type Label
                  TextSpan(text: title),
                  if (searchTitle != null &&
                      searchTitle?.isNotEmpty == true) ...[
                    const TextSpan(text: ': '),
                    TextSpan(
                      text: searchTitle,
                      style: AppTextTheme.body(
                        color: OLColors.accentVariantA,
                        weight: FontWeight.w700,
                        size: 32,
                      ),
                    ),
                  ],
                ],
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
