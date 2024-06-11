import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/tag/status_tag.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/widgets/badge_icon.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../color_management/color_manager.dart';
import '../../../remote_theming/labels/labels_manager.dart';
import '../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../theme/app_theme.dart';
import 'glow_progress_bar/glow_progress_bar.dart';
import 'icon_text.dart';

class CardModulo extends StatelessWidget {
  final int index;
  final String tipoText;
  final double progressPercentage;
  final String titolo;
  final String descrizione;
  final String imageUrl;
  final String buttonTitle;
  final Function(int) onButtonPressed;
  final Function(int) onDownloadPressed;
  final int? durataMinuti;
  final int? numAttivita;
  final int? numRisorse;
  final bool isEnabled;
  final bool hasBadge;
  final bool isCompleted;
  final String? status;

  const CardModulo(
      {super.key,
      required this.index,
      required this.tipoText,
      required this.progressPercentage,
      required this.titolo,
      required this.descrizione,
      required this.imageUrl,
      required this.buttonTitle,
      required this.onButtonPressed,
      required this.onDownloadPressed,
      this.durataMinuti,
      this.numAttivita,
      this.numRisorse,
      this.isEnabled = true,
      this.hasBadge = false,
      this.isCompleted = false,
      this.status = ""});

  String convertMinutesToHours(int duration) {
    final int days = duration ~/ 1440;
    final String? daysLabel = switch (days) {
      0 => null,
      1 => LabelsManager()
          .getRemoteStringFromLabelKeys(RemoteLabelKeys.day_one)
          .replaceFirst('{{count}}', '$days'),
      _ => LabelsManager()
          .getRemoteStringFromLabelKeys(RemoteLabelKeys.day_other)
          .replaceFirst('{{count}}', '$days'),
    };

    final int hours = (duration - days * 1440) ~/ 60;
    final String? hoursLabel = switch (hours) {
      0 => null,
      1 => LabelsManager()
          .getRemoteStringFromLabelKeys(RemoteLabelKeys.count_hour)
          .replaceFirst('{{count}}', '$hours'),
      _ => LabelsManager()
          .getRemoteStringFromLabelKeys(RemoteLabelKeys.count_hours)
          .replaceFirst('{{count}}', '$hours'),
    };

    final int minutes = (duration - days * 1440 - hours * 60);
    final String? minutesLabel = switch (minutes) {
      0 => null,
      1 => LabelsManager()
          .getRemoteStringFromLabelKeys(RemoteLabelKeys.minutes_one)
          .replaceFirst('{{count}}', '$minutes'),
      _ => LabelsManager()
          .getRemoteStringFromLabelKeys(RemoteLabelKeys.minutes_other)
          .replaceFirst('{{count}}', '$minutes'),
    };

    return [
      if (daysLabel != null) daysLabel,
      if (hoursLabel != null) hoursLabel,
      if (minutesLabel != null) minutesLabel,
    ].join(' ');
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    const double hPadding = 20;
    const double vPadding = 16;

    return Material(
        type: MaterialType.transparency,
        child: Container(
            color: ColorManager().getColorBackgroundPrimaryLighter(),
            child: Container(
                color: ColorManager().getColorBackgroundPrimaryLighter(),
                margin: const EdgeInsets.only(
                    left: 0, right: hPadding, top: 16, bottom: vPadding),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // tipo, titolo e icona download
                    Padding(
                        padding: const EdgeInsets.only(left: hPadding),
                        child: AutoSizeText(
                          tipoText,
                          minFontSize: 10,
                          maxFontSize: 12,
                          style: TextStyle(
                              color: ColorManager().getColorTextMandatory(),
                              fontWeight: FontWeight.bold),
                        )),
                    Padding(
                        padding: const EdgeInsets.only(left: hPadding),
                        child: AutoSizeText(titolo,
                            minFontSize: 14,
                            maxFontSize: 16,
                            style: TextStyle(
                                color: ColorManager().getColorTextPrimary(),
                                fontWeight: FontWeight.bold))),
                    const SizedBox(
                      height: 8,
                    ),
                    // Immagine e testi risorse e attività
                    Row(
                      children: [
                        Stack(children: [
                          Padding(
                              padding: const EdgeInsets.only(left: hPadding),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                    minWidth:
                                        (size.width - 2 * hPadding - 2 * 16) /
                                            2,
                                    maxWidth:
                                        (size.width - 2 * hPadding - 16) / 2),
                                child: AspectRatio(
                                  aspectRatio:
                                      156 / 117, // Figma image Aspect Ratio
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(Dimens.radius),
                                    child: imageUrl.isNotEmpty
                                        ? CachedNetworkImage(
                                            imageUrl: imageUrl,
                                            fit: BoxFit.cover,
                                            height: double.infinity,
                                            errorWidget:
                                                (context, url, error) =>
                                                    Container(
                                                        color: AppColors.white
                                                            .withOpacity(.05)),
                                          )
                                        : Container(
                                            color: AppColors.white
                                                .withOpacity(.05)),
                                  ),
                                ),
                              )),
                          if (status == 'C')
                            Positioned(
                              top: 8,
                              left: 10,
                              child: StatusTag.svg(
                                backgroundColor:
                                    ColorManager().getColorSystemSecondary02(),
                                svgPath: IconStatus.completed.svgPath ?? '',
                              ),
                            ),
                        ]),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                            child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            durataMinuti != null && durataMinuti != 0
                                ? IconText(
                                    bkColor:
                                        ColorManager().getColorTextPrimary(),
                                    text: convertMinutesToHours(
                                        durataMinuti ?? 0),
                                    textColor:
                                        ColorManager().getColorTextPrimary(),
                                    icon: Icons.watch_later_outlined,
                                    iconSize: 16,
                                  )
                                : const SizedBox.shrink(),
                            const SizedBox(height: 16),
                            numAttivita != null && numAttivita != 0
                                ? IconText(
                                    bkColor:
                                        ColorManager().getColorTextPrimary(),
                                    text: LabelsManager()
                                        .getRemoteStringFromLabelKeys(
                                            RemoteLabelKeys.activity_other)
                                        .replaceFirst('{{count}}',
                                            numAttivita.toString()),
                                    textColor:
                                        ColorManager().getColorTextPrimary(),
                                    icon: Icons.account_tree_outlined,
                                    iconSize: 16,
                                  )
                                : const SizedBox.shrink(),
                            const SizedBox(height: vPadding),
                            numRisorse != null && numRisorse != 0
                                ? IconText(
                                    bkColor:
                                        ColorManager().getColorTextPrimary(),
                                    text: LabelsManager()
                                        .getRemoteStringFromLabelKeys(
                                            RemoteLabelKeys.resource_other)
                                        .replaceFirst(
                                            '{{count}}', numRisorse.toString()),
                                    textColor:
                                        ColorManager().getColorTextPrimary(),
                                    icon: Icons.folder_copy_outlined,
                                    iconSize: 16,
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // descrizione
                    Padding(
                        padding: const EdgeInsets.only(left: hPadding),
                        child: AutoSizeText(
                          descrizione,
                          minFontSize: 12,
                          style: TextStyle(
                              color: ColorManager().getColorTextPrimary(),
                              fontSize: 11),
                        )),
                    const SizedBox(
                      height: vPadding,
                    ),
                    if (progressPercentage > 0)
                      Padding(
                          padding: const EdgeInsets.only(left: hPadding),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: Dimens.spacingM,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: LabelsManager()
                                            .getRemoteStringFromLabelKeys(
                                                RemoteLabelKeys
                                                    .percentageOfCompletion),
                                        style: AppTextTheme.body(
                                            color: ColorManager()
                                                .getColorTextPrimary()),
                                      ),
                                      TextSpan(
                                        text:
                                            ' ${progressPercentage.toStringAsFixed(0)}%',
                                        style: AppTextTheme.body(
                                            color: ColorManager()
                                                .getColorTextPrimary(),
                                            weight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: Dimens.spacingXS),
                                GlowProgressBar(
                                  percentage: progressPercentage,
                                  withFactor: .8,
                                ),
                              ],
                            ),
                          )),
                    // pulsante e icona
                    Padding(
                        padding: const EdgeInsets.only(left: hPadding),
                        child: SizedBox(
                            child: Row(
                          children: [
                            ElevatedButton(
                              onPressed: !isEnabled
                                  ? null
                                  : () {
                                      onButtonPressed(index);
                                    },
                              child: Text(buttonTitle),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            BadgeIcon(
                                hasBadge: hasBadge, isCompleted: isCompleted),
                          ],
                        )))
                  ],
                ))));
  }
}
