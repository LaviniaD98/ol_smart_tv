import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:open_learning_smart_tv/domain/entities/menu/route/menu_route.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/bottom_navigation/bordered_navigation_bar.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';

class BottomNavigationShell extends StatelessWidget {
  const BottomNavigationShell(this.navigationShell,
      {super.key, required this.routes});

  final List<MenuRoute> routes;
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.backgroundGradient),
        child: navigationShell,
      ),
      bottomNavigationBar: BorderedNavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationChange: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
        destinations: routes,
      ),
    );
  }
}
