import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/onboarding_manager_cubit.dart';
import 'onboarding_sheet.dart';

class OnboardingManager extends StatelessWidget {
  const OnboardingManager({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingManagerCubit, OnboardingManagerState>(
      listener: (context, state) => state.whenOrNull(
        shown: (form) => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          showDragHandle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.radius)),
          barrierColor:
              ColorManager().getColorBackgroundDrawerWidget().withAlpha(127),
          backgroundColor: AppTheme.greyGradient.colors[0],
          builder: (context) => OnboardingSheet(true),
        ),
      ),
      child: const SizedBox(),
    );
  }
}
