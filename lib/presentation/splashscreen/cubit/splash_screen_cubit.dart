import 'package:open_learning_smart_tv/domain/entities/user/user_info_model.dart';
import 'package:open_learning_smart_tv/domain/use_cases/get_secure_stored_user_info_ss_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'splash_screen_state.dart';
part 'splash_screen_cubit.freezed.dart';

@injectable
class SplashScreenCubit extends Cubit<SplashScreenState> {
  final GetSecureStoredUserInfoSsUseCase _getSecureStoredUserInfoSsUseCase;
  SplashScreenCubit(this._getSecureStoredUserInfoSsUseCase)
      : super(const SplashScreenState.initial());

  void videoEnd() async {
    final hasConnection = await _hasConnection();
    UserInfoModel? userInfoModel =
        await _getSecureStoredUserInfoSsUseCase.call();
    String? sessionId = userInfoModel?.sessionId;
    int? initiativeId = userInfoModel?.initiativeId;
    bool enterOffline = false;
    if (!hasConnection &&
        sessionId?.isNotEmpty == true &&
        initiativeId != null) {
      enterOffline = true;
    }
    emit(SplashScreenState.end(enterOffline));
  }

  void videoError() async {
    emit(const SplashScreenState.error());
  }

  Future<bool> _hasConnection() async {
    bool hasConnection = true;
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      if (kDebugMode) print("hasConnection mobile");
    } else if (connectivityResult == ConnectivityResult.wifi) {
      if (kDebugMode) print("hasConnection wifi");
    } else if (connectivityResult == ConnectivityResult.ethernet) {
      if (kDebugMode) print("hasConnection ethernet");
    } else if (connectivityResult == ConnectivityResult.vpn) {
      if (kDebugMode) print("hasConnection vpn");
    } else if (connectivityResult == ConnectivityResult.bluetooth) {
      if (kDebugMode) print("hasConnection bluetooth");
    } else if (connectivityResult == ConnectivityResult.other) {
      if (kDebugMode) print("hasConnection other");
    } else if (connectivityResult == ConnectivityResult.none) {
      if (kDebugMode) print("hasConnection none");
      hasConnection = false;
    }
    return hasConnection;
  }
}
