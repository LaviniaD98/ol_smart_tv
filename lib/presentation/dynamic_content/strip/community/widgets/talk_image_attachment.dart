import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../color_management/color_manager.dart';
import '../../../../../domain/entities/community/community_data_model.dart';
import '../../../../../remote_theming/labels/labels_manager.dart';
import '../../../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../../../theme/app_theme.dart';

class TalkImageAttachment extends StatelessWidget {
  final CommunityDataModel post;
  const TalkImageAttachment({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    if(post.attachments != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.read_more),
                style: AppTextTheme.body(
                  weight: FontWeight.w500,
                  color: ColorManager().getColorTextPrimaryCta(),
                ),
              ),
              const SizedBox(width: Dimens.spacingXS),
              Transform.scale(scale: 0.9999, child: SvgPicture.asset(
                'assets/icons/right_arrow.svg',
                colorFilter: ColorFilter.mode(ColorManager().getColorSystemPrimary02(), BlendMode.srcIn)),
              ),
            ],
          ),
          const SizedBox(height: Dimens.spacingM),
          AspectRatio(
            aspectRatio: 3/1.6,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimens.radiusImage),
              clipBehavior: Clip.hardEdge,
              child: _image(post.attachments?.image?.content),
            ),
          ),
        ],
      );
    }
    return const SizedBox.shrink();
  }

  Widget _image(String? url) {
    if(url != null && url.isNotEmpty == true) {
      return CachedNetworkImage(
        imageUrl: url,
        errorWidget: (context, url, error) => _placeholder,
        alignment: Alignment.center,
        fit: BoxFit.cover,
      );
    }
    return _placeholder;
  }

  Widget get _placeholder {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.radiusImage),
        color: AppColors.white.withOpacity(.05),
      ),
    );
  }
}
