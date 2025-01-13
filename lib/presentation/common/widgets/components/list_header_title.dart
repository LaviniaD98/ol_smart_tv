import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';

class ListHeaderTitle extends StatelessWidget {
  const ListHeaderTitle({
    super.key,
    required this.title,
    this.searchTitle,
    this.subtitle,
    this.showGradient = true,
  });

  final String title;
  final String? searchTitle;
  final String? subtitle;
  final bool showGradient;

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
            decoration: showGradient
                ? BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.8, 1],
                      colors: [
                        OLColors.backgroundPrimary,
                        OLColors.backgroundPrimary.withOpacity(0),
                      ],
                    ),
                  )
                : null,
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
                  ] else if (subtitle != null &&
                      subtitle?.isNotEmpty == true) ...[
                    TextSpan(
                      text: ' - ',
                      style: AppTextTheme.body(
                        weight: FontWeight.w700,
                        size: 32,
                      ),
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Text(
                        subtitle ?? '',
                        style: AppTextTheme.body(
                          weight: FontWeight.w500,
                          size: 20,
                        ),
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
