import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/utils/extension.dart';
import '../../../../../../core/utils/utility.dart';
import '../../../../../../domain/entities/community/comment/comment_model.dart';
import '../../../../../../remote_theming/labels/labels_manager.dart';
import '../../../../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../../../../theme/app_theme.dart';

class CommentItemContent extends StatelessWidget {
  final CommentModel args;

  const CommentItemContent(this.args, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.spacingXS),
      width: double.infinity,
      decoration: BoxDecoration(
          color: ColorManager().getColorTextPrimary().withOpacity(.05),
          borderRadius: BorderRadius.circular(Dimens.radiusCard)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '${args.name?.capitalize ?? ''} ${args.surname?.capitalize ?? ''}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextTheme.caption(
                  color: ColorManager().getColorTextPrimary(),
                  weight: FontWeight.w900,
                ),
              ),
              if (args.canEdit) ...[
                const SizedBox(width: Dimens.spacingS),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimens.spacingXS,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimens.radiusTag),
                    color: ColorManager().getColorBackgroundPrimaryCta(),
                  ),
                  child: Text(
                    LabelsManager()
                        .getRemoteStringFromLabelKeys(RemoteLabelKeys.author),
                    style: AppTextTheme.caption(
                      color: ColorManager().getColorTextPrimary(),
                      weight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ],
          ),
          const SizedBox(height: Dimens.spacingXXXS),
          Text(
            args.body ?? '',
            style: AppTextTheme.caption(),
          ),
          const SizedBox(height: Dimens.spacingS),
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/time.svg',
                width: 14,
                colorFilter: ColorFilter.mode(
                  ColorManager().getColorTextPrimary(),
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: Dimens.spacingXXS),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: formatPostDate(args.created),
                      style: AppTextTheme.caption(
                        color: ColorManager().getColorTextPrimary(),
                      ),
                    ),
                    const TextSpan(
                      text: ' ',
                    ),
                    if ((args.created != null && args.changed != null) &&
                        args.created != args.changed)
                      TextSpan(
                        text: LabelsManager().getRemoteStringFromLabelKeys(
                            RemoteLabelKeys.modified),
                        style: AppTextTheme.caption(
                          size: 12,
                          color: ColorManager().getColorTextDisabled(),
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
