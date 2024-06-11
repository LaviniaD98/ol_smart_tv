import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../color_management/color_manager.dart';
import '../../../../../../domain/entities/community/community_data_model.dart';
import '../../../../../../theme/app_theme.dart';
import '../../../../../common/widgets/cards/topic_wrap.dart';
import '../../widgets/post_controls.dart';
import '../../widgets/post_header.dart';
import '../../widgets/post_info_row.dart';

class TalkSliverHeader extends StatefulWidget {
  final CommunityDataModel post;
  final String? apiPath;
  const TalkSliverHeader({
    super. key,
    required this.post,
    required this.apiPath,
  });

  @override
  TalkSliverHeaderState createState() => TalkSliverHeaderState();
}

class TalkSliverHeaderState extends State<TalkSliverHeader> {
  final GlobalKey _childKey = GlobalKey();
  double? height;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        height = (_childKey.currentContext?.findRenderObject() as RenderBox?)?.size.height;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ClipRRect(
        child: SizedBox(
          height: height,
          child: Stack(
            fit: height != null ? StackFit.expand : StackFit.loose,
            children: [
              if(height != null) _background,
              _overlay,
              _foreground,
            ],
          ),
        ),
      ),
    );
  }

  Widget get _overlay {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ColorManager().getColorGradient05Start(),
            ColorManager().getColorBackgroundPrimaryLighter(),
          ],
        ),
      ),
    );
  }

  Widget get _foreground {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimens.spacingL,
        top: Dimens.spacingXXXL + MediaQuery.of(context).padding.top,
        right: Dimens.spacingL,
      ),
      key: _childKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Header
          PostHeader(
            post: widget.post,
            showInfo: false,
          ),
          /// Title
          if (widget.post.title?.isNotEmpty == true) Padding(
            padding: const EdgeInsets.only(top: Dimens.spacingXS),
            child: Text(
              widget.post.title!,
              style: AppTextTheme.title(color: ColorManager().getColorTextPrimary()),
            ),
          ),
          /// Topic
          if (widget.post.topic.isNotEmpty) TopicWrap(
              color: ColorManager().getColorSystemSecondary05().withOpacity(.6),
              padding: const EdgeInsets.only(top: Dimens.spacingXS),
              truncate: false,
              widget.post.topic.where((element) {
                return element.name != null && element.name!.isNotEmpty;
              }).map((e) => e.name!).toList()
          ),
          /// Subtitle
          if (widget.post.subtitle?.isNotEmpty == true) Padding(
            padding: const EdgeInsets.only(top: Dimens.spacingM),
            child: Text(
              widget.post.subtitle!,
              style: AppTextTheme.body(color: ColorManager().getColorTextPrimary()),
            ),
          ),
          /// Post date and reading time
          PostControls(
            padding: const EdgeInsets.only(top: Dimens.spacingM),
            post: widget.post,
          ),
          /// Buttons
          PostInfoRow(
            margin: const EdgeInsets.only(top: Dimens.spacingL),
            postId: widget.post.id,
            commentsCount: widget.post.commentCount != null && widget.post.commentCount!.isNotEmpty
                ? int.parse(widget.post.commentCount!)
                : 0,
            apiPath: widget.apiPath,
          ),
        ],
      ),
    );
  }

  Widget get _background {
    const placeholder = SizedBox.shrink();
    if(widget.post.attachments == null) return placeholder;
    final url = widget.post.attachments?.image?.content;
    if(url != null && url.isNotEmpty == true) {
      return CachedNetworkImage(
        imageUrl: url,
        placeholder: (context, url) => placeholder,
        errorWidget: (context, url, error) => placeholder,
        alignment: Alignment.center,
        fit: BoxFit.cover,
      );
    }
    return placeholder;
  }
}