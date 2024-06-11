import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../color_management/color_manager.dart';
import '../../../../../core/dependency_injection/dependency_injection.dart';
import '../../../../../domain/entities/community/community_data_model.dart';
import '../../../../../router/app_router.dart';
import '../../../../../theme/app_theme.dart';
import '../../../../../wrappers/tracking/tracking_manager.dart';
import '../../../../common/widgets/cards/topic_list.dart';
import '../../../../course_detail/detail_page.dart';

class SharedAttachment extends StatelessWidget {
  final CommunityDataModel post;
  const SharedAttachment({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    if(post.learningObject != null && post.learningObject!.loId != null) {
      final learningObject = post.learningObject!;
      return Padding(
        padding: const EdgeInsets.only(top: Dimens.spacingL),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () async {
            await context.pushNamed(DetailPage.routeName,
                extra: DetailPageArgs(
                  id: learningObject.loId!,
                  typology: post.learningObjectTypology,
                )
            );
            getIt<TrackingManager>().communityTrackingHandler(AppRouter.I.fullPath);
          },
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: AspectRatio(
                  aspectRatio: 2/3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(Dimens.radiusImage),
                    clipBehavior: Clip.hardEdge,
                    child: _image(learningObject.publicCoverUrl),
                  ),
                ),
              ),
              const SizedBox(width: Dimens.spacingM),
              Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(learningObject.title != null) Text(
                      learningObject.title!,
                      style: AppTextTheme.subtitle(
                        weight: FontWeight.bold,
                        color: ColorManager().getColorTextPrimary(),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (learningObject.topics.isNotEmpty)
                      TopicList(
                        learningObject.topics,
                        color: ColorManager().getColorSystemSecondary05().withOpacity(.6),
                      ),
                    if(learningObject.description != null) Padding(
                      padding: const EdgeInsets.only(top: Dimens.spacingS),
                      child: Text(
                        learningObject.description!,
                        style: AppTextTheme.caption(color: ColorManager().getColorTextPrimary()),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _image(String? url) {
    if(url != null && url.isNotEmpty == true) {
      return CachedNetworkImage(
        imageUrl: url,
        placeholder: (context, url) => Shimmer.fromColors(
            baseColor: AppColors.white.withOpacity(.09),
            highlightColor: AppColors.primaryFaded,
            period: const Duration(seconds: 2),
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(.05),
              ),
            )
        ),
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
