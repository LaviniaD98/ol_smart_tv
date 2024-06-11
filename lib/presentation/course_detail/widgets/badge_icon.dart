import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/ol_alert_dialog.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:flutter_svg/svg.dart';

class BadgeIcon extends StatelessWidget {
  const BadgeIcon({
    super.key,
    required this.hasBadge,
    required this.isCompleted,
  });

  final bool hasBadge;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isCompleted && hasBadge
          ? () {
              OlAlertDialog.show(context,
                  title: LabelsManager()
                      .getRemoteStringFromLabelKeys(RemoteLabelKeys.info),
                  message: LabelsManager().getRemoteStringFromLabelKeys(
                      RemoteLabelKeys.badge_icon_available_message),
                  actionLabel: LabelsManager()
                      .getRemoteStringFromLabelKeys(RemoteLabelKeys.ok),
                  barrierDismissible: false);
            }
          : null,
      child: getBadgeIcon(hasBadge, isCompleted),
    );
  }

  Widget getBadgeIcon(bool hasBadge, bool isCompleted) {
    if (hasBadge && !isCompleted) {
      return SvgPicture.asset("assets/icons/detail/dettaglio_inizia.svg",
          colorFilter: ColorFilter.mode(
              ColorManager().getColorTextPrimary(), BlendMode.srcIn));
    } else if (hasBadge && isCompleted) {
      return SvgPicture.asset("assets/icons/detail/dettaglio_inizia.svg",
          colorFilter: ColorFilter.mode(
              ColorManager().getColorTextPrimaryCta(), BlendMode.srcIn));
    }
    return const SizedBox();
  }
}
