// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_configurator_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartConfiguratorModel _$SmartConfiguratorModelFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SmartConfiguratorModel',
      json,
      ($checkedConvert) {
        final val = SmartConfiguratorModel(
          extScormTracker:
              $checkedConvert('EXT_SCORM_TRACKER', (v) => v as String?),
          extScormTrkAuthKey:
              $checkedConvert('EXT_SCORM_TRK_AUTH_KEY', (v) => v as String?),
          extXapiTracker:
              $checkedConvert('EXT_XAPI_TRACKER', (v) => v as String?),
          extXapiTrkAuthKey:
              $checkedConvert('EXT_XAPI_TRK_AUTH_KEY', (v) => v as String?),
          intScormTracker:
              $checkedConvert('INT_SCORM_TRACKER', (v) => v as String?),
          intXapiTracker:
              $checkedConvert('INT_XAPI_TRACKER', (v) => v as String?),
          aiSuggestedAltSlots:
              $checkedConvert('aiSuggestedAltSlots', (v) => v as int?),
          api: $checkedConvert('api', (v) => v as bool?),
          appNativa: $checkedConvert('appNativa', (v) => v as bool?),
          brandassetName:
              $checkedConvert('brandassetName', (v) => v as String?),
          carConteSpeciDurata:
              $checkedConvert('carConteSpeciDurata', (v) => v as bool?),
          chatbot: $checkedConvert('chatbot', (v) => v as bool?),
          communityDiscussion:
              $checkedConvert('communityDiscussion', (v) => v as bool?),
          communityFreePost:
              $checkedConvert('communityFreePost', (v) => v as bool?),
          communityShareContent:
              $checkedConvert('communityShareContent', (v) => v as bool?),
          creationDate: $checkedConvert('creationDate', (v) => v as String?),
          extscormtracker:
              $checkedConvert('extscormtracker', (v) => v as String?),
          extscormtrkauthkey:
              $checkedConvert('extscormtrkauthkey', (v) => v as String?),
          extxapitracker:
              $checkedConvert('extxapitracker', (v) => v as String?),
          extxapitrkauthkey:
              $checkedConvert('extxapitrkauthkey', (v) => v as String?),
          favourites: $checkedConvert('favourites', (v) => v as bool?),
          freshDesk: $checkedConvert('freshDesk', (v) => v as bool?),
          funcCommunity: $checkedConvert('funcCommunity', (v) => v as bool?),
          funcFavourites: $checkedConvert('funcFavourites', (v) => v as bool?),
          funcRating: $checkedConvert('funcRating', (v) => v as bool?),
          goalsWidgets: $checkedConvert('goalsWidgets', (v) => v as bool?),
          hrSuggestedAltSlots:
              $checkedConvert('hrSuggestedAltSlots', (v) => v as int?),
          idConfiguration: $checkedConvert('idConfiguration', (v) => v as int?),
          idCorporate: $checkedConvert('idCorporate', (v) => v as int?),
          idWidgetFreshdesk:
              $checkedConvert('idWidgetFreshdesk', (v) => v as int?),
          initiativeId: $checkedConvert('initiativeId', (v) => v as int?),
          initiativeName:
              $checkedConvert('initiativeName', (v) => v as String?),
          intscormtracker:
              $checkedConvert('intscormtracker', (v) => v as String?),
          intxapitracker:
              $checkedConvert('intxapitracker', (v) => v as String?),
          isDigitedDomain:
              $checkedConvert('isDigitedDomain', (v) => v as bool?),
          knowledgeDomainHRWeight: $checkedConvert(
              'knowledgeDomainHRWeight', (v) => (v as num?)?.toDouble()),
          knowledgeDomainManagerWeight: $checkedConvert(
              'knowledgeDomainManagerWeight', (v) => (v as num?)?.toDouble()),
          knowledgeDomainUserWeight: $checkedConvert(
              'knowledgeDomainUserWeight', (v) => (v as num?)?.toDouble()),
          lastSavedTemplateChannel:
              $checkedConvert('lastSavedTemplateChannel', (v) => v as String?),
          leaderboard: $checkedConvert('leaderboard', (v) => v as bool?),
          leaderboardAnonymous:
              $checkedConvert('leaderboardAnonymous', (v) => v as bool?),
          linkFeedRSS: $checkedConvert('linkFeedRSS', (v) => v as String?),
          logoBlackName: $checkedConvert('logoBlackName', (v) => v as String?),
          logoRgbName: $checkedConvert('logoRgbName', (v) => v as String?),
          logoWhiteName: $checkedConvert('logoWhiteName', (v) => v as String?),
          lrsEsterno: $checkedConvert('lrsEsterno', (v) => v as bool?),
          managerSuggestedAltSlots:
              $checkedConvert('managerSuggestedAltSlots', (v) => v as int?),
          mandatoryAltSlots:
              $checkedConvert('mandatoryAltSlots', (v) => v as int?),
          multiUserMassiv:
              $checkedConvert('multiUserMassiv', (v) => v as bool?),
          notificationName:
              $checkedConvert('notificationName', (v) => v as String?),
          progressWidget: $checkedConvert('progressWidget', (v) => v as bool?),
          ratingMax: $checkedConvert('ratingMax', (v) => v as int?),
          skillsHRWeight:
              $checkedConvert('skillsHRWeight', (v) => (v as num?)?.toDouble()),
          skillsUserWeight: $checkedConvert(
              'skillsUserWeight', (v) => (v as num?)?.toDouble()),
          sliderTopContentExplore:
              $checkedConvert('sliderTopContentExplore', (v) => v as bool?),
          smartLearning: $checkedConvert('smartLearning', (v) => v as bool?),
          statusConfigurator:
              $checkedConvert('statusConfigurator', (v) => v as String?),
          templateMailName:
              $checkedConvert('templateMailName', (v) => v as String?),
          templateWebappName:
              $checkedConvert('templateWebappName', (v) => v as String?),
          totalForYouSlots:
              $checkedConvert('totalForYouSlots', (v) => v as int?),
          trainingMandatory:
              $checkedConvert('trainingMandatory', (v) => v as bool?),
          updateDate: $checkedConvert('updateDate', (v) => v as String?),
          urlCorporateDomain:
              $checkedConvert('urlCorporateDomain', (v) => v as String?),
          urlDomain: $checkedConvert('urlDomain', (v) => v as String?),
          visCarBestRating:
              $checkedConvert('visCarBestRating', (v) => v as bool?),
          visCarCategory: $checkedConvert('visCarCategory', (v) => v as bool?),
          visCarSuggested:
              $checkedConvert('visCarSuggested', (v) => v as bool?),
          visCarTrainingByTrade:
              $checkedConvert('visCarTrainingByTrade', (v) => v as bool?),
          visCarTrainingTransversal:
              $checkedConvert('visCarTrainingTransversal', (v) => v as bool?),
          visForyou: $checkedConvert('visForyou', (v) => v as bool?),
          webDesktop: $checkedConvert('webDesktop', (v) => v as bool?),
          webMobile: $checkedConvert('webMobile', (v) => v as bool?),
          widgetBadge: $checkedConvert('widgetBadge', (v) => v as bool?),
          widgetCalendar: $checkedConvert('widgetCalendar', (v) => v as bool?),
          widgetContinueLearning:
              $checkedConvert('widgetContinueLearning', (v) => v as bool?),
          widgetNews: $checkedConvert('widgetNews', (v) => v as bool?),
        );
        return val;
      },
      fieldKeyMap: const {
        'extScormTracker': 'EXT_SCORM_TRACKER',
        'extScormTrkAuthKey': 'EXT_SCORM_TRK_AUTH_KEY',
        'extXapiTracker': 'EXT_XAPI_TRACKER',
        'extXapiTrkAuthKey': 'EXT_XAPI_TRK_AUTH_KEY',
        'intScormTracker': 'INT_SCORM_TRACKER',
        'intXapiTracker': 'INT_XAPI_TRACKER'
      },
    );

Map<String, dynamic> _$SmartConfiguratorModelToJson(
        SmartConfiguratorModel instance) =>
    <String, dynamic>{
      'EXT_SCORM_TRACKER': instance.extScormTracker,
      'EXT_SCORM_TRK_AUTH_KEY': instance.extScormTrkAuthKey,
      'EXT_XAPI_TRACKER': instance.extXapiTracker,
      'EXT_XAPI_TRK_AUTH_KEY': instance.extXapiTrkAuthKey,
      'INT_SCORM_TRACKER': instance.intScormTracker,
      'INT_XAPI_TRACKER': instance.intXapiTracker,
      'aiSuggestedAltSlots': instance.aiSuggestedAltSlots,
      'api': instance.api,
      'appNativa': instance.appNativa,
      'brandassetName': instance.brandassetName,
      'carConteSpeciDurata': instance.carConteSpeciDurata,
      'chatbot': instance.chatbot,
      'communityDiscussion': instance.communityDiscussion,
      'communityFreePost': instance.communityFreePost,
      'communityShareContent': instance.communityShareContent,
      'creationDate': instance.creationDate,
      'extscormtracker': instance.extscormtracker,
      'extscormtrkauthkey': instance.extscormtrkauthkey,
      'extxapitracker': instance.extxapitracker,
      'extxapitrkauthkey': instance.extxapitrkauthkey,
      'favourites': instance.favourites,
      'freshDesk': instance.freshDesk,
      'funcCommunity': instance.funcCommunity,
      'funcFavourites': instance.funcFavourites,
      'funcRating': instance.funcRating,
      'goalsWidgets': instance.goalsWidgets,
      'hrSuggestedAltSlots': instance.hrSuggestedAltSlots,
      'idConfiguration': instance.idConfiguration,
      'idCorporate': instance.idCorporate,
      'idWidgetFreshdesk': instance.idWidgetFreshdesk,
      'initiativeId': instance.initiativeId,
      'initiativeName': instance.initiativeName,
      'intscormtracker': instance.intscormtracker,
      'intxapitracker': instance.intxapitracker,
      'isDigitedDomain': instance.isDigitedDomain,
      'knowledgeDomainHRWeight': instance.knowledgeDomainHRWeight,
      'knowledgeDomainManagerWeight': instance.knowledgeDomainManagerWeight,
      'knowledgeDomainUserWeight': instance.knowledgeDomainUserWeight,
      'lastSavedTemplateChannel': instance.lastSavedTemplateChannel,
      'leaderboard': instance.leaderboard,
      'leaderboardAnonymous': instance.leaderboardAnonymous,
      'linkFeedRSS': instance.linkFeedRSS,
      'logoBlackName': instance.logoBlackName,
      'logoRgbName': instance.logoRgbName,
      'logoWhiteName': instance.logoWhiteName,
      'lrsEsterno': instance.lrsEsterno,
      'managerSuggestedAltSlots': instance.managerSuggestedAltSlots,
      'mandatoryAltSlots': instance.mandatoryAltSlots,
      'multiUserMassiv': instance.multiUserMassiv,
      'notificationName': instance.notificationName,
      'progressWidget': instance.progressWidget,
      'ratingMax': instance.ratingMax,
      'skillsHRWeight': instance.skillsHRWeight,
      'skillsUserWeight': instance.skillsUserWeight,
      'sliderTopContentExplore': instance.sliderTopContentExplore,
      'smartLearning': instance.smartLearning,
      'statusConfigurator': instance.statusConfigurator,
      'templateMailName': instance.templateMailName,
      'templateWebappName': instance.templateWebappName,
      'totalForYouSlots': instance.totalForYouSlots,
      'trainingMandatory': instance.trainingMandatory,
      'updateDate': instance.updateDate,
      'urlCorporateDomain': instance.urlCorporateDomain,
      'urlDomain': instance.urlDomain,
      'visCarBestRating': instance.visCarBestRating,
      'visCarCategory': instance.visCarCategory,
      'visCarSuggested': instance.visCarSuggested,
      'visCarTrainingByTrade': instance.visCarTrainingByTrade,
      'visCarTrainingTransversal': instance.visCarTrainingTransversal,
      'visForyou': instance.visForyou,
      'webDesktop': instance.webDesktop,
      'webMobile': instance.webMobile,
      'widgetBadge': instance.widgetBadge,
      'widgetCalendar': instance.widgetCalendar,
      'widgetContinueLearning': instance.widgetContinueLearning,
      'widgetNews': instance.widgetNews,
    };
