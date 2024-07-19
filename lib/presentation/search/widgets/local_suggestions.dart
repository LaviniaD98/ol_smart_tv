import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../color_management/color_manager.dart';
import '../../../theme/app_theme.dart';

class LocalSuggestions extends StatelessWidget {
  final List<String> suggestions;
  final VoidCallback onDelete;
  final Function(String) onTap;

  const LocalSuggestions(
    this.suggestions, {
    super.key,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: Dimens.spacingXXS),
      physics: const ClampingScrollPhysics(),
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final item = InkWell(
          onTap: () => onTap(suggestions[index]),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimens.spacingL,
              vertical: Dimens.spacingM,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.grey.withOpacity(.2),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/time.svg",
                  width: 24.0,
                  colorFilter: ColorFilter.mode(
                    ColorManager().getColorTextPrimary(),
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    suggestions[index],
                    style: AppTextTheme.subtitle(
                      color: ColorManager().getColorTextPrimary(),
                      weight: FontWeight.w500,
                      size: 22,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
        if (index == 0 && suggestions.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.spacingL,
                  vertical: Dimens.spacingM,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.grey.withOpacity(.2),
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        LabelsManager().getRemoteStringFromLabelKeys(
                            RemoteLabelKeys.latest_research),
                        style: AppTextTheme.caption(
                          color: ColorManager().getColorTextPrimary(),
                          weight: FontWeight.w500,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              item,
            ],
          );
        }
        return item;
      },
    );
  }
}
