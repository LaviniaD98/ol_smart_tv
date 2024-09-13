import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/calendar/activity/calendar_activity.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/calendar/smart_learning_slots_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/cubit/ol_download_dialog_cubit.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_app_file/open_app_file.dart';

import '../../../../domain/enums/types.dart';
import '../../../../theme/app_theme.dart';

class OlDownloadDialog extends StatelessWidget {
  static String routeName = 'downloaddialog';

  const OlDownloadDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OlDownloadDialogCubit, OlDownloadDialogState>(
      builder: (context, state) => state.when(
        downloading: () => downloadInProgress(),
        downloadSuccess: (filePath) => buildContent(
            context,
            LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.info),
            LabelsManager().getRemoteStringFromLabelKeys(
                RemoteLabelKeys.download_completed),
            LabelsManager()
                .getRemoteStringFromLabelKeys(RemoteLabelKeys.open_file), () {
          OpenAppFile.open(filePath, uti: "text/calendar");
        }),
        downloadError: () => buildContent(
            context,
            LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.info),
            LabelsManager()
                .getRemoteStringFromLabelKeys(RemoteLabelKeys.download_error),
            LabelsManager().getRemoteStringFromLabelKeys(
                RemoteLabelKeys.download_dialog_notavailable_oklabel),
            () {}),
        permissionError: () => buildContent(
            context,
            LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.info),
            LabelsManager().getRemoteStringFromLabelKeys(
                RemoteLabelKeys.download_permission_error),
            LabelsManager().getRemoteStringFromLabelKeys(
                RemoteLabelKeys.download_dialog_notavailable_oklabel),
            () {}),
      ),
    );
  }

  Widget downloadInProgress() {
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
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.download_agenda),
                textAlign: TextAlign.center,
                style: AppTextTheme.dialogTitle(
                    color: ColorManager().getColorTextPrimary()),
              ),
              const SizedBox(height: Dimens.spacingXXL),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContent(BuildContext context, String title, String message,
      String actionLabel, final VoidCallback? okCallback) {
    return PopScope(
        canPop: false,
        child: Container(
          padding: const EdgeInsets.all(Dimens.spacingL),
          decoration: BoxDecoration(
            gradient: AppTheme.backgroundGradient,
            borderRadius: BorderRadius.circular(Dimens.radiusDialog),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextTheme.dialogTitle(
                    color: ColorManager().getColorTextPrimary()),
              ),
              const SizedBox(height: Dimens.spacingM),
              Text(
                message,
                textAlign: TextAlign.center,
                style: AppTextTheme.body(
                    color: ColorManager().getColorTextPrimary()),
              ),
              const SizedBox(height: Dimens.spacingXXL),
              ElevatedButton(
                style: AppButtonStyle.red,
                onPressed: () {
                  Navigator.of(context).pop(true);

                  okCallback?.call();
                },
                child: Text(
                  actionLabel,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: AppTextTheme.button(),
                ),
              ),
            ],
          ),
        ));
  }
}

class OlDownloadDialogArgs {
  final AgendaEventType type;
  List<CalendarActivity>? activities;
  SmartLearningSlotsModel? smartLearningSlotsModel;
  LearningObjectModel? learningObjectModel;
  DateTime? date;

  OlDownloadDialogArgs({
    required this.type,
    this.activities,
    this.smartLearningSlotsModel,
    this.learningObjectModel,
    this.date,
  });
}
