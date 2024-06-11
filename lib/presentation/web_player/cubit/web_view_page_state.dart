part of 'web_view_page_cubit.dart';

@freezed
class WebViewPageState with _$WebViewPageState {
  const factory WebViewPageState.loading() = _loading;
  const factory WebViewPageState.init() = _init;
  const factory WebViewPageState.getToken() = _getToken;
  const factory WebViewPageState.error() = _error;
  const factory WebViewPageState.success(String playerUrl) = _Success;
}