import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/domain/use_cases/assets/get_app_resource_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/set_stored_user_self_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/smart_configurator/get_colors_use_case.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/logo_app_header/cubit/app_logo_cubit.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/cubit/community_wall_cubit.dart';
import 'package:open_learning_smart_tv/remote_theming/config/config_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/config/remote_config_keys.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/requests/initiative_body_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/menu/route/menu_route.dart';
import 'package:open_learning_smart_tv/domain/entities/self/self_model.dart';
import 'package:open_learning_smart_tv/domain/entities/user/user_info_model.dart';
import 'package:open_learning_smart_tv/domain/use_cases/get_menu_structure_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/get_secure_stored_user_info_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/session/set_initiative_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/set_secure_stored_user_info_use_case.dart';

import '../../../domain/use_cases/clean_local_datatbase_use_case.dart';
import '../../../domain/use_cases/session/check_session_use_case.dart';
import '../../../domain/use_cases/session/get_stored_corporate_id_use_case.dart';
import '../../../domain/use_cases/smart_configurator/get_smart_configuration_use_case.dart';
import '../../../domain/use_cases/smart_configurator/set_stored_smart_configuration_use_case.dart';
import '../../../remote_theming/labels/remote_labels.dart';
import '../../../wrappers/notification/notification_manager.dart';
import '../../notification/notification_page.dart';

part 'initiatives_state.dart';
part 'initiatives_cubit.freezed.dart';

@injectable
class InitiativesCubit extends Cubit<InitiativesState> {
  final SetInitiativeUseCase _setInitiativeUseCase;
  final SetStoredUserSelfUseCase _setStoredUserSelfUseCase;
  final SetSecureStoredUserInfoUseCase _setSecureStoredUserInfoUseCase;
  final GetMenuStructureUseCase _getMenuStructureUseCase;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;
  final GetSmartConfigurationUseCase _getSmartConfigurationUseCase;
  final GetStoredCorporateIdUseCase _getStoredCorporateIdUseCase;
  final SetStoredSmartConfigurationUseCase _setStoredSmartConfigurationUseCase;
  final NotificationManager _notificationManager;
  final CleanLocalDatabaseUseCase _cleanLocalDatabaseUseCase;
  final CheckSessionUseCase _checkSessionUseCase;
  final GetColorsUseCase _getColorsUseCase;
  final RemoteLabels _remoteLabels;
  final CommunityWallCubit _communityWallCubit;
  final GetAppresourceUseCase _getAppresourceUseCase;

  InitiativesCubit(
    this._setInitiativeUseCase,
    this._setStoredUserSelfUseCase,
    this._setSecureStoredUserInfoUseCase,
    this._getMenuStructureUseCase,
    this._getSecureStoredUserInfoUseCase,
    this._getSmartConfigurationUseCase,
    this._getStoredCorporateIdUseCase,
    this._setStoredSmartConfigurationUseCase,
    this._notificationManager,
    this._cleanLocalDatabaseUseCase,
    this._checkSessionUseCase,
    this._getColorsUseCase,
    this._remoteLabels,
    this._communityWallCubit,
    this._getAppresourceUseCase,
  ) : super(const InitiativesState.loading());

  void init(SelfModel selfModel, CognitoUserSession? session, String? sessionId,
      bool isfromSettings) async {
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase.call();
    int? initiativeId = userInfoModel?.initiativeId;
    if (initiativeId != null) {
      await _setStoredUserSelfUseCase(selfModel);
      await _getSmartConfiguration(initiativeId);
    } else {
      if (selfModel.initiatives?.length == 1 && !isfromSettings) {
        await setInitiative(
            session: session!,
            sessionId: sessionId ?? "",
            selfModel: selfModel,
            initiativeId: selfModel.initiatives![0].id!);
      } else {
        emit(const InitiativesState.initial());
      }
    }
  }

  Future<void> setInitiative(
      {required CognitoUserSession session,
      required SelfModel selfModel,
      required String sessionId,
      required int initiativeId}) async {
    emit(const InitiativesState.loading());
    final res = await _setInitiativeUseCase(
        session,
        InitiativeBodyDto.fromPredefinedConfig(
            sessionId: sessionId, initiativeId: initiativeId));
    res.fold((l) {
      emit(const InitiativesState.initial());
      emit(InitiativesState.error(LabelsManager().getRemoteStringFromLabelKeys(
          RemoteLabelKeys.initiative_setinitiatie_error)));
    }, (id) {
      _checkSession(
        session: session,
        selfModel: selfModel,
        initiativeId: initiativeId,
        sessionId: id,
      );
    });
  }

  Future<void> _checkSession({
    required CognitoUserSession session,
    required SelfModel selfModel,
    required String sessionId,
    required int initiativeId,
  }) async {
    final res = await _checkSessionUseCase(session, sessionId);
    res.fold((l) {
      emit(const InitiativesState.initial());
      emit(InitiativesState.error(LabelsManager().getRemoteStringFromLabelKeys(
          RemoteLabelKeys.initiative_session_error)));
    }, (checkSessionModel) async {
      final userInfoModel =
          UserInfoModel(sessionId, initiativeId, checkSessionModel.user);

      /// if the new login is made by a different user, clean local database
      await _cleanLocalDatabaseUseCase(userInfoModel);

      await _setSecureStoredUserInfoUseCase(userInfoModel);
      await _setStoredUserSelfUseCase(selfModel);
      await _getSmartConfiguration(initiativeId);
    });
  }

  Future<void> _getMenuStructure(int initiativeId, bool? funcCommunity) async {
    final corporateInfo = await _getStoredCorporateIdUseCase();
    final res =
        await _getMenuStructureUseCase(corporateInfo?.id ?? 0, initiativeId);
    res.fold(
      (l) {
        emit(const InitiativesState.initial());
        emit(InitiativesState.error(LabelsManager()
            .getRemoteStringFromLabelKeys(
                RemoteLabelKeys.initiative_menu_error)));
      },
      (r) async {
        List<MenuRoute>? relativePaths = r.relativePaths;
        if (relativePaths != null && funcCommunity != true) {
          relativePaths.removeWhere((route) => (route is VisCommunity));
        }
        await _notificationManager.initPushNotification();
        await ColorManager().retrieveBaseColors(rootBundle);
        if (ConfigManager()
            .getRemoteBoolean(RemoteConfigKeys.remote_colors, false)) {
          final colors = await _getColorsUseCase("$initiativeId");
          colors.fold((l) async {
            await ColorManager().retrieveBaseColors(rootBundle);
          }, (colorList) async {
            await ColorManager().setColors(colorList);
          });
        }

        if (relativePaths != null && relativePaths.isNotEmpty) {
          String? initialRoute;
          final entryPoint = relativePaths
                  .firstWhereOrNull((element) => element.preSelected == true)
                  ?.id
                  .toString()
                  .path ??
              relativePaths.first.id.toString().path;
          if (relativePaths
                      .firstWhereOrNull((element) => element is VisForYou) !=
                  null &&
              await _notificationManager.hasMessage()) {
            initialRoute = '$entryPoint/${NotificationPage.routeName}';
          }
          if (funcCommunity == true &&
              relativePaths
                      .firstWhereOrNull((route) => route is VisCommunity) !=
                  null) {
            await _communityWallCubit.init(relativePaths
                .firstWhereOrNull((route) => route is VisCommunity)!
                .apiPath);
            await _communityWallCubit.refresh();
          }
          emit(InitiativesState.success(
              relativePaths, initialRoute ?? entryPoint));
        } else {
          emit(const InitiativesState.error('No routes found'));
        }
      },
    );
  }

  Future<void> _getSmartConfiguration(int initiativeId) async {
    final corporateInfo = await _getStoredCorporateIdUseCase();
    final res = await _getSmartConfigurationUseCase(
      '${corporateInfo?.id}',
      '$initiativeId',
    );

    res.fold(
      (l) {
        emit(const InitiativesState.initial());
        emit(InitiativesState.error(LabelsManager()
            .getRemoteStringFromLabelKeys(
                RemoteLabelKeys.initiative_smartconfig_error)));
      },
      (smartConfiguratorModel) async {
        //get remote logo
        if (ConfigManager()
            .getRemoteBoolean(RemoteConfigKeys.remote_app_header_logo, false)) {
          var logoName =
              "${smartConfiguratorModel.initiativeName}_${AppLogoCubit.localLogoName}";
          final appResourceResponse =
              await _getAppresourceUseCase('${corporateInfo?.id}', logoName);
          appResourceResponse.fold(
            (l) {
              if (kDebugMode)
                print("error while invoking _getAppresourceUseCase");
            },
            (appResourceGetFileModel) async {
              if (kDebugMode)
                print(
                    "_getAppresourceUseCase response: $appResourceGetFileModel");
            },
          );
        }
        await _remoteLabels.getLanguages(corporateId: corporateInfo?.id);
        await _setStoredSmartConfigurationUseCase(smartConfiguratorModel);
        await _getMenuStructure(
            initiativeId, smartConfiguratorModel.funcCommunity);
      },
    );
  }
}
