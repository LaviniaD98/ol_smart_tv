import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/domain/entities/community/community_data_model.dart';
import 'package:open_learning_smart_tv/domain/entities/detail/detail_page_model.dart';
import 'package:open_learning_smart_tv/domain/entities/menu/route/menu_route.dart';
import 'package:open_learning_smart_tv/presentation/app_state/cubit/app_cubit.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/user_info.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/cubit/detail_page_cubit.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/detail_page.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../core/dependency_injection/dependency_injection.dart';
import '../../domain/entities/generic/post_link_model.dart';
import '../../domain/enums/types.dart';
import '../../remote_theming/labels/labels_manager.dart';
import '../../remote_theming/labels/remote_labels_keys.dart';
import '../../router/app_router.dart';
import '../../wrappers/tracking/tracking_manager.dart';
import '../common/widgets/dialog/ol_okcancel_dialog.dart';
import '../dynamic_content/strip/community/post/post_page.dart';

class CourseDetailOpinionsNoPage extends StatelessWidget {
  final DetailPageModel model;
  final DetailPageArgs args;

  const CourseDetailOpinionsNoPage({
    super.key,
    required this.model,
    required this.args,
  });

  @override
  Widget build(BuildContext context) {
    List<CommunityDataModel> posts = model.sharedPostsModel?.data ?? [];
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => _card(context, posts[index]),
            childCount: posts.length,
          ),
        ),
      ],
    );
  }

  Widget _card(BuildContext context, CommunityDataModel post) {
    return Container(
        margin: const EdgeInsets.fromLTRB(
            Dimens.spacingM, Dimens.spacingM, Dimens.spacingM, 0.0),
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.spacingM,
          vertical: Dimens.spacingXL,
        ),
        decoration: BoxDecoration(
          gradient: AppTheme.greyGradient,
          borderRadius: BorderRadius.circular(Dimens.radiusImage),
        ),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            final dynamicRoutes = context.read<AppCubit>().state.dynamicRoutes;
            final communityRoute = dynamicRoutes?.whereType<VisCommunity>();
            if (communityRoute != null && communityRoute.isNotEmpty) {
              context.read<DetailPageCubit>().goToSharedPostDetails(
                    post.id,
                    communityRoute.first.apiPath,
                  );
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Header row
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: UserInfo(
                        imageUrl: post.owner?.profileImageUrl ?? "",
                        name: post.owner?.name ?? "",
                        lastName: post.owner?.surname ?? ""),
                  ),
                  const SizedBox(width: Dimens.spacingXS),
                  if (post.owner?.ownerId ==
                      '${model.sharedPostsModel?.extendedInformation?.idUser?.toInt()}')
                    InkWell(
                      onTap: () => _showPostControls(context, post),
                      child: SizedBox.square(
                        dimension: 24,
                        child: SvgPicture.asset(
                          "assets/icons/three_dots.svg",
                          colorFilter: ColorFilter.mode(
                              ColorManager().getColorTextPrimary(),
                              BlendMode.srcIn),
                        ),
                      ),
                    )
                ],
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 40 + Dimens.spacingM),
                  SvgPicture.asset(
                    "assets/icons/time.svg",
                    width: 18,
                    colorFilter: ColorFilter.mode(
                        ColorManager().getColorSystemPrimary01(),
                        BlendMode.srcIn),
                  ),
                  const SizedBox(width: Dimens.spacingXS),
                  Text(
                    _formatPostDate(post),
                    style: AppTextTheme.caption(
                        color: ColorManager().getColorTextPrimary()),
                  ),
                  const SizedBox(
                    width: Dimens.spacingXS,
                  ),
                ],
              ),
              const SizedBox(
                height: Dimens.spacingM,
              ),

              ///Body content
              SizedBox(
                width: double.infinity,
                child: Html(
                  data: post.bodyTrim ?? "",
                  style: {
                    "body": Style(
                      textOverflow: TextOverflow.ellipsis,
                      color: ColorManager().getColorTextPrimary(),
                    ),
                  },
                ),
              ),
            ],
          ),
        ));
  }

  void _showPostControls(BuildContext buildContext, CommunityDataModel post) {
    final PostType postType = PostType.fromString(post.postType);

    showModalBottomSheet(
        context: buildContext,
        builder: (context) => Container(
              decoration: const BoxDecoration(
                gradient: AppColors.greyGradient,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(Dimens.spacingXL,
                    Dimens.spacingXXL, Dimens.spacingXL, Dimens.spacingXXL),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      switch (postType) {
                        PostType.POST => LabelsManager()
                            .getRemoteStringFromLabelKeys(RemoteLabelKeys.post),
                        PostType.TALK => LabelsManager()
                            .getRemoteStringFromLabelKeys(RemoteLabelKeys.talk),
                        PostType.SHARED => LabelsManager()
                            .getRemoteStringFromLabelKeys(
                                RemoteLabelKeys.shared),
                      },
                      style: AppTextTheme.title(
                          size: 20,
                          color: ColorManager().getColorTextPrimary()),
                    ),
                    const SizedBox(
                      height: Dimens.spacingXL,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: SizedBox(
                        height: 30,
                        child: InkWell(
                          onTap: () async {
                            final res = await context.pushNamed<bool?>(
                              PostPage.routeName,
                              extra: PostPageArgs(
                                pageType: PostPageType.edit,
                                postType: PostType.fromString(post.postType),
                                id: post.id,
                                body: post.body,
                                link: post.attachments != null
                                    ? PostLinkModel(
                                        url: post.attachments!.link?.content ??
                                            '',
                                        label:
                                            post.attachments!.link?.name ?? '',
                                      )
                                    : null,
                              ),
                            );
                            getIt<TrackingManager>()
                                .communityTrackingHandler(AppRouter.I.fullPath);
                            if (context.mounted && res != null && res) {
                              context.pop();
                              buildContext.read<DetailPageCubit>().init(args);
                            }
                          },
                          child: Row(
                            children: [
                              SizedBox.square(
                                dimension: 24,
                                child: SvgPicture.asset(
                                  "assets/icons/edit.svg",
                                  colorFilter: ColorFilter.mode(
                                      ColorManager().getColorSystemPrimary01(),
                                      BlendMode.srcIn),
                                ),
                              ),
                              const SizedBox(
                                width: Dimens.spacingXS,
                              ),
                              Text(
                                LabelsManager().getRemoteStringFromLabelKeys(
                                    RemoteLabelKeys.modify),
                                style: AppTextTheme.body(
                                    color:
                                        ColorManager().getColorTextPrimary()),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: Dimens.spacingXL,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: SizedBox(
                        height: 24,
                        child: InkWell(
                          onTap: () => OlOkCancelDialog.show(
                            context,
                            title: LabelsManager().getRemoteStringFromLabelKeys(
                                RemoteLabelKeys.post_delete_popup_title),
                            message: LabelsManager()
                                .getRemoteStringFromLabelKeys(
                                    RemoteLabelKeys.post_delete_popup_message),
                            okActionLabel: LabelsManager()
                                .getRemoteStringFromLabelKeys(
                                    RemoteLabelKeys.post_delete_popup_confirm),
                            cancelActionLabel: LabelsManager()
                                .getRemoteStringFromLabelKeys(
                                    RemoteLabelKeys.post_delete_popup_cancel),
                            okCallback: () {
                              context.pop();
                              buildContext
                                  .read<DetailPageCubit>()
                                  .deleteSharedPost(args, post.id);
                            },
                          ),
                          child: Row(
                            children: [
                              SizedBox.square(
                                dimension: 24,
                                child: SvgPicture.asset(
                                  "assets/icons/ic_trash.svg",
                                  colorFilter: ColorFilter.mode(
                                      ColorManager().getColorSystemPrimary01(),
                                      BlendMode.srcIn),
                                ),
                              ),
                              const SizedBox(
                                width: Dimens.spacingXS,
                              ),
                              Text(
                                LabelsManager().getRemoteStringFromLabelKeys(
                                    RemoteLabelKeys.delete),
                                style: AppTextTheme.body(
                                    color:
                                        ColorManager().getColorTextPrimary()),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

  String _formatPostDate(CommunityDataModel post) {
    final postDate = (post.created != null && post.created!.isNotEmpty)
        ? DateTime.parse(post.created!)
        : DateTime.now();
    final dateDifference = DateTime.now().difference(postDate);

    if (dateDifference.inHours < 1) {
      return LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.now);
    } else if (dateDifference.inHours < 2) {
      return LabelsManager()
          .getRemoteStringFromLabelKeys(RemoteLabelKeys.hour_ago)
          .replaceFirst('{{count}}', '${dateDifference.inHours}');
    }
    if (dateDifference.inHours < 24) {
      return LabelsManager()
          .getRemoteStringFromLabelKeys(RemoteLabelKeys.hours_ago)
          .replaceFirst('{{count}}', '${dateDifference.inHours}');
    }
    if (dateDifference.inHours < 48) {
      return LabelsManager()
          .getRemoteStringFromLabelKeys(RemoteLabelKeys.day_ago)
          .replaceFirst('{{count}}', '${dateDifference.inDays}');
    }
    if (dateDifference.inHours < 168) {
      return LabelsManager()
          .getRemoteStringFromLabelKeys(RemoteLabelKeys.days_ago)
          .replaceFirst('{{count}}', '${dateDifference.inDays}');
    }
    if (dateDifference.inHours < 336) {
      return LabelsManager()
          .getRemoteStringFromLabelKeys(RemoteLabelKeys.week_ago)
          .replaceFirst('{{count}}', '${dateDifference.inDays ~/ 7}');
    }
    return DateFormat("dd/MM/yyyy").format(postDate);
  }
}
