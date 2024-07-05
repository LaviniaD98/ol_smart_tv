import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:open_learning_smart_tv/presentation/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';

import '../../../color_management/color_manager.dart';
import '../../../domain/entities/menu/route/menu_route.dart';
import '../../../domain/entities/notification/notification_model.dart';
import '../../../theme/app_theme.dart';
import '../../app_state/cubit/app_cubit.dart';
import '../cubit/notification_cubit.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem(this.item, {super.key});

  final NotificationModel item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!item.isRead) context.read<NotificationCubit>().setRead(item);
        action(context, item.type);
      },
      child: Stack(
        children: [
          if (!item.isRead)
            Positioned(
              top: Dimens.spacingM,
              left: Dimens.spacingXS,
              child: Icon(
                Icons.circle,
                size: Dimens.spacingXXS,
                color: ColorManager().getColorBackgroundAccent(),
              ),
            ),
          Container(
            padding: const EdgeInsets.all(Dimens.spacingM),
            decoration: BoxDecoration(
              color: item.isRead
                  ? ColorManager().getColorBackgroundPrimaryLighter()
                  : ColorManager().getColorBackgroundAccent().withOpacity(0.05),
              borderRadius: BorderRadius.circular(Dimens.radius),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      item.type.svgPath,
                      width: 24,
                      height: 24,
                      fit: BoxFit.none,
                      colorFilter: ColorFilter.mode(
                        item.type.color,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: Dimens.spacingXS),
                    if (item.sendDate != null)
                      Expanded(
                        child: Text(
                          DateFormat('d MMMM yyyy').format(item.sendDate!),
                          style: AppTextTheme.caption(
                            color: ColorManager().getColorTextPrimary(),
                            weight: FontWeight.w700,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: Dimens.spacingXXS),
                Text(
                  item.title,
                  style: AppTextTheme.body(
                    color: ColorManager().getColorTextPrimary(),
                  ),
                ),
                const SizedBox(height: Dimens.spacingXXS),
                Text(
                  item.description,
                  style: AppTextTheme.caption(
                    color: ColorManager().getColorTextPrimary(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void action(BuildContext context, LocalNotificationType type) {
    switch (type) {
      case LocalNotificationType.welcome:
      case LocalNotificationType.welcomenp:
      case LocalNotificationType.badge:
      case LocalNotificationType.reset:
        context.goNamed(ProfilePage.routeName);
      case LocalNotificationType.enroll:
      case LocalNotificationType.suggest:
      case LocalNotificationType.livevent:
      case LocalNotificationType.decline:
      case LocalNotificationType.approvalrequest:
      case LocalNotificationType.reminder:
      case LocalNotificationType.learnrem:
      default:
        final exploreRoute = context
            .read<AppCubit>()
            .state
            .dynamicRoutes
            ?.firstWhereOrNull((element) => element is VisExplore);
        if (exploreRoute != null) {
          context.go(exploreRoute.id.toString().path);
        }
    }
  }
}
