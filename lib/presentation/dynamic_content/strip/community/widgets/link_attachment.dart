import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../color_management/color_manager.dart';
import '../../../../../domain/entities/community/attachments_model.dart';
import '../../../../../remote_theming/labels/labels_manager.dart';
import '../../../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../../../theme/app_theme.dart';
import '../post/utils/link_data.dart';

class LinkAttachment extends StatelessWidget {
  static const double _imageSize = 40.0;

  final AttachmentsModel? data;
  const LinkAttachment(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    if(data == null) return const SizedBox.shrink();
    return Padding(
        padding: const EdgeInsets.only(top: Dimens.spacingM),
        child: InkWell(
          onTap: () {
            launchUrl(
              Uri.parse(data!.link?.content ?? ''),
              mode: LaunchMode.externalApplication,
            );
          },
          child: Container(
            height: _imageSize,
            decoration: BoxDecoration(
              gradient: AppTheme.greyGradient,
              borderRadius: BorderRadius.circular(Dimens.radiusImage),
            ),
            clipBehavior: Clip.antiAlias,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (data?.link != null && data?.link?.content != null)
                  FutureBuilder(
                    future: getPreviewData(data!.link!.content!),
                    builder: (context, snapshot) {
                      return snapshot.hasData && snapshot.data?.image != null
                          ? CachedNetworkImage(
                              imageUrl: snapshot.data!.image!.url,
                              width: _imageSize,
                              height: _imageSize,
                              errorWidget: (context, url, error) => const SizedBox.shrink(),
                              fit: BoxFit.cover,
                            )
                          : const SizedBox.shrink();
                    },
                  ),
                const SizedBox(width: Dimens.spacingXS),
                Text(
                  data?.link?.name ?? LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.link),
                  style: AppTextTheme.body(
                    weight: FontWeight.w500,
                    color: ColorManager().getColorTextPrimaryCta(),
                  ),
                ),
                const SizedBox(width: Dimens.spacingXS),
                SvgPicture.asset(
                  'assets/icons/link.svg',
                  colorFilter: ColorFilter.mode(
                    ColorManager().getColorTextPrimaryCta(),
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
