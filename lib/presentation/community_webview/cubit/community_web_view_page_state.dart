part of 'community_web_view_page_cubit.dart';

@freezed
class CommunityWebViewPageState with _$CommunityWebViewPageState {
  const factory CommunityWebViewPageState.loading() = Loading;
  const factory CommunityWebViewPageState.init() = Init;
  const factory CommunityWebViewPageState.error() = Error;
  const factory CommunityWebViewPageState.success({required String webViewUrl, required String communityUrl}) = Success;
}