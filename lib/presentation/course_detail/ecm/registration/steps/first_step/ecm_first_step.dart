import 'package:open_learning_smart_tv/domain/entities/ecm/ecm_profession_model.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/ecm/registration/steps/first_step/cubit/ecm_first_step_cubit.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../../../../color_management/color_manager.dart';
import '../../../../../../core/dependency_injection/dependency_injection.dart';
import '../../../../../../domain/entities/ecm/ecm_discipline_model.dart';
import '../../../../../../remote_theming/labels/labels_manager.dart';
import '../../../../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../../../common/widgets/forms/dropdown/multiselect_dropdown.dart';

class EcmFirstStep extends StatelessWidget {
  const EcmFirstStep({
    super.key,
    this.args,
    required this.nextStep,
  });

  final EcmFirstStepArgs? args;
  final void Function(EcmFirstStepArgs) nextStep;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EcmFirstStepCubit>(
      create: (context) => getIt<EcmFirstStepCubit>()..init(args),
      child: BlocBuilder<EcmFirstStepCubit, EcmFirstStepState>(
        builder: (context, state) {
          return ReactiveFormBuilder(
            form: () => FormGroup({
              'professionType': FormControl<ProfessionType>(
                value: args?.type ?? ProfessionType.employee,
                validators: [Validators.required],
              ),
            }),
            builder: (context, form, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (state.error)
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: Dimens.spacingM),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Transform.scale(
                              scale: 0.9999,
                              child: SvgPicture.asset(
                                'assets/icons/mandatory.svg',
                                colorFilter: ColorFilter.mode(
                                  ColorManager().getColorBackgroundWarning(),
                                  BlendMode.srcIn,
                                ),
                              )),
                          const SizedBox(width: Dimens.spacingM),
                          Expanded(
                            child: Text(
                              LabelsManager().getRemoteStringFromLabelKeys(
                                  RemoteLabelKeys
                                      .ecm_registration_validation_error),
                              style: AppTextTheme.body(
                                color: ColorManager().getColorTextWarning(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  Text(
                    LabelsManager().getRemoteStringFromLabelKeys(
                        RemoteLabelKeys.ecm_registration_type_title),
                    style: AppTextTheme.body(),
                  ),
                  const SizedBox(height: Dimens.spacingS),
                  Row(
                    children: [
                      Expanded(
                        child: ReactiveRadioListTile<ProfessionType>(
                          value: ProfessionType.freelancer,
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          formControlName: 'professionType',
                          title: Text(
                            LabelsManager().getRemoteStringFromLabelKeys(
                                RemoteLabelKeys
                                    .ecm_registration_type_freelance),
                            style: AppTextTheme.body(
                              color: ColorManager().getColorTextPrimary(),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ReactiveRadioListTile<ProfessionType>(
                          value: ProfessionType.employee,
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          formControlName: 'professionType',
                          title: Text(
                            LabelsManager().getRemoteStringFromLabelKeys(
                                RemoteLabelKeys.ecm_registration_type_employee),
                            style: AppTextTheme.body(
                              color: ColorManager().getColorTextPrimary(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Dimens.spacingM),
                  MultiselectDropdown.paginated(
                    key: const ValueKey('ecm_profession'),
                    label: LabelsManager().getRemoteStringFromLabelKeys(
                        RemoteLabelKeys.ecm_registration_profession_dropdown),
                    controller:
                        context.read<EcmFirstStepCubit>().professionsController,
                    initialItems: state.professions,
                    onChanged: (items) {
                      context
                          .read<EcmFirstStepCubit>()
                          .onProfessionsChanged(items);
                    },
                    onLabelBuilder: (type) => type.name,
                  ),
                  const SizedBox(height: Dimens.spacingXXL),
                  MultiselectDropdown.paginated(
                    key: const ValueKey('ecm_discipline'),
                    label: LabelsManager().getRemoteStringFromLabelKeys(
                        RemoteLabelKeys.ecm_registration_discipline_dropdown),
                    enable: state.professions != null &&
                        state.professions!.isNotEmpty,
                    initialItems: state.disciplines,
                    controller:
                        context.read<EcmFirstStepCubit>().disciplinesController,
                    onChanged: (items) {
                      context
                          .read<EcmFirstStepCubit>()
                          .onDisciplinesChanged(items);
                    },
                    onLabelBuilder: (type) =>
                        '${type.name} (${type.profession.name})',
                  ),
                  const SizedBox(height: Dimens.spacingXL),
                  Text(
                    LabelsManager().getRemoteStringFromLabelKeys(
                        RemoteLabelKeys.ecm_registration_required_input),
                    style: AppTextTheme.body(),
                  ),
                  const SizedBox(height: Dimens.spacingXL),
                  Align(
                    alignment: Alignment.center,
                    child: ReactiveFormConsumer(
                      builder: (context, formGroup, child) => ElevatedButton(
                        onPressed: formGroup.valid &&
                                state.professions != null &&
                                state.professions!.isNotEmpty &&
                                state.disciplines != null &&
                                state.disciplines!.isNotEmpty
                            ? () {
                                final args = EcmFirstStepArgs(
                                  type: formGroup
                                      .findControl('professionType')
                                      ?.value as ProfessionType,
                                  professions: state.professions!,
                                  disciplines: state.disciplines!,
                                );
                                context
                                    .read<EcmFirstStepCubit>()
                                    .onConfirm(args, nextStep);
                              }
                            : null,
                        child: Text(
                          LabelsManager().getRemoteStringFromLabelKeys(
                            RemoteLabelKeys.continue_button,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class EcmFirstStepArgs {
  final ProfessionType type;
  final List<EcmProfessionModel> professions;
  final List<EcmDisciplineModel> disciplines;

  EcmFirstStepArgs({
    required this.type,
    required this.professions,
    required this.disciplines,
  });
}

enum ProfessionType { freelancer, employee }
