import 'package:open_learning_smart_tv/domain/entities/menu/menu_model.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/dialog_page.dart';
import 'package:open_learning_smart_tv/router/app_router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../domain/use_cases/community/start_community_tracking_use_case.dart';
import '../../domain/use_cases/community/stop_community_tracking_use_case.dart';

@lazySingleton
class TrackingManager with WidgetsBindingObserver {
  TrackingManager(
    this._startCommunityTrackingUseCase,
    this._stopCommunityTrackingUseCase,
  );

  final StartCommunityTrackingUseCase _startCommunityTrackingUseCase;
  final StopCommunityTrackingUseCase _stopCommunityTrackingUseCase;

  DateTime? _communityStartTrackingDate;

  void communityTrackingHandler(String path) {
    final index = AppRouter.I.dynamicRoutes?.indexWhere(
        (element) => element.routeName == MenuServiceType.community.routeName);
    if (index != null) {
      final branchPath = (index + 1).toString();
      if (!path.contains(DialogPage.routeName) &&
          !path.contains(branchPath) &&
          _communityStartTrackingDate != null) {
        WidgetsBinding.instance.removeObserver(this);
        _stopCommunityTracking();
      } else if (path.contains(branchPath) &&
          _communityStartTrackingDate == null) {
        WidgetsBinding.instance.addObserver(this);
        _startCommunityTracking();
      }
    }
  }

  void _startCommunityTracking() async {
    final dateTime = DateTime.now();
    if (kDebugMode)
      print('Tracking community: START: (DateTime: $dateTime) ********');
    final res = await _startCommunityTrackingUseCase();
    res.fold((l) => null, (r) => _communityStartTrackingDate = dateTime);
  }

  void _stopCommunityTracking() async {
    if (_communityStartTrackingDate != null) {
      final dateTime = DateTime.now();
      final delta = dateTime.difference(_communityStartTrackingDate!);
      if (kDebugMode)
        print(
            'Tracking community: STOP: (DateTime: $dateTime) - (Delta: $delta) ********');
      final res =
          await _stopCommunityTrackingUseCase(_communityStartTrackingDate!);
      res.fold((l) => _communityStartTrackingDate = null,
          (r) => _communityStartTrackingDate = null);
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final path = AppRouter.I.fullPath;
    var index = AppRouter.I.dynamicRoutes?.indexWhere(
        (element) => element.routeName == MenuServiceType.community.routeName);
    if (index != null && path.contains((++index).toString())) {
      switch (state) {
        case AppLifecycleState.detached:
          if (_communityStartTrackingDate != null) _stopCommunityTracking();
          WidgetsBinding.instance.removeObserver(this);
          break;
        case AppLifecycleState.inactive:
          if (_communityStartTrackingDate != null) _stopCommunityTracking();
          break;
        case AppLifecycleState.resumed:
          _startCommunityTracking();
          break;
        default:
      }
    }
  }
}
