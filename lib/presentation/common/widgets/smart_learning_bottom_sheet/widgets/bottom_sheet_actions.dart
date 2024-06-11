import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../theme/app_theme.dart';
import '../cubit/smart_learning_bottom_sheet_cubit.dart';
import '../smart_learning_bottom_sheet.dart';

class BottomSheetActions extends StatelessWidget {
  final SmartLearningBottomSheetArgs args;
  const BottomSheetActions(this.args, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => _onCancel(context),
            child: Text(
              args.cancelActionLabel,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: AppTextTheme.button(),
            ),
          ),
        ),
        const SizedBox(width: Dimens.spacingM),
        Expanded(
          child: ReactiveFormConsumer(
            builder: (context, formGroup, child) {
              final date = formGroup.findControl('date')?.value as DateTime;
              final start = formGroup.findControl('start')?.value as DateTime?;
              final end = formGroup.findControl('end')?.value as DateTime?;
              bool enabled = formGroup.valid;
              if(args.type == SmartLearningActionType.edit && start != null && end != null) {
                enabled = formGroup.valid && !(args.start!.isAtSameMomentAs(start) && args.end!.isAtSameMomentAs(end) && args.date.isAtSameMomentAs(date));
              }
              return ElevatedButton(
                style: AppButtonStyle.red,
                onPressed: enabled
                    ? () => _onConfirm(context, start!, end!)
                    : null,
                child: Text(
                  args.confirmActionLabel,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: AppTextTheme.button(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _onCancel(BuildContext context) => switch(args.type) {
    (SmartLearningActionType.create) => context.pop(),
    (SmartLearningActionType.edit) => context.read<SmartLearningBottomSheetCubit>().delete(args.id)
  };

  void _onConfirm(BuildContext context, DateTime start, DateTime end) => switch(args.type) {
    (SmartLearningActionType.create) => context.read<SmartLearningBottomSheetCubit>().create(start: start, end: end),
    (SmartLearningActionType.edit) => context.read<SmartLearningBottomSheetCubit>().update(id: args.id, start: start, end: end)
  };
}
