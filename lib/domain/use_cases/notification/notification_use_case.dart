import 'dart:io';

import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:open_learning_smart_tv/data/models/requests/device_dto.dart';
import 'package:open_learning_smart_tv/data/models/requests/register_device_body_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/notification/register_device_response.dart';
import 'package:open_learning_smart_tv/domain/entities/user/user_info_model.dart';
import 'package:open_learning_smart_tv/domain/repositories/notification/notification_repository.dart';
import 'package:open_learning_smart_tv/domain/use_cases/get_secure_stored_user_info_use_case.dart';
import 'package:android_id/android_id.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

@lazySingleton
class NotificationUseCase {
  final NotificationRepository _repository;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;

  NotificationUseCase(
    this._repository,
    this._getSecureStoredUserInfoUseCase,
  );

  Future<Either<Failure, RegisterDeviceResponse?>> call(
      String deviceToken) async {
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase.call();
    String idUser = "${userInfoModel?.user?.idUser}";

    String path = "notificator/registerDevice";

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    String model = "";
    String modelVersion = "";
    String os = "";
    String osVersion = "";
    String deviceUUID = "";
    if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      model = iosDeviceInfo.model.length > 50
          ? iosDeviceInfo.model.substring(0, 49)
          : iosDeviceInfo.model;
      modelVersion = model;
      os = "ios";
      osVersion = iosDeviceInfo.systemVersion;
      deviceUUID = iosDeviceInfo.identifierForVendor ?? "";
    } else {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      model = androidDeviceInfo.model.length > 50
          ? androidDeviceInfo.model.substring(0, 49)
          : androidDeviceInfo.model;
      modelVersion = androidDeviceInfo.fingerprint.length > 50
          ? androidDeviceInfo.fingerprint.substring(0, 49)
          : androidDeviceInfo.fingerprint;
      os = "android";
      osVersion = androidDeviceInfo.version.release;

      var androidIdPlugin = const AndroidId();
      final String? androidId = await androidIdPlugin.getId();

      deviceUUID = androidId ?? "";
    }

    if (kDebugMode)
      print(
          'DeviceInfoForRegisterDevice: deviceUUID: $deviceUUID - Running on $model');

    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String version = packageInfo.version;

    DeviceDto device =
        DeviceDto(model, modelVersion, os, osVersion, deviceUUID);

    RegisterDeviceBodyDto registerDeviceBodyDto =
        RegisterDeviceBodyDto(version, deviceToken, idUser, device);
    return await _repository.registerDevice(path, registerDeviceBodyDto);
  }
}
