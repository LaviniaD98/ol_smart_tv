part of 'notification_cubit.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState.done(List<NotificationModel> items) = Done;
  const factory NotificationState.loading() = Loading;
  const factory NotificationState.empty() = Empty;
  const factory NotificationState.error() = Error;
}
