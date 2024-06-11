import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/widgets/link_attachment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../../../../color_management/color_manager.dart';
import '../../../../../../domain/entities/community/attachments_model.dart';
import '../../../../../../theme/app_theme.dart';
import '../../../../../video_player/community/video_player_thumbnail_widget.dart';
import '../../widgets/file_attachment.dart';

class TalkAttachments extends StatelessWidget {
  final AttachmentsModel? data;
  final String? description;
  final EdgeInsets? padding;

  const TalkAttachments(
    this.data, {
    super.key,
    this.padding,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    if (data != null) {
      final model = data!;
      return Padding(
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: Dimens.spacingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (model.brightcove != null)
              VideoPlayerThumbnailWidget(model.brightcove!),

            /// Description
            if (description != null)
              Padding(
                padding: const EdgeInsets.only(top: Dimens.spacingM),
                child: Html(
                  data: description!,
                  style: {
                    "body": Style(
                      padding: HtmlPaddings.zero,
                      margin: Margins.zero,
                      color: ColorManager().getColorTextPrimary(),
                    ),
                  },
                ),
              ),
            if (model.link != null) LinkAttachment(model),
            if (model.document != null) FileAttachment(model),
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
