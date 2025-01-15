import 'dart:async';

import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/row/strip_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../core/dependency_injection/dependency_injection.dart';
import '../../../../../../remote_theming/labels/labels_manager.dart';
import '../../../../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../../../../theme/app_theme.dart';
import '../error/error_screen.dart';
import 'cubit/smart_learning_bottom_sheet_cubit.dart';
import 'widgets/bottom_sheet_actions.dart';
import 'widgets/time_slot_dropdown.dart';

class SmartLearningBottomSheet extends StatelessWidget {
  final SmartLearningBottomSheetArgs args;
  const SmartLearningBottomSheet._({super.key, required this.args});

  static FutureOr<T?> create<T>(
    BuildContext context, {
    Key? key,
    required DateTime date,
    required StripRow strip,
  }) {
    const type = SmartLearningActionType.create;

    final formGroup = FormGroup({
      'start': FormControl<DateTime>(
        validators: [Validators.required],
      ),
      'end': FormControl<DateTime>(
        validators: [Validators.required],
      ),
      'date': FormControl<DateTime>(
        value: date,
        validators: [Validators.required],
      ),
    });

    return showModalBottomSheet(
      context: context,
      clipBehavior: Clip.hardEdge,
      showDragHandle: true,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(Dimens.radius)),
      ),
      barrierColor:
          ColorManager().getColorBackgroundDrawerWidget().withValues(alpha: .5),
      backgroundColor: AppTheme.greyGradient.colors[0],
      builder: (context) {
        return BlocProvider(
          create: (_) => getIt<SmartLearningBottomSheetCubit>()
            ..init(date: date, type: type, strip: strip),
          child: SmartLearningBottomSheet._(
            key: key,
            args: SmartLearningBottomSheetArgs(
                date: date,
                form: formGroup,
                title: LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.smart_learning_create_title),
                description: LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.smart_learning_description),
                confirmActionLabel: LabelsManager()
                    .getRemoteStringFromLabelKeys(
                        RemoteLabelKeys.smart_learning_action_confirm),
                cancelActionLabel: LabelsManager()
                    .getRemoteStringFromLabelKeys(RemoteLabelKeys.close),
                type: type,
                strip: strip),
          ),
        );
      },
    );
  }

  static FutureOr<T?> edit<T>(
    BuildContext context, {
    Key? key,
    required int id,
    required DateTime startTime,
    required DateTime endTime,
    required StripRow strip,
  }) {
    const type = SmartLearningActionType.edit;
    final date = Jiffy.parseFromDateTime(startTime).startOf(Unit.day).dateTime;
    final formGroup = FormGroup({
      'start': FormControl<DateTime>(
        value: startTime,
        validators: [Validators.required],
      ),
      'end': FormControl<DateTime>(
        value: endTime,
        validators: [Validators.required],
      ),
      'date': FormControl<DateTime>(
        value: date,
        validators: [Validators.required],
      ),
    });

    return showModalBottomSheet(
      context: context,
      clipBehavior: Clip.hardEdge,
      showDragHandle: true,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(Dimens.radius)),
      ),
      barrierColor:
          ColorManager().getColorBackgroundDrawerWidget().withValues(alpha: .5),
      backgroundColor: AppTheme.greyGradient.colors[0],
      builder: (context) {
        return BlocProvider(
          create: (_) => getIt<SmartLearningBottomSheetCubit>()
            ..init(
                date: date,
                startTime: startTime,
                endTime: endTime,
                type: type,
                strip: strip),
          child: SmartLearningBottomSheet._(
            key: key,
            args: SmartLearningBottomSheetArgs(
              id: id,
              date: date,
              start: startTime,
              end: endTime,
              form: formGroup,
              title: LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.smart_learning_edit_title),
              description: LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.smart_learning_description),
              confirmActionLabel: LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.smart_learning_action_confirm),
              cancelActionLabel: LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.smart_learning_action_delete),
              type: type,
              strip: strip,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .7,
      padding: const EdgeInsets.all(Dimens.spacingM),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * .7,
      ),
      decoration: BoxDecoration(gradient: AppTheme.greyGradient),
      child: SafeArea(
        child: BlocConsumer<SmartLearningBottomSheetCubit,
            SmartLearningBottomSheetState>(
          listener: (context, state) => state.mapOrNull(
            success: (_) => Navigator.pop(context, true),
          ),
          buildWhen: (previous, current) => current.maybeMap(
            success: (_) => false,
            orElse: () => true,
          ),
          builder: (context, state) => AnimatedSwitcher(
            duration: const Duration(milliseconds: 600),
            child: state.maybeMap(
              loading: (_) => const Center(child: CircularProgressIndicator()),
              error: (failure) => _error(context),
              initialized: (data) => CustomScrollView(
                physics: const ClampingScrollPhysics(),
                slivers: [
                  SliverFillRemaining(
                    child: ReactiveForm(
                      formGroup: args.form,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            args.title,
                            style: AppTextTheme.subtitle(
                                weight: FontWeight.w700,
                                color: ColorManager().getColorTextPrimary()),
                          ),
                          const SizedBox(height: Dimens.spacingXXS),
                          Text(
                            args.description,
                            style: AppTextTheme.body(
                                color: ColorManager().getColorTextPrimary()),
                          ),
                          const SizedBox(height: Dimens.spacingL),
                          const SizedBox(height: Dimens.spacingL),
                          TimeSlotDropdown(data),
                          const Spacer(),
                          BottomSheetActions(args),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              orElse: () => const SizedBox.shrink(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _error(BuildContext context) {
    return Center(
      child: ErrorScreen(
        title:
            LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.error),
        message: LabelsManager()
            .getRemoteStringFromLabelKeys(RemoteLabelKeys.error_occurred),
      ),
    );
  }
}

class SmartLearningBottomSheetArgs {
  final String title;
  final String description;
  final String confirmActionLabel;
  final String cancelActionLabel;
  final DateTime date;
  final FormGroup form;
  final SmartLearningActionType type;
  final int? id;
  final DateTime? start;
  final DateTime? end;
  final StripRow strip;

  SmartLearningBottomSheetArgs({
    required this.title,
    required this.description,
    required this.confirmActionLabel,
    required this.cancelActionLabel,
    required this.date,
    required this.form,
    required this.type,
    this.id,
    this.start,
    this.end,
    required this.strip,
  });
}

enum SmartLearningActionType { create, edit }
