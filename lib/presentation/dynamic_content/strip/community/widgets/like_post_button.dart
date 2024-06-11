import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/widgets/cubit/like_post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../color_management/color_manager.dart';
import '../../../../../theme/app_theme.dart';
import '../../../../common/widgets/glow.dart';

class LikePostButton extends StatelessWidget {
  const LikePostButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikePostCubit, LikePostState>(
      builder: (context, state) => state.map(
        initial: (value) => InkWell(
          onTap: () {
            if (value.isLikedByUser) {
              context.read<LikePostCubit>().unlikePost();
            } else {
              context.read<LikePostCubit>().likePost();
            }
          },
          child: Row(
            children: [
              Glow(
                glow: value.isLikedByUser,
                child: SvgPicture.asset(
                  value.isLikedByUser
                      ? "assets/icons/like_glow.svg"
                      : "assets/icons/like.svg",
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                      ColorManager().getColorSystemPrimary02(),
                      BlendMode.srcIn),
                ),
              ),
              const SizedBox(
                width: Dimens.spacingXXS,
              ),
              Text(
                '${value.likesAmount}',
                style: AppTextTheme.caption(
                    color: ColorManager().getColorTextPrimary()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
