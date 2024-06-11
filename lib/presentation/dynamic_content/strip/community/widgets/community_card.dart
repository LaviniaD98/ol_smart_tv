import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/domain/entities/community/community_data_model.dart';
import 'package:open_learning_smart_tv/domain/entities/community/community_user_model.dart';
import 'package:open_learning_smart_tv/domain/entities/community/enriched_information_model.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/widgets/shared_attachment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:go_router/go_router.dart';

import '../../../../../domain/entities/community/los_model.dart';
import '../../../../../domain/entities/generic/post_link_model.dart';
import '../../../../../theme/app_theme.dart';
import '../../../../common/widgets/cards/topic_wrap.dart';
import '../detail/post_detail_page_connector.dart';
import 'link_attachment.dart';
import 'post_header.dart';
import 'post_info_row.dart';
import '../post/post_page.dart';
import 'cubit/community_card_cubit.dart';
import 'talk_image_attachment.dart';

class CommunityCard extends StatefulWidget {
  const CommunityCard({
    super.key,
    required this.enInfo,
    required this.post,
    required this.postAuthor,
    required this.userId,
    this.learningObjects,
    this.apiPath,
  });

  final EnrichedInformationModel? enInfo;
  final CommunityDataModel post;
  final CommunityUserModel? postAuthor;
  final List<LosModel>? learningObjects;
  final int? userId;
  final String? apiPath;

  @override
  State<CommunityCard> createState() => _CommunityCardState();
}

class _CommunityCardState extends State<CommunityCard>
    with AutomaticKeepAliveClientMixin {
  late PostType postType;

  @override
  void initState() {
    super.initState();
    postType = PostType.fromString(widget.post.postType);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: Dimens.spacingL),
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.spacingM,
          vertical: Dimens.spacingXL,
        ),
        decoration: BoxDecoration(
          gradient: AppTheme.greyGradient,
          borderRadius: BorderRadius.circular(Dimens.radiusImage),
        ),
        child: BlocBuilder<CommunityCardCubit, CommunityCardState>(
          builder: (context, state) => state.maybeWhen(
            success: () => _content(context),
            loading: () => _loading(),
            orElse: () => const SizedBox.shrink(),
          ),
        ));
  }

  Widget _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _content(BuildContext context) {
    return InkWell(
      onTap: widget.post.id != null
          ? () {
              var args = PostDetailPageArgs(
                entityId: int.parse(widget.post.id!),
                type: PostType.fromString(widget.post.postType),
                apiPath: widget.apiPath,
              );
              context.pushNamed(
                PostDetailPageConnector.routeName,
                extra: args,
              );
            }
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header
          PostHeader(
            post: widget.post,
            canEdit: widget.post.owner?.ownerId == widget.userId.toString(),
            onDelete: () =>
                context.read<CommunityCardCubit>().delete(widget.post.id),
            onEdit: () {
              context.pushNamed<bool?>(
                PostPage.routeName,
                extra: PostPageArgs(
                  pageType: PostPageType.edit,
                  postType: PostType.fromString(widget.post.postType),
                  id: widget.post.id,
                  body: widget.post.body,
                  link: widget.post.attachments != null
                      ? PostLinkModel(
                          url: widget.post.attachments!.link?.content ?? '',
                          label: widget.post.attachments!.link?.name ?? '',
                        )
                      : null,
                ),
              );
            },
          ),

          /// Body content
          if (postType == PostType.TALK &&
              widget.post.title?.isNotEmpty == true)
            Padding(
              padding: const EdgeInsets.only(top: Dimens.spacingXS),
              child: Text(
                widget.post.title!,
                style: AppTextTheme.title(
                    color: ColorManager().getColorTextPrimary()),
              ),
            ),

          /// Topic
          if (postType == PostType.TALK && widget.post.topic.isNotEmpty)
            TopicWrap(
                padding: const EdgeInsets.only(top: Dimens.spacingXS),
                truncate: false,
                widget.post.topic
                    .where((element) {
                      return element.name != null && element.name!.isNotEmpty;
                    })
                    .map((e) => e.name!)
                    .toList()),

          /// Description
          if (widget.post.bodyTrim != null)
            Padding(
              padding: const EdgeInsets.only(top: Dimens.spacingXS),
              child: Html(
                data: widget.post.bodyTrim!,
                style: {
                  "body": Style(
                    padding: HtmlPaddings.zero,
                    margin: Margins.zero,
                    color: ColorManager().getColorTextPrimary(),
                  ),
                },
              ),
            ),

          /// Attachments
          _attachment,

          /// Buttons
          PostInfoRow(
            margin: const EdgeInsets.only(top: Dimens.spacingL),
            postId: widget.post.id,
            commentsCount: widget.post.commentCount != null &&
                    widget.post.commentCount!.isNotEmpty
                ? int.parse(widget.post.commentCount!)
                : 0,
            apiPath: widget.apiPath,
          ),
        ],
      ),
    );
  }

  Widget get _attachment => switch (postType) {
        PostType.TALK => TalkImageAttachment(post: widget.post),
        PostType.POST => LinkAttachment(widget.post.attachments),
        PostType.SHARED => SharedAttachment(post: widget.post),
      };

  @override
  bool get wantKeepAlive => true;
}
