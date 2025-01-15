import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/domain/entities/progress/learner_goals.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_glow/flutter_glow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'package:intl/intl.dart';
import 'package:open_learning_smart_tv/theme/glow/widget/glow_container.dart';

import '../../../color_management/color_manager.dart';
import '../../../data/models/responses/progress/progress_dto.dart';
import '../../../domain/entities/progress/completed_time_model.dart';
import '../../../domain/entities/progress/goal_model.dart';
import '../../../theme/app_theme.dart';

class GoalsCard extends StatelessWidget {
  final LearnerGoalsModel data;

  const GoalsCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: AppTheme.greyGradient,
        borderRadius: BorderRadius.circular(Dimens.radius),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              LabelsManager()
                  .getRemoteStringFromLabelKeys(RemoteLabelKeys.your_goal),
              style: AppTextTheme.dialogTitle(
                color: ColorManager().getColorTextPrimary(),
              ),
            ),
          ),
          const SizedBox(height: Dimens.spacingM),
          RichText(
            text: TextSpan(
                text: (data.goal?.plan ?? "").capitalize,
                style: AppTextTheme.dialogTitle(
                    size: 14, color: ColorManager().getColorAccentVariantB()),
                children: [
                  TextSpan(
                    text:
                        " - ${LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.hours_month)}"
                            .replaceFirst(
                                '{{count}}', '${data.goal?.hoursPerMonth}'),
                    style: AppTextTheme.body(
                        size: 14, color: ColorManager().getColorTextPrimary()),
                  )
                ]),
          ),
          const SizedBox(height: Dimens.spacingL),
          _chart(
            data.progress?.completedTime,
            data.goal,
            (data.progress?.summary == GoalSummary.goalNotAchieved),
          ),
          const SizedBox(height: 12),
          _trendLabel(data.progress?.summary),
          const SizedBox(height: 16),
          GlowContainer(
            shape: BoxShape.rectangle,
            blurRadius: 8,
            spreadRadius: 1,
            glowColor: OLColors.accentVariantB.withValues(alpha: 0.5),
            color: ColorManager().getColorGradient01End(),
            border: Border.all(
              color: OLColors.accentVariantB,
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            borderRadius: BorderRadius.circular(5),
            child: Row(
              children: [
                Text(
                  LabelsManager().getRemoteStringFromLabelKeys(
                      RemoteLabelKeys.time_progress),
                  style: AppTextTheme.dialogTitle(
                    size: 14,
                    color: ColorManager().getColorTextPrimary(),
                  ),
                ),
                const Spacer(),
                RichText(
                  text: TextSpan(
                    text: '${data.progress?.passedDays}',
                    style: AppTextTheme.dialogTitle(
                        size: 18, color: ColorManager().getColorTextPrimary()),
                    children: [
                      TextSpan(
                        text:
                            ' / ${LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.day_other)}'
                                .replaceFirst('{{count}}',
                                    '${data.goal?.durationInDays}'),
                        style: AppTextTheme.body(size: 12),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _chart(CompletedTimeModel? progress, GoalModel? goal, bool disabled) {
    final int progressMinutes =
        (progress?.hours ?? 0) * 60 + (progress?.minutes ?? 0);
    final int goalMinutes = (goal?.totalHours ?? 0) * 60;
    final percentProgress =
        NumberFormat("###").format(progressMinutes * 100 / goalMinutes);

    String progressLabel = '';
    if (progress?.hours != null && progress?.hours != 0) {
      progressLabel += '${progress?.hours ?? 0}h';
    }
    if (progress?.minutes != null && progress?.minutes != 0) {
      progressLabel += ' ${progress?.minutes ?? 0}m';
    }

    return SizedBox(
      height: 150,
      width: 150,
      child: Tooltip(
        decoration: BoxDecoration(
          gradient: AppTheme.greyGradient,
          borderRadius: BorderRadius.circular(Dimens.radius),
          border: Border.all(
            color: ColorManager().getColorBorderTag(),
          ),
        ),
        message: progressLabel.trim(),
        textStyle:
            AppTextTheme.caption(color: ColorManager().getColorTextPrimary()),
        triggerMode: TooltipTriggerMode.tap,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox.square(
              dimension: 150,
              child: RadialGauge(
                  radiusFactor: 1.1,
                  valueBar: [
                    RadialValueBar(
                      value: progressMinutes.toDouble(),
                      color: (disabled)
                          ? ColorManager().getColorSystemDisabled()
                          : ColorManager().getColorSystemSecondary02(),
                    )
                  ],
                  track: RadialTrack(
                      start: 0,
                      end: goalMinutes.toDouble(),
                      startAngle: 90,
                      endAngle: 450,
                      hideLabels: true,
                      color: ColorManager().getColorBackgroundDisabled(),
                      trackStyle: const TrackStyle(
                        showPrimaryRulers: false,
                        showSecondaryRulers: false,
                        showFirstLabel: false,
                        showLabel: false,
                        showLastLabel: false,
                      ))),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$percentProgress%',
                  style: AppTextTheme.title(
                    color: ColorManager().getColorTextPrimary(),
                    size: 32,
                  ).copyWith(height: 1),
                ),
                Text(
                  LabelsManager().getRemoteStringFromLabelKeys(
                      RemoteLabelKeys.completed_progress),
                  style: AppTextTheme.body(
                    color: ColorManager().getColorTextPrimary(),
                    size: 14,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _trendLabel(GoalSummary? summary) {
    if (summary == null || summary == GoalSummary.unknown) {
      return const SizedBox();
    }

    final String iconAsset;
    final Color iconColor;
    final String label;

    switch (summary) {
      case GoalSummary.almostThere:
        iconAsset = 'assets/icons/person_running.svg';
        iconColor = ColorManager().getColorBackgroundWarning();
        label = LabelsManager()
            .getRemoteStringFromLabelKeys(RemoteLabelKeys.goals_almost_there);
        break;
      case GoalSummary.goalAchieved:
        iconAsset = 'assets/icons/checkbox_tick.svg';
        iconColor = ColorManager().getColorBackgroundSecondaryComplete();
        label = LabelsManager()
            .getRemoteStringFromLabelKeys(RemoteLabelKeys.goals_goal_achieved);
        break;
      case GoalSummary.goalNotAchieved:
        iconAsset = 'assets/icons/mandatory.svg';
        iconColor = ColorManager().getColorBackgroundWarning();
        label = LabelsManager().getRemoteStringFromLabelKeys(
            RemoteLabelKeys.goals_goal_not_achieved);
        break;
      case GoalSummary.onLine:
        iconAsset = 'assets/icons/checkbox_tick.svg';
        iconColor = ColorManager().getColorBackgroundSecondaryComplete();
        label = LabelsManager().getRemoteStringFromLabelKeys(
            RemoteLabelKeys.congratulations_keep_going);
        break;
      case GoalSummary.underLine:
        iconAsset = 'assets/icons/person_walking.svg';
        iconColor = ColorManager().getColorBackgroundWarning();
        label = LabelsManager()
            .getRemoteStringFromLabelKeys(RemoteLabelKeys.goals_under_line);
        break;
      case GoalSummary.unknown:
        iconAsset = 'assets/icons/check.svg';
        iconColor = ColorManager().getColorSystemSecondary02();
        label = '';
        break;
    }

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SvgPicture.asset(
        iconAsset,
        height: 24,
        width: 24,
        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
      ),
      const SizedBox(
        width: Dimens.spacingXS,
      ),
      Text(
        label,
        style: AppTextTheme.caption(
          color: (summary == GoalSummary.goalNotAchieved)
              ? ColorManager().getColorTextWarning()
              : ColorManager().getColorTextPrimary(),
        ),
      )
    ]);
  }
}
