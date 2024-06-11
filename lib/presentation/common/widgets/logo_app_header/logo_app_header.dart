import 'dart:io';

import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/logo_app_header/cubit/app_logo_cubit.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/logo_app_header/logo_header_cubit.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/logo_app_header/user_logo.dart';
import 'package:open_learning_smart_tv/presentation/notification/cubit/notification_cubit.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/dependency_injection/dependency_injection.dart';
import '../../../notification/notification_page.dart';
import 'package:shimmer/shimmer.dart';

class LogoAppHeader extends StatelessWidget {
  static const _size = 32.0;

  const LogoAppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.spacingL,
          vertical: Dimens.spacingM,
        ),
        child: Row(
          children: [
            _getAppLogo(),
            const Spacer(),
            _notificationsIcon(context),
            const SizedBox(
              width: Dimens.spacingM,
            ),
            _getUserAvatar(),
          ],
        ),
      ),
    );
  }

  Widget _notificationsIcon(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(NotificationPage.routeName),
      child: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          final unread = (state is Done) &&
              state.items.firstWhereOrNull((element) => !element.isRead) !=
                  null;
          return Stack(
            children: [
              SizedBox(
                height: 24,
                width: 24,
                child: SvgPicture.asset(
                  'assets/icons/notifications.svg',
                  colorFilter: ColorFilter.mode(
                      ColorManager().getColorTextPrimary(), BlendMode.srcIn),
                ),
              ),
              if (unread)
                Positioned(
                  top: 5,
                  left: 13,
                  child: Icon(
                    Icons.circle,
                    size: Dimens.spacingXS,
                    color: ColorManager().getColorAccentVariantA(),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Builder _getAppLogo() {
    return Builder(builder: (context) {
      return BlocProvider(
        create: (_) => getIt<AppLogoCubit>()..init(),
        child: BlocBuilder<AppLogoCubit, AppLogoState>(
          builder: (context, state) => state.map(
            loading: (_) => const SizedBox.shrink(),
            logoRetrieved: (value) => SvgPicture.file(
              File(value.fullImageName),
              width: 161,
            ),
            useAssetLogo: (_) => SizedBox(
                width: 160,
                child: SvgPicture.asset("assets/images/app_logo.svg")),
          ),
        ),
      );
    });
  }

  Builder _getUserAvatar() {
    return Builder(builder: (context) {
      return BlocProvider(
        create: (_) => getIt<LogoHeaderCubit>()..init(),
        child: BlocBuilder<LogoHeaderCubit, LogoHeaderState>(
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
              success: (value) => UserLogo(
                size: _size,
                userImageUrl: value.image,
                name: value.name ?? '',
                surname: value.surname ?? '',
                navigation: true,
              ),
            ),
          ),
        ),
      );
    });
  }
}
