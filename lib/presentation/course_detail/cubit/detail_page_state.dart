part of 'detail_page_cubit.dart';

@freezed
class DetailPageState with _$DetailPageState {
  const factory DetailPageState.initial() = Initial;
  const factory DetailPageState.autoEnroll(DetailPageModel data) = AutoEnroll;
  const factory DetailPageState.autoEnrollFail(EnrollmentModel eres) = AutoEnrollFail;
  const factory DetailPageState.success(int selectedIndex, DetailPageModel data, SmartConfiguratorModel? smartConfig) = Success;
  const factory DetailPageState.readyToPlay(LearningObjectModel model, DetailPageModel data, BuildContext? playerContext) = ReadyToPlay;
  const factory DetailPageState.openDetail(LearningObjectModel model, DetailPageModel data) = OpenDetail;
  const factory DetailPageState.loading() = Loading;
  const factory DetailPageState.error() = Error;
  const factory DetailPageState.errorWithDialog(String message) = ErrorWithDialog;
}
