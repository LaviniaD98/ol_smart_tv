part of 'profile_page_cubit.dart';

@freezed
class ProfilePageState with _$ProfilePageState {
  const factory ProfilePageState.loading() = _Loading;
  const factory ProfilePageState.error() = _Error;
  const factory ProfilePageState.success({
    UserInfoModel? userInfoModel,
    String? imageUrl,
    ProgressGoalsConfigModel? progressGoalsConfig,
    LearnerGoalsModel? goals,
    LearnerProgressModel? progress,
  }) = _Success;
}