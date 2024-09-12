import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';

import '../../../domain/entities/progress/learner_progress.dart';
import '../../../domain/entities/progress/progress_time_model.dart';
import '../../../theme/app_theme.dart';
import '../../common/widgets/glow.dart';

class ProgressCard extends StatelessWidget {
  static const iconSize = 20.0;
  static const startAngleL = 90.0;
  static const endAngleL = -40.0;
  static const startAngleR = 90.0;
  static const endAngleR = 220.0;

  final LearnerProgressModel data;

  const ProgressCard({
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
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  LabelsManager().getRemoteStringFromLabelKeys(
                      RemoteLabelKeys.your_progress),
                  style: AppTextTheme.dialogTitle(
                    color: ColorManager().getColorTextPrimary(),
                  ),
                ),
              ),
              const SizedBox(height: Dimens.spacingXXS),
              Stack(
                alignment: Alignment.center,
                children: [
                  /// suggestedByHR
                  Container(
                    height: 208,
                    width: 208,
                    padding: const EdgeInsets.all(Dimens.spacingXS),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          _gauge(
                              data: data.suggestedByHR,
                              startAngle: startAngleL - Dimens.spacingXS,
                              endAngle: endAngleL),
                          Positioned(
                            left: 36,
                            bottom: 18,
                            child: _icon(
                                type: LearnerProgressType.suggestedByHR,
                                data: data.suggestedByHR),
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// suggestedByAI
                  Container(
                    height: 208,
                    width: 208,
                    padding: const EdgeInsets.all(Dimens.spacingXS),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          _gauge(
                              data: data.suggestedByAI,
                              startAngle: startAngleR + Dimens.spacingXS,
                              endAngle: endAngleR),
                          Positioned(
                            right: 36,
                            bottom: 18,
                            child: _icon(
                                type: LearnerProgressType.suggestedByAI,
                                data: data.suggestedByAI),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      /// mandatory
                      Container(
                        height: 153,
                        width: 153,
                        padding: const EdgeInsets.all(10),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              _gauge(
                                data: data.mandatory,
                                startAngle: startAngleL - Dimens.spacingS,
                                endAngle: endAngleL - 10,
                              ),
                              Positioned(
                                left: 36,
                                bottom: 2,
                                child: _icon(
                                    type: LearnerProgressType.mandatory,
                                    data: data.mandatory),
                              ),
                            ],
                          ),
                        ),
                      ),

                      /// suggestedByManager
                      Container(
                        height: 153,
                        width: 153,
                        padding: const EdgeInsets.all(10),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            _gauge(
                                data: data.suggestedByManager,
                                startAngle: startAngleR + Dimens.spacingS,
                                endAngle: endAngleR + 10),
                            Positioned(
                              right: 38,
                              bottom: 2,
                              child: _icon(
                                  type: LearnerProgressType.suggestedByManager,
                                  data: data.suggestedByManager),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${data.total?.completedHours2Digits()}/${data.total?.hours2Digits()}',
                        textAlign: TextAlign.center,
                        style: AppTextTheme.subtitle(
                          weight: FontWeight.bold,
                          size: 24,
                          color: ColorManager().getColorTextPrimary(),
                        ).copyWith(height: 1),
                      ),
                      Text(
                        LabelsManager().getRemoteStringFromLabelKeys(
                            RemoteLabelKeys.completed_progress),
                        textAlign: TextAlign.center,
                        style: AppTextTheme.caption(
                          color: ColorManager().getColorTextPrimary(),
                          size: 14,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _gauge({
    ProgressTimeModel? data,
    required double startAngle,
    required double endAngle,
  }) {
    double completedHours = 0.0;
    double hours = 100.0;

    if (data != null && data.completedHours != null && data.hours != null) {
      if (data.hours! > 0 && data.completedHours! <= data.hours!) {
        completedHours = data.completedHours ?? 0;
        hours = data.hours ?? 0;
      }
    }

    return RadialGauge(
      valueBar: [
        RadialValueBar(
          value: completedHours,
          color: ColorManager().getColorSystemSecondary02(),
        )
      ],
      track: RadialTrack(
        start: 0.0,
        end: hours,
        trackLabelFormater: (p0) => '',
        startAngle: startAngle,
        endAngle: endAngle,
        hideLabels: true,
        thickness: 9,
        color: ColorManager().getColorBackgroundDisabled(),
        trackStyle: const TrackStyle(
          showPrimaryRulers: false,
          showSecondaryRulers: false,
          showFirstLabel: false,
          showLabel: false,
          showLastLabel: false,
        ),
      ),
    );
  }

  Widget _icon({
    required LearnerProgressType type,
    required ProgressTimeModel? data,
  }) {
    final isCompleted = (data?.hours != null && data?.completedHours != null) &&
        (data!.hours != 0 && data.hours == data.completedHours);
    return SizedBox.square(
      dimension: iconSize,
      child: Glow(
        glow: isCompleted,
        child: SvgPicture.asset(
          type.asset,
          width: iconSize,
          height: iconSize,
          colorFilter: ColorFilter.mode(
            isCompleted
                ? ColorManager().getColorSystemSecondary02()
                : ColorManager().getColorSystemPrimary01(),
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}

enum LearnerProgressType {
  mandatory('assets/icons/mandatory.svg'),
  suggestedByManager('assets/icons/suggested_manager.svg'),
  suggestedByAI('assets/icons/suggested_ai.svg'),
  suggestedByHR('assets/icons/suggested_hr.svg');

  final String asset;

  const LearnerProgressType(this.asset);
}
