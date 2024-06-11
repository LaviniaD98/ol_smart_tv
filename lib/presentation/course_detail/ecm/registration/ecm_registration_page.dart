import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/ecm/registration/steps/first_step/ecm_first_step.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/ecm/registration/steps/second_step/ecm_second_step.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/dependency_injection/dependency_injection.dart';
import '../../../../theme/app_theme.dart';
import '../../../common/widgets/app_bar/styled_app_bar.dart';
import '../../../common/widgets/dialog/ol_okcancel_dialog.dart';
import '../../../common/widgets/styled_icon_button.dart';
import 'cubit/ecm_registration_cubit.dart';

class EcmRegistrationPage extends StatelessWidget {
  static String routeName = 'ecm-register-page';

  const EcmRegistrationPage(this.args, {super.key});
  final EcmRegistrationPageArgs args;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EcmRegistrationCubit>(),
      child: Scaffold(
        appBar: StyledAppBar(
          automaticallyImplyLeading: false,
          actions: [
            StyledIconButton(
              svgPath: 'assets/icons/cross.svg',
              onTap: () => OlOkCancelDialog.show(
                context,
                title: LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.ecm_registration_exit_alert_title),
                message: LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.ecm_registration_exit_alert_message),
                okActionLabel: LabelsManager()
                    .getRemoteStringFromLabelKeys(RemoteLabelKeys.exit),
                cancelActionLabel: LabelsManager()
                    .getRemoteStringFromLabelKeys(RemoteLabelKeys.undo),
                okCallback: () => context.pop(),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: AppTheme.backgroundGradient,
            ),
            child: ListView(
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                vertical: Dimens.spacingS,
                horizontal: Dimens.spacingM,
              ),
              children: [
                Text(
                  LabelsManager().getRemoteStringFromLabelKeys(
                      RemoteLabelKeys.ecm_registration_title),
                  style: AppTextTheme.title(
                    weight: FontWeight.bold,
                    color: ColorManager().getColorTextPrimary(),
                  ),
                ),
                const SizedBox(height: Dimens.spacingS),
                Text(
                  LabelsManager().getRemoteStringFromLabelKeys(
                      RemoteLabelKeys.ecm_registration_subtitle),
                  style: AppTextTheme.body(
                    color: ColorManager().getColorTextPrimary(),
                  ),
                ),
                Divider(
                    height: Dimens.spacingXXXL,
                    color: ColorManager().getColorSystemDisabled()),
                BlocBuilder<EcmRegistrationCubit, EcmRegistrationState>(
                  builder: (context, state) => AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: state.map(
                      firstStep: (_) => EcmFirstStep(
                        args: _.args,
                        nextStep: (EcmFirstStepArgs args) {
                          context
                              .read<EcmRegistrationCubit>()
                              .onFirstStepCompleted(args);
                        },
                      ),
                      secondStep: (_) => EcmSecondStep(
                        args: EcmSecondStepArgs(
                          sponsors: args.sponsors,
                          firstStep: _.firstStep,
                          enrollId: args.enrollId,
                          loId: args.loId,
                          onDone: () => context.pop(true),
                        ),
                        previousStep: (EcmFirstStepArgs args) {
                          context
                              .read<EcmRegistrationCubit>()
                              .onBackFirstStep(args);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EcmRegistrationPageArgs {
  final List<String> sponsors;
  final int? enrollId;
  final int? loId;

  const EcmRegistrationPageArgs({
    required this.sponsors,
    this.enrollId,
    this.loId,
  });
}
