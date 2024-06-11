import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../color_management/color_manager.dart';
import '../../../../../core/dependency_injection/dependency_injection.dart';
import '../../../../../theme/app_theme.dart';
import '../../../../common/widgets/glow.dart';
import 'cubit/like_post_cubit.dart';
import 'like_post_button.dart';

class PostInfoRow extends StatelessWidget {
  const PostInfoRow({
    super.key,
    required this.commentsCount,
    this.postId,
    this.apiPath,
    this.margin,
  });

  final String? postId;
  final int commentsCount;
  final String? apiPath;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.spacingM,
        vertical: Dimens.spacingS,
      ),
      decoration: BoxDecoration(
        color: ColorManager().getColorBackgroundPrimaryLighter().withAlpha(127),
        borderRadius: BorderRadius.circular(Dimens.radius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Glow(
            glow: commentsCount > 0,
            child: SvgPicture.asset(
              commentsCount > 0
                  ? 'assets/icons/comment_glow.svg'
                  : 'assets/icons/comment.svg',
              height: commentsCount > 0 ? 20 : 24,
              width: commentsCount > 0 ? 20 : 24,
              colorFilter: ColorFilter.mode(
                ColorManager().getColorSystemPrimary02(),
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(width: Dimens.spacingXXS,),
          Text(
            commentsCount.toString(),
            style: AppTextTheme.caption(
              color: ColorManager().getColorTextPrimary(),
            ),
          ),
          if(postId != null)
            ...[
            Container(
              width: 1,
              height: 24,
              margin: const EdgeInsets.symmetric(horizontal: Dimens.spacingXS),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.radius),
                  color: ColorManager().getColorBorder(),
              ),
            ),
            BlocProvider(
              create: (context) => getIt<LikePostCubit>()
                ..init(
                  entityId: int.parse(postId!),
                  apiPath: apiPath,
                ),
              child: const LikePostButton(),
            ),
          ],
        ],
      ),
    );
  }
}
