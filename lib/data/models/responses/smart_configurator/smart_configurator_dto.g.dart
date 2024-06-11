// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_configurator_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartConfiguratorDto _$SmartConfiguratorDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SmartConfiguratorDto',
      json,
      ($checkedConvert) {
        final val = SmartConfiguratorDto(
          $checkedConvert('EXT_SCORM_TRACKER', (v) => v as String?),
          $checkedConvert('EXT_SCORM_TRK_AUTH_KEY', (v) => v as String?),
          $checkedConvert('EXT_XAPI_TRACKER', (v) => v as String?),
          $checkedConvert('EXT_XAPI_TRK_AUTH_KEY', (v) => v as String?),
          $checkedConvert('INT_SCORM_TRACKER', (v) => v as String?),
          $checkedConvert('INT_XAPI_TRACKER', (v) => v as String?),
          $checkedConvert('aiSuggestedAltSlots', (v) => v as int?),
          $checkedConvert('api', (v) => v as bool?),
          $checkedConvert('appNativa', (v) => v as bool?),
          $checkedConvert('brandassetName', (v) => v as String?),
          $checkedConvert('carConteSpeciDurata', (v) => v as bool?),
          $checkedConvert('chatbot', (v) => v as bool?),
          $checkedConvert('communityDiscussion', (v) => v as bool?),
          $checkedConvert('communityFreePost', (v) => v as bool?),
          $checkedConvert('communityShareContent', (v) => v as bool?),
          $checkedConvert('creationDate', (v) => v as String?),
          $checkedConvert('extscormtracker', (v) => v as String?),
          $checkedConvert('extscormtrkauthkey', (v) => v as String?),
          $checkedConvert('extxapitracker', (v) => v as String?),
          $checkedConvert('extxapitrkauthkey', (v) => v as String?),
          $checkedConvert('favourites', (v) => v as bool?),
          $checkedConvert('freshDesk', (v) => v as bool?),
          $checkedConvert('funcCommunity', (v) => v as bool?),
          $checkedConvert('funcFavourites', (v) => v as bool?),
          $checkedConvert('funcRating', (v) => v as bool?),
          $checkedConvert('goalsWidgets', (v) => v as bool?),
          $checkedConvert('hrSuggestedAltSlots', (v) => v as int?),
          $checkedConvert('idConfiguration', (v) => v as int?),
          $checkedConvert('idCorporate', (v) => v as int?),
          $checkedConvert('idWidgetFreshdesk', (v) => v as int?),
          $checkedConvert('initiativeId', (v) => v as int?),
          $checkedConvert('initiativeName', (v) => v as String?),
          $checkedConvert('intscormtracker', (v) => v as String?),
          $checkedConvert('intxapitracker', (v) => v as String?),
          $checkedConvert('isDigitedDomain', (v) => v as bool?),
          $checkedConvert(
              'knowledgeDomainHRWeight', (v) => (v as num?)?.toDouble()),
          $checkedConvert(
              'knowledgeDomainManagerWeight', (v) => (v as num?)?.toDouble()),
          $checkedConvert(
              'knowledgeDomainUserWeight', (v) => (v as num?)?.toDouble()),
          $checkedConvert('lastSavedTemplateChannel', (v) => v as String?),
          $checkedConvert('leaderboard', (v) => v as bool?),
          $checkedConvert('leaderboardAnonymous', (v) => v as bool?),
          $checkedConvert('linkFeedRSS', (v) => v as String?),
          $checkedConvert('logoBlackName', (v) => v as String?),
          $checkedConvert('logoRgbName', (v) => v as String?),
          $checkedConvert('logoWhiteName', (v) => v as String?),
          $checkedConvert('lrsEsterno', (v) => v as bool?),
          $checkedConvert('managerSuggestedAltSlots', (v) => v as int?),
          $checkedConvert('mandatoryAltSlots', (v) => v as int?),
          $checkedConvert('multiUserMassiv', (v) => v as bool?),
          $checkedConvert('notificationName', (v) => v as String?),
          $checkedConvert('progressWidget', (v) => v as bool?),
          $checkedConvert('ratingMax', (v) => v as int?),
          $checkedConvert('skillsHRWeight', (v) => (v as num?)?.toDouble()),
          $checkedConvert('skillsUserWeight', (v) => (v as num?)?.toDouble()),
          $checkedConvert('sliderTopContentExplore', (v) => v as bool?),
          $checkedConvert('smartLearning', (v) => v as bool?),
          $checkedConvert('statusConfigurator', (v) => v as String?),
          $checkedConvert('templateMailName', (v) => v as String?),
          $checkedConvert('templateWebappName', (v) => v as String?),
          $checkedConvert('totalForYouSlots', (v) => v as int?),
          $checkedConvert('trainingMandatory', (v) => v as bool?),
          $checkedConvert('updateDate', (v) => v as String?),
          $checkedConvert('urlCorporateDomain', (v) => v as String?),
          $checkedConvert('urlDomain', (v) => v as String?),
          $checkedConvert('visCarBestRating', (v) => v as bool?),
          $checkedConvert('visCarCategory', (v) => v as bool?),
          $checkedConvert('visCarSuggested', (v) => v as bool?),
          $checkedConvert('visCarTrainingByTrade', (v) => v as bool?),
          $checkedConvert('visCarTrainingTransversal', (v) => v as bool?),
          $checkedConvert('visForyou', (v) => v as bool?),
          $checkedConvert('webDesktop', (v) => v as bool?),
          $checkedConvert('webMobile', (v) => v as bool?),
          $checkedConvert('widgetBadge', (v) => v as bool?),
          $checkedConvert('widgetCalendar', (v) => v as bool?),
          $checkedConvert('widgetContinueLearning', (v) => v as bool?),
          $checkedConvert('widgetNews', (v) => v as bool?),
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
