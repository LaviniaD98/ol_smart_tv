import 'package:open_learning_smart_tv/core/dependency_injection/dependency_injection.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/user_avatar/cubit/user_avatar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../theme/app_theme.dart';
import '../logo_app_header/user_logo.dart';

class UserAvatar extends StatelessWidget {
  static const double _size = 36.0;

  const UserAvatar({
    super.key,
    this.id,
    this.name,
    this.surname,
    this.size = _size,
  });

  final int? id;
  final String? name;
  final String? surname;
  final double size;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserAvatarCubit>(
      create: (context) => getIt<UserAvatarCubit>()..init(id),
      child: BlocBuilder<UserAvatarCubit, UserAvatarState>(
        builder: (context, state) => AnimatedSwitcher(
          duration: const Duration(milliseconds: 120),
          child: state.map(
            loading: (_) => Shimmer.fromColors(
                baseColor: AppColors.white.withOpacity(.09),
                highlightColor: AppColors.primaryFaded,
                period: const Duration(seconds: 2),
                child: Container(
                  width: _size,
                  height: _size,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(.2),
                    shape: BoxShape.circle,
                  ),
                )),
            image: (value) => UserLogo(
              size: _size,
              userImageUrl: value.url,
              name: name ?? '',
              surname: surname ?? '',
            ),
            error: (value) => UserLogo(
              size: _size,
              name: name ?? '',
              surname: surname ?? '',
            ),
          ),
        ),
      ),
    );
  }
}
