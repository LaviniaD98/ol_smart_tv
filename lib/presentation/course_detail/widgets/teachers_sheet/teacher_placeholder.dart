import 'package:flutter/material.dart';

import '../../../../color_management/color_manager.dart';
import '../../../../theme/app_theme.dart';

class TeacherPlaceholder extends StatelessWidget {
  final String? name;
  final bool? isBig;

  const TeacherPlaceholder(this.name,
    {super.key,
    this.isBig,
    });

  @override
  Widget build(BuildContext context) {
    final String initials = name
        ?.split(' ')
        .map((e) => (e.isNotEmpty) ? e[0] : '')
        .join()
        .toUpperCase() ?? '';

    return Container(
      color: ColorManager().getColorBackgroundSecondary(),
      child: Center(
          child: Text(
            initials,
            style: AppTextTheme.title(
              color: ColorManager().getColorTextPrimaryAlternative(),
              size: (isBig == true) ? 40.0 : null,
            ),
          )
      ),
    );
  }
}
