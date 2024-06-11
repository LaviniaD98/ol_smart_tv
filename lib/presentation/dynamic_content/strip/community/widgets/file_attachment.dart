import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../color_management/color_manager.dart';
import '../../../../../domain/entities/community/attachments_model.dart';
import '../../../../../theme/app_theme.dart';
import '../../../../common/utilities/file_size_formatting.dart';

class FileAttachment extends StatelessWidget {

  final AttachmentsModel? data;
  const FileAttachment(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    if(data == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: Dimens.spacingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => launchUrl(Uri.parse(data?.document?.content ?? ''), mode: LaunchMode.externalApplication),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    data?.document?.name ?? 'File',
                    style: AppTextTheme.body(
                      color: ColorManager().getColorTextPrimaryCta(),
                    ),
                  ),
                ),
                const SizedBox(width: Dimens.spacingXS),
                SvgPicture.asset("assets/icons/pdf.svg",
                  colorFilter: ColorFilter.mode(
                    ColorManager().getColorTextPrimaryCta(),
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
          _getDimension(data?.document?.size),
        ],
      ),
    );
  }

  Widget _getDimension(String? size) {
    if(size != null && size.isNotEmpty) {
      final dimension = int.tryParse(size);
      if(dimension != null) {
       return Padding(
         padding: const EdgeInsets.only(top: Dimens.spacingXS),
         child: Text(
           getFileSizeString(bytes: dimension),
           style: AppTextTheme.body(),
         ),
       );
      }
    }
    return const SizedBox.shrink();
  }
}
