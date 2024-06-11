import 'package:open_learning_smart_tv/domain/entities/notification/notification_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_cases/notification/get_notifications_use_case.dart';
import '../../../domain/use_cases/notification/set_notification_read_use_case.dart';

part 'notification_state.dart';
part 'notification_cubit.freezed.dart';

@singleton
class NotificationCubit extends Cubit<NotificationState> {
  final GetNotificationsUseCase _getNotificationsUseCase;
  final SetNotificationsUseCase _setNotificationsUseCase;

  NotificationCubit(
    this._getNotificationsUseCase,
    this._setNotificationsUseCase,
  ) : super(const NotificationState.loading());

  void fetch() async {
    if (state != const NotificationState.loading())
      emit(const NotificationState.loading());
    final res = await _getNotificationsUseCase();
    res.fold((l) {
      emit(const NotificationState.error());
    }, (r) {
      if (r.isEmpty) {
        emit(const NotificationState.empty());
      } else {
        emit(NotificationState.done(r.reversed.toList()));
      }
    });
  }

  void setRead(NotificationModel item) async {
    final res = await _setNotificationsUseCase(item.eventSentId);
    res.fold((l) => null, (r) => fetch());
  }
}


/// OLD LOCAL NOTIFICATION
// import 'package:open_learning_smart_tv/core/database/app_database.dart';
// import 'package:bloc/bloc.dart';
// import 'package:flutter/foundation.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:injectable/injectable.dart';
//
// import '../../../core/database/tables/local_notifications/local_notifications_dao.dart';
//
// part 'notification_state.dart';
// part 'notification_cubit.freezed.dart';
//
// @singleton
// class NotificationCubit extends Cubit<NotificationState> {
//   final LocalNotificationsDao _localNotificationsDao;
//
//   NotificationCubit(
//       this._localNotificationsDao,
//       ) : super(const NotificationState.loading()) {
//     _localNotificationsDao.cleanOldItems();
//   }
//
//   void fetch() async {
//     emit(const NotificationState.loading());
//     final res = await _localNotificationsDao.getAll();
//     res.fold((l) {
//       emit(const NotificationState.error());
//     }, (r) {
//       if(r.isEmpty) {
//         emit(const NotificationState.empty());
//       } else {
//         emit(NotificationState.done(r.reversed.toList()));
//       }
//     });
//   }
//
//   void setRead(LocalNotification item) async {
//     _localNotificationsDao.setRead(item.id);
//     fetch();
//   }
// }
