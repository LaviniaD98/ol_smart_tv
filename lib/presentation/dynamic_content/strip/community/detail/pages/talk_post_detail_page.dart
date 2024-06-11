import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../color_management/color_manager.dart';
import '../../../../../../core/dependency_injection/dependency_injection.dart';
import '../../../../../../remote_theming/labels/labels_manager.dart';
import '../../../../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../../../common/widgets/app_bar/gradient_app_bar.dart';
import '../../../../../common/widgets/error/error_screen.dart';
import '../../../../../common/widgets/styled_icon_button.dart';
import '../../comments/cubit/comments_cubit.dart';
import '../../comments/sliver_comments_list.dart';
import '../cubit/post_detail_cubit.dart';
import '../post_detail_page_connector.dart';
import '../widgets/add_comment_widget/add_comment_widget.dart';
import '../widgets/add_comment_widget/cubit/add_comment_widget_cubit.dart';
import '../widgets/talk_attachments.dart';
import '../widgets/talk_sliver_header.dart';

class TalkPostDetailPage extends StatelessWidget {
  final PostDetailPageArgs args;

  const TalkPostDetailPage(this.args, {super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: ColorManager().getColorTextPrimaryCta(),
      backgroundColor: ColorManager().getColorBackgroundPrimaryLighter(),
      onRefresh: () async => context.read<PostDetailCubit>().init(args),
      child: GestureDetector(
        onTap: () => context.read<AddCommentWidgetCubit>().focusNode.unfocus(),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: GradientAppBar(
            leading: UnconstrainedBox(
              alignment: Alignment.centerRight,
              child: StyledIconButton(
                svgPath: 'assets/icons/back_arrow.svg',
                onTap: context.pop,
              ),
            ),
          ),
          body: BlocBuilder<PostDetailCubit, PostDetailState>(
            builder: (context, state) => state.maybeMap(
                orElse: () => const SizedBox.shrink(),
                error: (value) => Center(
                      child: ErrorScreen(
                        textColor: ColorManager().getColorTextPrimary(),
                        title: LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.error),
                        message: LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.error_occurred),
                        onReload: () => context.read<PostDetailCubit>().init(args),
                      ),
                    ),
                loading: (value) => const Center(child: CircularProgressIndicator()),
                done: (value) {
                  final commentsArgs = CommentsArgs(
                    entityId: args.entityId,
                    apiPath: args.apiPath,
                    userModel: value.storedUser,
                  );
                  return BlocProvider<CommentsCubit>(
                    create: (context) => getIt<CommentsCubit>()..init(commentsArgs),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: CustomScrollView(
                            slivers: [
                              TalkSliverHeader(
                                post: value.post,
                                apiPath: args.apiPath,
                              ),
                              SliverToBoxAdapter(
                                child: TalkAttachments(
                                  value.post.attachments,
                                  description: value.post.body,
                                ),
                              ),
                              SliverCommentsList(args: commentsArgs),
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
}
