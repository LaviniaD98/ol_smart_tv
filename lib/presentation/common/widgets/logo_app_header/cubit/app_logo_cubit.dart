import 'dart:io';
import 'package:open_learning_smart_tv/remote_theming/config/config_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/config/remote_config_keys.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

part 'app_logo_state.dart';
part 'app_logo_cubit.freezed.dart';

@injectable
class AppLogoCubit extends Cubit<AppLogoState> {
  static const String localLogoName = "LOGO_MOBILE.svg";

  AppLogoCubit() : super(const AppLogoState.loading());

  void init() async {
    if (ConfigManager()
        .getRemoteBoolean(RemoteConfigKeys.remote_app_header_logo, false)) {
      String? localPath = await _getSavedDir();
      var fullFileName = '$localPath/RES_$localLogoName';
      final file = File(fullFileName);
      if (file.existsSync()) {
        emit(AppLogoState.logoRetrieved(fullImageName: fullFileName));
      } else {
        emit(const AppLogoState.useAssetLogo());
      }
    } else {
      emit(const AppLogoState.useAssetLogo());
    }
  }

  Future<String?> _getSavedDir() async {
    String? externalStorageDirPath;
    externalStorageDirPath =
        (await getApplicationDocumentsDirectory()).absolute.path;

    return externalStorageDirPath;
  }
}
