import 'package:open_learning_smart_tv/presentation/course_detail/ecm/registration/steps/first_step/ecm_first_step.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../core/dependency_injection/dependency_injection.dart';
import '../../../../../../remote_theming/labels/labels_manager.dart';
import '../../../../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../../../../theme/app_theme.dart';
import '../../../../../common/widgets/dialog/ol_alert_dialog.dart';
import '../../../../../common/widgets/forms/dropdown/multiselect_dropdown.dart';
import 'cubit/ecm_second_step_cubit.dart';

class EcmSecondStep extends StatelessWidget {
  const EcmSecondStep(
      {super.key, required this.args, required this.previousStep});
  final EcmSecondStepArgs args;
  final void Function(EcmFirstStepArgs) previousStep;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EcmSecondStepCubit>(
      create: (context) => getIt<EcmSecondStepCubit>(),
      child: BlocConsumer<EcmSecondStepCubit, EcmSecondStepState>(
        listener: (context, state) => state.mapOrNull(
          error: (_) => OlAlertDialog.show(
            context,
            title: LabelsManager()
                .getRemoteStringFromLabelKeys(RemoteLabelKeys.error),
            message: LabelsManager()
                .getRemoteStringFromLabelKeys(RemoteLabelKeys.error_occurred),
            actionLabel: LabelsManager()
                .getRemoteStringFromLabelKeys(RemoteLabelKeys.close),
          ),
        ),
        buildWhen: (previous, current) => current.maybeMap(
          error: (_) => false,
          orElse: () => true,
        ),
        builder: (context, state) => state.maybeMap(
          orElse: () => const SizedBox.shrink(),
          loading: (value) => const Center(child: CircularProgressIndicator()),
          initial: (value) => ReactiveFormBuilder(
            form: () => FormGroup({
              'recruited': FormControl<bool>(
                value: false,
                validators: [Validators.required],
              ),
            }),
            builder: (context, form, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LabelsManager().getRemoteStringFromLabelKeys(
                        RemoteLabelKeys.ecm_registration_recruitment_title),
                    style: AppTextTheme.body(),
                  ),
                  const SizedBox(height: Dimens.spacingS),
                  Row(
                    children: [
                      Expanded(
                        child: ReactiveRadioListTile<bool>(
                          value: true,
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          formControlName: 'recruited',
                          title: Text(
                            LabelsManager().getRemoteStringFromLabelKeys(
                                RemoteLabelKeys.yes),
                            style: AppTextTheme.body(),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ReactiveRadioListTile<bool>(
                          value: false,
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          formControlName: 'recruited',
                          title: Text(
                            LabelsManager().getRemoteStringFromLabelKeys(
                                RemoteLabelKeys.no),
                            style: AppTextTheme.body(),
                          ),
                          onChanged: (control) {
                            if (control.value != true) {
                              context
                                  .read<EcmSecondStepCubit>()
                                  .onSponsorsChanged([]);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  ReactiveFormConsumer(
                    builder: (context, formGroup, child) {
                      final isRecruited =
                          formGroup.findControl('recruited')?.value as bool;
                      if (!isRecruited) return const SizedBox.shrink();
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: Dimens.spacingXL),
                          Text(
                            LabelsManager().getRemoteStringFromLabelKeys(
                                RemoteLabelKeys.ecm_registration_sponsor_title),
                            style: AppTextTheme.body(),
                          ),
                          const SizedBox(height: Dimens.spacingS),
                          MultiselectDropdown.simple(
                            key: const ValueKey('ecm_sponsors'),
                            label: LabelsManager().getRemoteStringFromLabelKeys(
                                RemoteLabelKeys
                                    .ecm_registration_sponsor_dropdown),
                            items: args.sponsors,
                            initialItems: value.selectedSponsor,
                            onChanged: (items) {
                              context
                                  .read<EcmSecondStepCubit>()
                                  .onSponsorsChanged(items);
                            },
                            onLabelBuilder: (type) => type,
                          ),
                          const SizedBox(height: Dimens.spacingXL),
                          Text(
                            LabelsManager().getRemoteStringFromLabelKeys(
                                RemoteLabelKeys
                                    .ecm_registration_required_input),
                            style: AppTextTheme.body(),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: Dimens.spacingXL),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: AppButtonStyle.outlined,
                          onPressed: () => previousStep.call(args.firstStep),
                          child: Text(
                            LabelsManager().getRemoteStringFromLabelKeys(
                              RemoteLabelKeys.back,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: Dimens.spacingM),
                      Expanded(
                        child: ReactiveFormConsumer(
                          builder: (context, formGroup, child) {
                            final isRecruited = formGroup
                                .findControl('recruited')
                                ?.value as bool;
                            final enabled = !isRecruited ||
                                (isRecruited &&
                                    value.selectedSponsor.isNotEmpty);
                            return ElevatedButton(
                              onPressed: enabled
                                  ? () {
                                      context
                                          .read<EcmSecondStepCubit>()
                                          .onConfirm(args);
                                    }
                                  : null,
                              child: Text(
                                LabelsManager().getRemoteStringFromLabelKeys(
                                  RemoteLabelKeys.continue_button,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class EcmSecondStepArgs {
  final List<String> sponsors;
  final EcmFirstStepArgs firstStep;
  final VoidCallback onDone;
  final int? enrollId;
  final int? loId;

  const EcmSecondStepArgs({
    required this.firstStep,
    required this.sponsors,
    required this.onDone,
    this.enrollId,
    this.loId,
  });
}
