import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../color_management/color_manager.dart';
import '../../../../../../domain/entities/generic/post_link_model.dart';
import '../../../../../../theme/app_theme.dart';

class PostLinkItem extends StatelessWidget {
  const PostLinkItem(this.link, {super.key, this.onClose});

  final PostLinkModel link;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        gradient: AppTheme.greyGradient,
        borderRadius: BorderRadius.circular(Dimens.radiusImage),
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (link.imageUrl != null && link.imageUrl!.isNotEmpty)
            Image.network(
              link.imageUrl!,
              width: 40.0,
              height: 40.0,
              fit: BoxFit.cover,
            ),
          const SizedBox(width: Dimens.spacingXS),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: link.label,
                    style: AppTextTheme.body(
                      weight: FontWeight.w500,
                      color: ColorManager().getColorTextPrimaryCta(),
                    ),
                  ),
                  WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.only(left: Dimens.spacingM),
                      child: SvgPicture.asset(
                        "assets/icons/link.svg",
                        colorFilter: ColorFilter.mode(
                          ColorManager().getColorTextPrimaryCta(),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: Dimens.spacingM),
          if (onClose != null)
            Padding(
              padding: const EdgeInsets.only(right: Dimens.spacingM),
              child: GestureDetector(
                onTap: onClose,
                behavior: HitTestBehavior.translucent,
                child: SvgPicture.asset(
                  "assets/icons/cross_alt.svg",
                  colorFilter: ColorFilter.mode(
                    ColorManager().getColorTextPrimaryCta(),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
