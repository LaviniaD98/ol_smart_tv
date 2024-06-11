import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/comments/cubit/comments_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../core/dependency_injection/dependency_injection.dart';
import '../../../../../domain/entities/community/comment/comment_model.dart';
import '../../../../../domain/entities/session/user_model.dart';
import '../../../../../remote_theming/labels/labels_manager.dart';
import '../../../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../../../theme/app_theme.dart';
import '../../../../common/widgets/error/error_screen.dart';
import '../../../../wall/widgets/on_scroll_error.dart';
import 'item/comment_item.dart';
import 'widgets/empty_comments.dart';

class SliverCommentsList extends StatelessWidget {
  final CommentsArgs args;
  final EdgeInsets? padding;
  const SliverCommentsList({super.key, required this.args, this.padding});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: padding ??
          EdgeInsets.only(
              left: Dimens.spacingL,
              top: Dimens.spacingL,
              right: Dimens.spacingL,
              bottom: Dimens.addCommentInput +
                  MediaQuery.of(context).viewInsets.bottom +
                  Dimens.spacingXXL),
      sliver: BlocBuilder<CommentsCubit, CommentsState>(
        builder: (context, state) => state.map(
          initialized: (_) {
            final cubit = context.read<CommentsCubit>();
            return PagedSliverList.separated(
              shrinkWrapFirstPageIndicators: true,
              addAutomaticKeepAlives: true,
              addRepaintBoundaries: false,
              pagingController: cubit.pagedController,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: Dimens.spacingM),
              builderDelegate: PagedChildBuilderDelegate<CommentModel>(
                animateTransitions: true,
                noItemsFoundIndicatorBuilder: (_) => const EmptyComments(),
                firstPageProgressIndicatorBuilder: (_) =>
                    const SizedBox.shrink(),
                newPageErrorIndicatorBuilder: (_) =>
                    OnScrollError(cubit.pagedController),
                newPageProgressIndicatorBuilder: (_) => const SizedBox.shrink(),
                itemBuilder: (context, item, index) =>
                    CommentItem(item, apiPath: args.apiPath),
                firstPageErrorIndicatorBuilder: (_) =>
                    OnScrollError(cubit.pagedController),
              ),
            );
          },
          loading: (_) => const SizedBox.shrink(),
        ),
      ),
    );
  }
}

class CommentsArgs {
  final String? apiPath;
  final int entityId;
  final UserModel userModel;

  const CommentsArgs({
    this.apiPath,
    required this.entityId,
    required this.userModel,
  });
}
