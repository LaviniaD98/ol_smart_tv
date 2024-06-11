import 'dart:convert';

import 'package:open_learning_smart_tv/connection/connection_status_listener.dart';
import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/data/models/requests/offline/offline_statements_info.dart';
import 'package:open_learning_smart_tv/domain/entities/download/downloaded_item.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:open_learning_smart_tv/domain/use_cases/download/get_stored_download_content_info_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/download/store_download_content_info_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/get_skip_onboarding_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/get_skip_tutorial_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/get_stored_user_self_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/offline/delete_statement_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/offline/get_statements_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/statements/set_state_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/statements/statements_use_case.dart';
import 'package:open_learning_smart_tv/presentation/app_state/cubit/app_cubit.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/onboarding/onboarding_form_group.dart';
import 'package:open_learning_smart_tv/presentation/profile/download/wall/download_wall_strip_page.dart';
import 'package:open_learning_smart_tv/presentation/video_player/offline/video_player_offline_page.dart';
import 'package:open_learning_smart_tv/presentation/video_player/video_player_page.dart';
import 'package:open_learning_smart_tv/presentation/web_player/web_view_page.dart';
import 'package:open_learning_smart_tv/router/app_router.dart';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../dynamic_content/strip/continue_learning/cubit/continue_learning_strip_cubit.dart';

part 'offline_state.dart';
part 'offline_cubit.freezed.dart';

@lazySingleton
class OfflineCubit extends Cubit<OfflineState> {
  final GetStatementsUseCase _getStatementsUseCase;
  final StatementsUseCase _statementsUseCase;
  final SetStateUseCase _setStateUseCase;
  final DeleteStatementsUseCase _deleteStatementsUseCase;
  final GetStoredUserSelfUseCase _getStoredUserSelfUseCase;
  final GetSkipOnboardingUseCase _getSkipOnboardingUseCase;
  final GetSkipTutorialUseCase _getSkipTutorialUseCase;
  final AppCubit _appCubit;
  final ContinueLearningStripCubit _continueLearningStripCubit;
  final GetStoredDownloadContentInfoUseCase
      _getStoredDownloadContentInfoUseCase;
  final StoreDownloadContentInfoUseCase _storeDownloadContentInfoUseCase;
  bool offlineMode = false;
  bool persistenofflineMode = false;

  OfflineCubit(
    this._getStatementsUseCase,
    this._statementsUseCase,
    this._setStateUseCase,
    this._deleteStatementsUseCase,
    this._getStoredUserSelfUseCase,
    this._getSkipTutorialUseCase,
    this._appCubit,
    this._getSkipOnboardingUseCase,
    this._continueLearningStripCubit,
    this._getStoredDownloadContentInfoUseCase,
    this._storeDownloadContentInfoUseCase,
  ) : super(const OfflineState.idle());

  Future<void> init() async {
    initNoInternetListener();
  }

  Future<void> checkUserMissingAlerts() async {
    final self = await _getStoredUserSelfUseCase();
    final skipOnboarding = await _getSkipOnboardingUseCase();
    final skipTutorial = await _getSkipTutorialUseCase();
    bool showTutorial = true;
    if (skipTutorial != null && skipTutorial == true) {
      showTutorial = false;
    }
    if (self?.onboardingFlag != true &&
        skipOnboarding != true &&
        !_appCubit.isOnboardingShown()) {
      emit(OfflineState.shownOnboarding(
          OnboardingFormGroup.build(null), showTutorial));
    } else if (skipTutorial != true && !_appCubit.isTutorialShown()) {
      emit(OfflineState.showTutorial(OnboardingFormGroup.build(null)));
    }
    checkOfflineStatements();
  }

  Future<void> checkOfflineStatements() async {
    var res = await _getStatementsUseCase.call();
    bool hasActiveConnection = await hasConnection();
    res.fold((l) {
      return true;
    }, (offlineStatements) async {
      if (offlineStatements.isNotEmpty && hasActiveConnection) {
        emit(const OfflineState.syncing());
        await processExistingOfflineStatements();
      }
    });
  }

  void setTutorialShown() {
    _appCubit.setTutorialShown(true);
  }

  void setOnboardingShown() {
    _appCubit.setOnboardingShown(true);
  }

  Future<bool> processExistingOfflineStatements(
      [bool isInDownloadWallPage = false]) async {
    var res = await _getStatementsUseCase.call();
    await res.fold((l) async {
      if (!isInDownloadWallPage) {
        emit(const OfflineState.done());
      }
    }, (offlineStatements) async {
      bool hasActiveConnection = await hasConnection();
      for (var offlineStatement in offlineStatements) {
        if (kDebugMode)
          print(
              "OFFLINESTATEMENT GetStatementsUseCase offlineStatement[${offlineStatement.videoId}][${offlineStatement.timestamp}]");
        Map<String, dynamic> jsonMap =
            jsonDecode(offlineStatement.trackinJsongObject!);
        OfflineStatementsInfo offlineStatementsInfo =
            OfflineStatementsInfo.fromJson(jsonMap);

        Duration position = offlineStatementsInfo.duration;
        LearningObjectTypology? learningObjectTypology =
            offlineStatementsInfo.learningObjectTypology;
        String? loId = offlineStatementsInfo.loId;
        String? title = offlineStatementsInfo.title;
        String? description = offlineStatementsInfo.description;
        String? tentativeId = offlineStatementsInfo.tentativeId;
        bool completed = offlineStatement.type == PlayerEvent.onComplete;

        final dateFormat = DateFormat("yyyy-MM-ddTHH:mm:ss.mss'Z'");
        String stored = dateFormat.format(offlineStatement.timestamp.toUtc());

        String? pathId = offlineStatementsInfo.pathId;
        if (validateData(offlineStatement.type, learningObjectTypology, loId,
            title, description)) {
          if (hasActiveConnection) {
            if (kDebugMode)
              print("handlePlayerEvent sending state/statements on server");
            switch (offlineStatement.type) {
              case PlayerEvent.onStart:
              case PlayerEvent.onComplete:
                final res = await _statementsUseCase.call(
                    learningObjectTypology: learningObjectTypology,
                    loId: loId,
                    title: title!,
                    description: description!,
                    completed: completed,
                    duration: position,
                    tentativeId: tentativeId,
                    pathId: pathId,
                    stored: stored);
                res.fold((l) {}, (r) async {
                  if (completed == true) {
                    await _setStateUseCase.call(
                      learningObjectTypology: learningObjectTypology,
                      loId: loId,
                      complete: completed,
                      duration: const Duration(seconds: 0),
                      tentativeId: tentativeId,
                    );
                    if (loId.isNotEmpty == true) {
                      await _updateLocalFile(loId, 0);
                    }
                  }
                });
                break;
              case PlayerEvent.onPause:
              case PlayerEvent.onClose:
                await _setStateUseCase.call(
                  learningObjectTypology: learningObjectTypology,
                  loId: loId,
                  complete: completed,
                  duration: position,
                  tentativeId: tentativeId,
                );
                if (loId.isNotEmpty == true) {
                  await _updateLocalFile(loId, position.inSeconds);
                }
                break;
              default:
                break;
            }
            _deleteStatementsUseCase.call(loId);
          }
        }
      }
      _continueLearningStripCubit.refresh();
      if (!isInDownloadWallPage) {
        emit(const OfflineState.done());
      }
    });
    return true;
  }

  Future<void> _updateLocalFile(String loId, int currentBookmark) async {
    DownloadedItem? downloadedItem =
        await _getStoredDownloadContentInfoUseCase.call(loId);
    if (downloadedItem != null) {
      downloadedItem.bookmark = currentBookmark;
      await _storeDownloadContentInfoUseCase.storeDownloadItem(
          downloadedItem, loId);
    }
  }

  bool validateData(
      PlayerEvent playerEvent,
      LearningObjectTypology? learningObjectTypology,
      String? loId,
      String? title,
      String? description) {
    switch (playerEvent) {
      case PlayerEvent.onStart:
      case PlayerEvent.onComplete:
        return learningObjectTypology != null &&
            loId != null &&
            title != null &&
            description != null;
      default:
        return learningObjectTypology != null && loId != null;
    }
  }

  Future<bool> hasConnection() async {
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

  bool isOfflineMode() {
    return offlineMode;
  }

  void setOfflineMode(bool isOfflineMode) {
    offlineMode = isOfflineMode;
  }

  bool isPersistenofflineMode() {
    return persistenofflineMode;
  }

  void setPersistenofflineMode(bool isPersistenofflineMode) {
    persistenofflineMode = false; //isPersistenofflineMode;
  }

  initNoInternetListener() async {
    if (kDebugMode) print("initNoInternetListener");
    var connectionStatus = ConnectionStatusListener.getInstance();
    await connectionStatus.initialize();
    if (!connectionStatus.hasConnection) {
      updateConnectivity(false, connectionStatus);
    }
    connectionStatus.connectionChange.listen((event) {
      if (kDebugMode) print("initNoInternetListener onNetworkChanged $event");
      updateConnectivity(event, connectionStatus);
    });
  }

  updateConnectivity(
      dynamic hasConnection, ConnectionStatusListener connectionStatus) async {
    if (kDebugMode)
      print(
          "onNetworkChanged hasConnection_ $hasConnection - offlineMode: $offlineMode - hasShownNoInternet: ${connectionStatus.connectionLost}");
    if (offlineMode) {
      if (hasConnection) {
        final isInDownloadPage = AppRouter.I.router.routerDelegate
            .currentConfiguration.matches.last.matchedLocation
            .contains(DownloadWallStripPage.routeName);
        if (isInDownloadPage) {
          emit(OfflineState.networkChanged(true, DateTime.now()));
        }
      }
    } else {
      if (!hasConnection) {
        connectionStatus.connectionLost = true;
      } else {
        if (connectionStatus.connectionLost) {
          final matchedLocation = AppRouter
              .I
              .router
              .routerDelegate
              .currentConfiguration
              .matches
              .last
              .matchedLocation; //.contains(DownloadWallStripPage.routeName);
          if (kDebugMode)
            print("onNetworkChanged matchedLocation: $matchedLocation");
          if (matchedLocation.contains(VideoPlayerPage.routeName.path) ||
              matchedLocation.contains(VideoPlayerOfflinePage.routeName.path) ||
              matchedLocation.contains(WebViewPage.routeName.path)) {
            //do nothing
          } else {
            var res = await _getStatementsUseCase.call();
            res.fold((l) {}, (offlineStatements) {
              if (offlineStatements.isNotEmpty) {
                emit(OfflineState.networkChanged(true, DateTime.now()));
              }
            });
          }
        }
      }
    }
  }
}
