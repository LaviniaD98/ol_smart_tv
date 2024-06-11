import 'package:open_learning_smart_tv/domain/entities/strip/calendar/activity/calendar_activity.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/calendar/smart_learning_slots_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/calendar/cubit/ol_calendar_dialog_cubit.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/calendar/widgets/ol_calendar_done.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/calendar/widgets/ol_calendar_loading.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../domain/enums/types.dart';
import '../../../../../theme/app_theme.dart';
import 'widgets/ol_calendar_alert.dart';
import 'widgets/ol_calendar_list.dart';

class OlCalendarDialog extends StatelessWidget {
  static String routeName = 'calendar-dialog';

  const OlCalendarDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          padding: const EdgeInsets.all(Dimens.spacingL),
          decoration: BoxDecoration(
            gradient: AppTheme.backgroundGradient,
            borderRadius: BorderRadius.circular(Dimens.radiusDialog),
          ),
          child: BlocBuilder<OlCalendarDialogCubit, OlCalendarDialogState>(
            builder: (context, state) => AnimatedSwitcher(
              duration: const Duration(milliseconds: 120),
              child: state.when(
                loading: () => const OlCalendarLoading(),
                done: () => const OlCalendarDone(),
                error: () => OlCalendarAlert(
                  title: LabelsManager()
                      .getRemoteStringFromLabelKeys(RemoteLabelKeys.info),
                  message: LabelsManager().getRemoteStringFromLabelKeys(
                      RemoteLabelKeys.download_error),
                  actionLabel: LabelsManager()
                      .getRemoteStringFromLabelKeys(RemoteLabelKeys.close),
                  callback: context.pop,
                ),
                permissionError: () => OlCalendarAlert(
                  title: LabelsManager()
                      .getRemoteStringFromLabelKeys(RemoteLabelKeys.info),
                  message: LabelsManager().getRemoteStringFromLabelKeys(
                      RemoteLabelKeys.add_calendar_permission_error),
                  actionLabel: LabelsManager()
                      .getRemoteStringFromLabelKeys(RemoteLabelKeys.close),
                  callback: context.pop,
                ),
                calendars: (ics, calendars) =>
                    OlCalendarList(ics: ics, calendars: calendars),
                calendarError: () => OlCalendarAlert(
                    title: LabelsManager()
                        .getRemoteStringFromLabelKeys(RemoteLabelKeys.info),
                    message: LabelsManager().getRemoteStringFromLabelKeys(
                        RemoteLabelKeys.error_occurred_try_later),
                    actionLabel: LabelsManager()
                        .getRemoteStringFromLabelKeys(RemoteLabelKeys.close),
                    callback: context.pop),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OlCalendarDialogArgs {
  final AgendaEventType type;
  List<CalendarActivity>? activities;
  SmartLearningSlotsModel? smartLearningSlotsModel;
  LearningObjectModel? learningObjectModel;
  DateTime? date;

  OlCalendarDialogArgs({
    required this.type,
    this.activities,
    this.smartLearningSlotsModel,
    this.learningObjectModel,
    this.date,
  });
}
