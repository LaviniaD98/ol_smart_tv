import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/presentation/community_webview/community_web_view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/domain/entities/menu/route/menu_route.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/glow.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:go_router/go_router.dart';

import '../../../../remote_theming/config/config_manager.dart';
import '../../../../remote_theming/config/remote_config_keys.dart';
import '../../../../remote_theming/labels/labels_manager.dart';

class BorderedDestination extends StatelessWidget {
  const BorderedDestination({
    super.key,
    required this.route,
    required this.isSelected,
    required this.index,
    required this.onDestinationChange,
  });

  final bool isSelected;
  final MenuRoute route;
  final int index;
  final OnDestinationChange onDestinationChange;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => route.maybeMap(
        visCommunity: (_) {
          if (ConfigManager()
              .getRemoteBoolean(RemoteConfigKeys.native_community, false)) {
            onDestinationChange(index);
          } else {
            context.pushNamed(CommunityWebViewPage.routeName);
          }
          return null;
        },
        orElse: () => onDestinationChange(index),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Glow(
            glow: isSelected,
            child: Transform.scale(
                scale: 0.9999,
                child: SvgPicture.asset(
                  route.map(
                    visForYou: (_) => 'assets/icons/for_you.svg',
                    visSearch: (_) => 'assets/icons/search.svg',
                    visExplore: (_) => 'assets/icons/explore.svg',
                    visCommunity: (_) => 'assets/icons/community.svg',
                  ),
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(_color, BlendMode.srcIn),
                )),
          ),
          const SizedBox(height: 4.0),
          Text(
            route.label,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: AppTextTheme.bottomNavigation(color: _color),
          ),
        ],
      ),
    );
  }

  Color get _color => isSelected
      ? ColorManager().getColorSystemSecondary01()
      : ColorManager().getColorTextPrimary();
}

typedef OnDestinationChange = void Function(int);
