import 'dart:io';

import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/ol_download_dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../domain/entities/strip/calendar/activity/calendar_activity.dart';
import '../../../../../domain/entities/strip/calendar/smart_learning_slots_model.dart';
import '../../../../../domain/enums/types.dart';
import '../../../../../domain/use_cases/download_ics/download_events_use_case.dart';

part 'ol_download_dialog_state.dart';
part 'ol_download_dialog_cubit.freezed.dart';

@injectable
class OlDownloadDialogCubit extends Cubit<OlDownloadDialogState> {
  final DownloadEventsUseCase _downloadEventsUseCase;

  OlDownloadDialogCubit(this._downloadEventsUseCase)
      : super(const OlDownloadDialogState.downloading());

  late bool smartLearningEnabled;

  void startDownloadEvents(OlDownloadDialogArgs olDownloadDialogArgs) async {
    if (olDownloadDialogArgs.type == AgendaEventType.events) {
      downloadEvents(olDownloadDialogArgs.activities);
    } else if (olDownloadDialogArgs.type ==
        AgendaEventType.eventSmartLearning) {
      if (olDownloadDialogArgs.smartLearningSlotsModel != null) {
        downloadEventSmartLearning(
            olDownloadDialogArgs.smartLearningSlotsModel!);
      } else {
        emit(const OlDownloadDialogState.downloadError());
      }
    } else if (olDownloadDialogArgs.type ==
        AgendaEventType.eventLearningObject) {
      if (olDownloadDialogArgs.learningObjectModel != null &&
          olDownloadDialogArgs.date != null) {
        downloadEventLearningObject(olDownloadDialogArgs.learningObjectModel!,
            olDownloadDialogArgs.date!);
      } else {
        emit(const OlDownloadDialogState.downloadError());
      }
    }
  }

  Future permissionsCheck(
      final VoidCallback okCallback, final VoidCallback errorCallback) async {
    if (Platform.isIOS) {
      okCallback.call();
    } else {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      if (androidDeviceInfo.version.sdkInt > 29) {
        android11PlusPermissions(okCallback, errorCallback);
      } else {
        android10Permissions(okCallback, errorCallback);
      }
    }
  }

  Future android10Permissions(
      final VoidCallback okCallback, final VoidCallback errorCallback) async {
    await Permission.storage.onDeniedCallback(() {
      if (kDebugMode) print("download_ics ERROR onDeniedCallback");
      errorCallback.call();
    }).onGrantedCallback(() async {
      if (kDebugMode) print("download_ics onGrantedCallback");
      okCallback.call();
    }).onPermanentlyDeniedCallback(() {
      if (kDebugMode) print("download_ics ERROR onPermanentlyDeniedCallback");
      errorCallback.call();
    }).onRestrictedCallback(() async {
      if (kDebugMode) print("download_ics ERROR onRestrictedCallback");
      okCallback.call();
    }).onLimitedCallback(() async {
      if (kDebugMode) print("download_ics ERROR onLimitedCallback");
      okCallback.call();
    }).onProvisionalCallback(() {
      if (kDebugMode) print("download_ics ERROR onProvisionalCallback");
      okCallback.call();
    }).request();
  }

  Future android11PlusPermissions(
      final VoidCallback okCallback, final VoidCallback errorCallback) async {
    await Permission.manageExternalStorage.onDeniedCallback(() {
      if (kDebugMode) print("download_ics ERROR onDeniedCallback");
      errorCallback.call();
    }).onGrantedCallback(() async {
      if (kDebugMode) print("download_ics onGrantedCallback");
      okCallback.call();
    }).onPermanentlyDeniedCallback(() {
      if (kDebugMode) print("download_ics ERROR onPermanentlyDeniedCallback");
      errorCallback.call();
    }).onRestrictedCallback(() async {
      if (kDebugMode) print("download_ics ERROR onRestrictedCallback");
      okCallback.call();
    }).onLimitedCallback(() async {
      if (kDebugMode) print("download_ics ERROR onLimitedCallback");
      okCallback.call();
    }).onProvisionalCallback(() {
      if (kDebugMode) print("download_ics ERROR onProvisionalCallback");
      okCallback.call();
    }).request();
  }

  Future downloadEvents(List<CalendarActivity>? activities) async {
    permissionsCheck(() async {
      emit(const OlDownloadDialogState.downloading());
      final res = await _downloadEventsUseCase.downloadEvents(activities ?? []);
      await res.fold((l) async {
        if (kDebugMode) print("download_ics ERROR $l");
        emit(const OlDownloadDialogState.downloadError());
      }, (r) async {
        emit(OlDownloadDialogState.downloadSuccess(r));
      });
    }, () {
      if (kDebugMode) print("download_ics onError permission callback");
      emit(const OlDownloadDialogState.permissionError());
    });
  }

  Future downloadEventSmartLearning(SmartLearningSlotsModel model) async {
    permissionsCheck(() async {
      emit(const OlDownloadDialogState.downloading());
      final res =
          await _downloadEventsUseCase.downloadSmartLearningEvent(model);
      await res.fold((l) async {
        if (kDebugMode) print("download_ics ERROR $l");
        emit(const OlDownloadDialogState.downloadError());
      }, (r) async {
        emit(OlDownloadDialogState.downloadSuccess(r));
      });
    }, () {
      if (kDebugMode) print("download_ics onError permission callback");
      emit(const OlDownloadDialogState.permissionError());
    });
  }

  Future downloadEventLearningObject(
      LearningObjectModel model, DateTime date) async {
    permissionsCheck(() async {
      emit(const OlDownloadDialogState.downloading());
      final res =
          await _downloadEventsUseCase.downloadLearningObjectEvent(model, date);
      await res.fold((l) async {
        if (kDebugMode) print("download_ics ERROR $l");
        emit(const OlDownloadDialogState.downloadError());
      }, (r) async {
        emit(OlDownloadDialogState.downloadSuccess(r));
      });
    }, () {
      if (kDebugMode) print("download_ics onError permission callback");
      emit(const OlDownloadDialogState.permissionError());
    });
  }
}
