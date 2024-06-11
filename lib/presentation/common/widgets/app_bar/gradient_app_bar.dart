import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../color_management/color_manager.dart';
import '../../../../theme/app_theme.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final Widget? leading;

  const GradientAppBar({
    super.key,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.actions,
  });

  static Widget leadingButton<T extends Object?>(
      BuildContext context, {
        T? result,
        VoidCallback? onPressed,
        bool canPopScope = true,
      }) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final canPop = parentRoute?.canPop ?? false;
    final useCloseButton =
    (parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog);
    String iconPath = 'assets/icons/back_arrow.svg';
    if (useCloseButton) {
      iconPath = 'assets/icons/cross_alt.svg';
    }
    if (canPop) {
      return UnconstrainedBox(
        alignment: Alignment.centerRight,
        child: SizedBox(
          width: Dimens.appBarIconSize,
          height: Dimens.appBarIconSize,
          child: GestureDetector(
            onTap: context.pop,
            behavior: HitTestBehavior.opaque,
            child: Transform.scale(scale: 0.9999, 
              child:  SvgPicture.asset(
                iconPath,
                colorFilter: ColorFilter.mode(ColorManager().getColorTextPrimary(), BlendMode.srcIn)
            )),
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(Dimens.appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      titleSpacing: Dimens.spacingM,
      leadingWidth: Dimens.spacingL + Dimens.styledIconSize,
      leading: automaticallyImplyLeading ? leading ?? GradientAppBar.leadingButton(context) : null,
      elevation: 0,
      automaticallyImplyLeading: automaticallyImplyLeading,
      toolbarHeight: Dimens.appBarHeight,
      actions: [...actions ?? [], const SizedBox(width: Dimens.spacingL)],
      backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [.2, .6, 1],
              colors: [
                ColorManager().getColorBackgroundPrimaryLighter().withOpacity(.9),
                ColorManager().getColorBackgroundPrimaryLighter().withOpacity(.5),
                ColorManager().getColorBackgroundPrimaryLighter().withOpacity(0),
              ],
            ),
          ),
        )
    );
  }
}

