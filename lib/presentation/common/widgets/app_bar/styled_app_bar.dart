import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../color_management/color_manager.dart';
import '../../../../theme/app_theme.dart';

class StyledAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final Widget? leading;

  const StyledAppBar({
    super.key,
    this.title = '',
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
              child: SvgPicture.asset(
              iconPath,
              colorFilter: ColorFilter.mode(
                ColorManager().getColorTextPrimaryCta(),
                BlendMode.srcIn,
              ),
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
      title: Text(
        title,
        style: AppTextTheme.appBar(color: ColorManager().getColorTextPrimary()),
      ),
      centerTitle: false,
      titleSpacing: Dimens.spacingM,
      leadingWidth: Dimens.spacingL + Dimens.appBarIconSize,
      leading: automaticallyImplyLeading ? leading ?? StyledAppBar.leadingButton(context) : null,
      elevation: 0,
      automaticallyImplyLeading: automaticallyImplyLeading,
      toolbarHeight: Dimens.appBarHeight,
      actions: [...actions ?? [], const SizedBox(width: Dimens.spacingL)],
      shape: Border(
        bottom: BorderSide(
          color: ColorManager().getColorBorder().withOpacity(.2),
          width: 1,
        ),
      ),
      backgroundColor: ColorManager().getColorBackgroundPrimaryLighter(),
    );
  }
}
