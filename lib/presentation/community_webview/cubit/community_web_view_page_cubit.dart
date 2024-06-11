import 'package:open_learning_smart_tv/core/env/env.dart';
import 'package:open_learning_smart_tv/domain/entities/user/user_info_model.dart';
import 'package:open_learning_smart_tv/domain/use_cases/get_secure_stored_user_info_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/smart_configurator/get_stored_smart_configuration_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'community_web_view_page_state.dart';
part 'community_web_view_page_cubit.freezed.dart';

@injectable
class CommunityWebViewPageCubit extends Cubit<CommunityWebViewPageState> {
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;
  final GetStoredSmartConfigurationUseCase _getStoredSmartConfigurationUseCase;

  String jwtToken = "";

  CommunityWebViewPageCubit(
    this._getSecureStoredUserInfoUseCase,
    this._getStoredSmartConfigurationUseCase,
  ) : super(const CommunityWebViewPageState.loading());

  void init() async {
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase.call();
    String? sessionId = userInfoModel?.sessionId;
    if (sessionId != null) {
      final smartConfig = await _getStoredSmartConfigurationUseCase();
      String url =
          ('https://${smartConfig?.urlDomain}.${smartConfig?.urlCorporateDomain}/?seed_session={sessionId}&mode=Cognito')
              .replaceFirst('{sessionId}', sessionId);
      String communityWebViewUrl =
          'https://${smartConfig?.urlDomain}.${smartConfig?.urlCorporateDomain}/community';
      emit(CommunityWebViewPageState.success(
          webViewUrl: url, communityUrl: communityWebViewUrl));
    }
  }
}
