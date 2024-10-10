import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/glow_progress_bar/glow_progress_bar.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';

class OlProgressBar extends StatelessWidget {
  const OlProgressBar({
    required this.percentage,
    required this.width,
    super.key,
  });

  final double percentage;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text:
                      '${LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.percentageOfCompletion)}:',
                  style: AppTextTheme.body(
                    weight: FontWeight.w500,
                    size: 14,
                    color: ColorManager().getColorTextPrimary(),
                  ),
                ),
                TextSpan(
                  text: ' ${percentage.toStringAsFixed(0)}%',
                  style: AppTextTheme.body(
                    color: ColorManager().getColorTextPrimary(),
                    weight: FontWeight.bold,
                    size: 14,
                  ),
                ),
              ],
            ),
          ),
          GlowProgressBar(percentage: percentage),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
