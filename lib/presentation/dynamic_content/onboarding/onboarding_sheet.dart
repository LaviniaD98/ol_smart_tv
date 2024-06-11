import 'package:open_learning_smart_tv/presentation/dynamic_content/onboarding/tutorial_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../color_management/color_manager.dart';
import '../../../core/dependency_injection/dependency_injection.dart';
import '../../../remote_theming/labels/labels_manager.dart';
import '../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../theme/app_theme.dart';
import '../../common/widgets/forms/reactive_checkbox_field.dart';
import 'cubit/onboarding_sheet_cubit.dart';
import 'onboarding_form_group.dart';

class OnboardingSheet extends StatelessWidget {
  final bool showTutorial;
  OnboardingSheet(this.showTutorial, {super.key});

  final form = OnboardingFormGroup.build(null);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<OnboardingSheetCubit>(),
      child: BlocBuilder<OnboardingSheetCubit, OnboardingSheetState>(
        builder: (context, state) => Container(
          decoration: BoxDecoration(gradient: AppTheme.greyGradient),
          padding: const EdgeInsets.fromLTRB(
              Dimens.spacingL, 0, Dimens.spacingL, Dimens.spacingM),
          child: SafeArea(
            child: ReactiveForm(
              formGroup: form,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LabelsManager()
                        .getRemoteStringFromLabelKeys(RemoteLabelKeys.welcome),
                    style: AppTextTheme.title(size: 20.0),
                  ),
                  const SizedBox(
                    height: Dimens.spacingXS,
                  ),
                  Text(
                    LabelsManager().getRemoteStringFromLabelKeys(
                        RemoteLabelKeys.welcome_text),
                    style: AppTextTheme.body(),
                  ),
                  const SizedBox(
                    height: Dimens.spacingXL,
                  ),
                  Row(
                    children: [
                      ReactiveCheckboxField(
                        formControlName: 'neverShowAgain',
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                          LabelsManager().getRemoteStringFromLabelKeys(
                              RemoteLabelKeys.dont_show),
                          style: AppTextTheme.body()),
                    ],
                  ),
                  const SizedBox(
                    height: Dimens.spacingXL,
                  ),
                  Center(
                    child: ReactiveFormConsumer(
                      builder: (context, formGroup, child) => ElevatedButton(
                        onPressed: () {
                          final skip = formGroup
                              .findControl('neverShowAgain')
                              ?.value as bool?;
                          context
                              .read<OnboardingSheetCubit>()
                              .setSkipOnboarding(skip ?? false);
                          context.pop();
                          if (showTutorial) {
                            context
                                .read<OnboardingSheetCubit>()
                                .setTutorialShown();
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                showDragHandle: true,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(Dimens.radius)),
                                barrierColor: ColorManager()
                                    .getColorBackgroundDrawerWidget()
                                    .withAlpha(127),
                                backgroundColor:
                                    AppTheme.greyGradient.colors[0],
                                builder: (context) => const TutorialSheet());
                          }
                        },
                        child: Text(
                          LabelsManager().getRemoteStringFromLabelKeys(
                              RemoteLabelKeys.understand),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.spacingM,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
