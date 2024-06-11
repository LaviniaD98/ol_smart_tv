import 'package:flutter/material.dart';
//import 'package:flutter_glow/flutter_glow.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/domain/entities/menu/route/menu_route.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/bottom_navigation/bordered_destination.dart';

import '../../../../theme/app_theme.dart';

class BorderedNavigationBar extends StatelessWidget {
  static const _horizontalPadding = 32.0;
  static const _verticalPadding = 8.0;
  static const _glowLineHeight = 2.0;
  static const _borderWidth = 1.0;

  const BorderedNavigationBar({
    super.key,
    required this.onDestinationChange,
    required this.selectedIndex,
    required this.destinations,
  });

  final int selectedIndex;
  final OnDestinationChange onDestinationChange;
  final List<MenuRoute> destinations;

  @override
  Widget build(BuildContext context) {
    final glowLineWidth =
        (MediaQuery.of(context).size.width - (_horizontalPadding * 2)) /
            destinations.length;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: ColorManager().getColorBackgroundPrimaryLighter(),
      ),
      child: SafeArea(
        child: SizedBox(
          height: Dimens.bottomNavBarHeight,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: _horizontalPadding,
                  vertical: _verticalPadding,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: _borderWidth,
                      color: ColorManager().getColorBorder(),
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: destinations.asMap().entries.map(
                    (e) {
                      final isSelected = selectedIndex == e.key;
                      return Expanded(
                        child: BorderedDestination(
                          isSelected: isSelected,
                          onDestinationChange: onDestinationChange,
                          index: e.key,
                          route: e.value,
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 120),
                left: (_horizontalPadding + glowLineWidth * selectedIndex),
                child: Container(
                  width: glowLineWidth,
                  height: _glowLineHeight,
                  //glowColor: ColorManager().getColorSystemSecondary01(),
                  color: ColorManager().getColorSystemSecondary01(),
                  // borderRadius: const BorderRadius.all(
                  //   Radius.circular(_glowLineHeight / 2),
                  //),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
