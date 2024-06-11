import 'package:open_learning_smart_tv/domain/entities/community/community_data_model.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/app_bar/styled_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../color_management/color_manager.dart';
import '../../../../../../core/dependency_injection/dependency_injection.dart';
import '../../../../../../domain/entities/generic/post_link_model.dart';
import '../../../../../../domain/enums/types.dart';
import '../../../../../../remote_theming/labels/labels_manager.dart';
import '../../../../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../../../../theme/app_theme.dart';
import '../../../../../common/widgets/dialog/ol_alert_dialog.dart';
import '../../../../../common/widgets/error/error_screen.dart';
import '../../comments/cubit/comments_cubit.dart';
import '../../comments/sliver_comments_list.dart';
import '../../post/post_page.dart';
import '../../widgets/link_attachment.dart';
import '../../widgets/post_header.dart';
import '../../widgets/shared_attachment.dart';
import '../cubit/post_detail_cubit.dart';
import '../post_detail_page_connector.dart';
import '../../widgets/post_info_row.dart';
import '../widgets/add_comment_widget/add_comment_widget.dart';
import '../widgets/add_comment_widget/cubit/add_comment_widget_cubit.dart';

class DefaultPostDetailPage extends StatelessWidget {
  final PostDetailPageArgs args;

  const DefaultPostDetailPage(this.args, {super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: ColorManager().getColorTextPrimaryCta(),
      backgroundColor: ColorManager().getColorBackgroundPrimaryLighter(),
      onRefresh: () async => context.read<PostDetailCubit>().init(args),
      child: GestureDetector(
        onTap: () => context.read<AddCommentWidgetCubit>().focusNode.unfocus(),
        child: Scaffold(
          appBar: const StyledAppBar(),
          body: BlocConsumer<PostDetailCubit, PostDetailState>(
            listener: (context, state) => state.mapOrNull(
              action: (value) {
                return switch (value.action) {
                  PostDetailAction.error => () async {
                      await OlAlertDialog.show(context,
                          title: LabelsManager().getRemoteStringFromLabelKeys(
                              RemoteLabelKeys.error),
                          message: LabelsManager().getRemoteStringFromLabelKeys(
                              RemoteLabelKeys.error_occurred),
                          actionLabel: LabelsManager()
                              .getRemoteStringFromLabelKeys(
                                  RemoteLabelKeys.close),
                          barrierDismissible: false);
                      if (context.mounted) context.pop();
                      return null;
                    },
                  PostDetailAction.success => context.pop(),
                };
              },
            ),
            listenWhen: (previous, current) => current.maybeWhen(
              action: (_) => true,
              orElse: () => false,
            ),
            buildWhen: (previous, current) => current.maybeWhen(
              action: (_) => false,
              orElse: () => true,
            ),
            builder: (context, state) => state.maybeMap(
              orElse: () => const SizedBox.shrink(),
              error: (value) => Center(
                child: ErrorScreen(
                  textColor: ColorManager().getColorTextPrimary(),
                  title: LabelsManager()
                      .getRemoteStringFromLabelKeys(RemoteLabelKeys.error),
                  message: LabelsManager().getRemoteStringFromLabelKeys(
                      RemoteLabelKeys.error_occurred),
                  onReload: () => context.read<PostDetailCubit>().init(args),
                ),
              ),
              loading: (value) =>
                  const Center(child: CircularProgressIndicator()),
              done: (value) {
                final commentsArgs = CommentsArgs(
                  entityId: args.entityId,
                  apiPath: args.apiPath,
                  userModel: value.storedUser,
                );
                return BlocProvider<CommentsCubit>(
                  create: (context) =>
                      getIt<CommentsCubit>()..init(commentsArgs),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(
                              child: Container(
                                margin: const EdgeInsets.only(
                                  left: Dimens.spacingL,
                                  top: Dimens.spacingL,
                                  right: Dimens.spacingL,
                                ),
                                padding: const EdgeInsets.all(Dimens.spacingM),
                                decoration: BoxDecoration(
                                  gradient: AppColors.greyGradient,
                                  borderRadius:
                                      BorderRadius.circular(Dimens.radiusCard),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /// Header
                                    PostHeader(
                                      post: value.post,
                                      canEdit: value.canEdit,
                                      onDelete: () {
                                        context
                                            .read<PostDetailCubit>()
                                            .delete(value.post.id);
                                      },
                                      onEdit: () async {
                                        final res =
                                            await context.pushNamed<bool?>(
                                          PostPage.routeName,
                                          extra: PostPageArgs(
                                            pageType: PostPageType.edit,
                                            postType: PostType.fromString(
                                                value.post.postType),
                                            id: value.post.id,
                                            body: value.post.body,
                                            link: value.post.attachments != null
                                                ? PostLinkModel(
                                                    url: value.post.attachments!
                                                            .link?.content ??
                                                        '',
                                                    label: value
                                                            .post
                                                            .attachments!
                                                            .link
                                                            ?.name ??
                                                        '',
                                                  )
                                                : null,
                                          ),
                                        );
                                        if (context.mounted &&
                                            res != null &&
                                            res) {
                                          context
                                              .read<PostDetailCubit>()
                                              .init(args);
                                        }
                                      },
                                    ),

                                    /// Description
                                    if (value.post.body != null)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: Dimens.spacingM),
                                        child: Html(
                                          data: value.post.body!,
                                          style: {
                                            "body": Style(
                                              padding: HtmlPaddings.zero,
                                              margin: Margins.zero,
                                              color: ColorManager()
                                                  .getColorTextPrimary(),
                                            ),
                                          },
                                        ),
                                      ),

                                    /// Attachment
                                    _getAttachment(value.post),

                                    /// Buttons
                                    PostInfoRow(
                                      margin: const EdgeInsets.only(
                                          top: Dimens.spacingL),
                                      postId: value.post.id,
                                      commentsCount: value.post.commentCount !=
                                                  null &&
                                              value
                                                  .post.commentCount!.isNotEmpty
                                          ? int.parse(value.post.commentCount!)
                                          : 0,
                                      apiPath: args.apiPath,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SliverCommentsList(
                              args: CommentsArgs(
                                entityId: args.entityId,
                                apiPath: args.apiPath,
                                userModel: value.storedUser,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                        child: AddCommentWidget(
                          id: value.storedUser.idUser,
                          name: value.storedUser.name,
                          surname: value.storedUser.surname,
                          apiPath: args.apiPath,
                          entityId: args.entityId,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _getAttachment(CommunityDataModel post) {
    return switch (args.type) {
      PostType.POST => LinkAttachment(post.attachments),
      PostType.SHARED => SharedAttachment(post: post),
      _ => const SizedBox.shrink(),
    };
  }
}
