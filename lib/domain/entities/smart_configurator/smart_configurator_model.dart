import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/responses/smart_configurator/smart_configurator_dto.dart';

part 'smart_configurator_model.g.dart';

@JsonSerializable(createToJson: true, checked: true)
class SmartConfiguratorModel {
  SmartConfiguratorModel({
    this.extScormTracker,
    this.extScormTrkAuthKey,
    this.extXapiTracker,
    this.extXapiTrkAuthKey,
    this.intScormTracker,
    this.intXapiTracker,
    this.aiSuggestedAltSlots,
    this.api,
    this.appNativa,
    this.brandassetName,
    this.carConteSpeciDurata,
    this.chatbot,
    this.communityDiscussion,
    this.communityFreePost,
    this.communityShareContent,
    this.creationDate,
    this.extscormtracker,
    this.extscormtrkauthkey,
    this.extxapitracker,
    this.extxapitrkauthkey,
    this.favourites,
    this.freshDesk,
    this.funcCommunity,
    this.funcFavourites,
    this.funcRating,
    this.goalsWidgets,
    this.hrSuggestedAltSlots,
    this.idConfiguration,
    this.idCorporate,
    this.idWidgetFreshdesk,
    this.initiativeId,
    this.initiativeName,
    this.intscormtracker,
    this.intxapitracker,
    this.isDigitedDomain,
    this.knowledgeDomainHRWeight,
    this.knowledgeDomainManagerWeight,
    this.knowledgeDomainUserWeight,
    this.lastSavedTemplateChannel,
    this.leaderboard,
    this.leaderboardAnonymous,
    this.linkFeedRSS,
    this.logoBlackName,
    this.logoRgbName,
    this.logoWhiteName,
    this.lrsEsterno,
    this.managerSuggestedAltSlots,
    this.mandatoryAltSlots,
    this.multiUserMassiv,
    this.notificationName,
    this.progressWidget,
    this.ratingMax,
    this.skillsHRWeight,
    this.skillsUserWeight,
    this.sliderTopContentExplore,
    this.smartLearning,
    this.statusConfigurator,
    this.templateMailName,
    this.templateWebappName,
    this.totalForYouSlots,
    this.trainingMandatory,
    this.updateDate,
    this.urlCorporateDomain,
    this.urlDomain,
    this.visCarBestRating,
    this.visCarCategory,
    this.visCarSuggested,
    this.visCarTrainingByTrade,
    this.visCarTrainingTransversal,
    this.visForyou,
    this.webDesktop,
    this.webMobile,
    this.widgetBadge,
    this.widgetCalendar,
    this.widgetContinueLearning,
    this.widgetNews,
  });

  factory SmartConfiguratorModel.fromJson(Map<String, dynamic> json) => _$SmartConfiguratorModelFromJson(json);
  Map<String, dynamic> toJson() => _$SmartConfiguratorModelToJson(this);

  factory SmartConfiguratorModel.fromDto(SmartConfiguratorDto dto) {
    return SmartConfiguratorModel(
        extScormTracker: dto.extScormTracker,
        extScormTrkAuthKey: dto.extScormTrkAuthKey,
        extXapiTracker: dto.extXapiTracker,
        extXapiTrkAuthKey: dto.extXapiTrkAuthKey,
        intScormTracker: dto.intScormTracker,
        intXapiTracker: dto.intXapiTracker,
        aiSuggestedAltSlots: dto.aiSuggestedAltSlots,
        api: dto.api,
        appNativa: dto.appNativa,
        brandassetName: dto.brandassetName,
        carConteSpeciDurata: dto.carConteSpeciDurata,
        chatbot: dto.chatbot,
        communityDiscussion: dto.communityDiscussion,
        communityFreePost: dto.communityFreePost,
        communityShareContent: dto.communityShareContent,
        creationDate: dto.creationDate,
        extscormtracker: dto.extscormtracker,
        extscormtrkauthkey: dto.extscormtrkauthkey,
        extxapitracker: dto.extxapitracker,
        extxapitrkauthkey: dto.extxapitrkauthkey,
        favourites: dto.favourites,
        freshDesk: dto.freshDesk,
        funcCommunity: dto.funcCommunity,
        funcFavourites: dto.funcFavourites,
        funcRating: dto.funcRating,
        goalsWidgets: dto.goalsWidgets,
        hrSuggestedAltSlots: dto.hrSuggestedAltSlots,
        idConfiguration: dto.idConfiguration,
        idCorporate: dto.idCorporate,
        idWidgetFreshdesk: dto.idWidgetFreshdesk,
        initiativeId: dto.initiativeId,
        initiativeName: dto.initiativeName,
        intscormtracker: dto.intscormtracker,
        intxapitracker: dto.intxapitracker,
        isDigitedDomain: dto.isDigitedDomain,
        knowledgeDomainHRWeight: dto.knowledgeDomainHRWeight,
        knowledgeDomainManagerWeight: dto.knowledgeDomainManagerWeight,
        knowledgeDomainUserWeight: dto.knowledgeDomainUserWeight,
        lastSavedTemplateChannel: dto.lastSavedTemplateChannel,
        leaderboard: dto.leaderboard,
        leaderboardAnonymous: dto.leaderboardAnonymous,
        linkFeedRSS: dto.linkFeedRSS,
        logoBlackName: dto.logoBlackName,
        logoRgbName: dto.logoRgbName,
        logoWhiteName: dto.logoWhiteName,
        lrsEsterno: dto.lrsEsterno,
        managerSuggestedAltSlots: dto.managerSuggestedAltSlots,
        mandatoryAltSlots: dto.mandatoryAltSlots,
        multiUserMassiv: dto.multiUserMassiv,
        notificationName: dto.notificationName,
        progressWidget: dto.progressWidget,
        ratingMax: dto.ratingMax,
        skillsHRWeight: dto.skillsHRWeight,
        skillsUserWeight: dto.skillsUserWeight,
        sliderTopContentExplore: dto.sliderTopContentExplore,
        smartLearning: dto.smartLearning,
        statusConfigurator: dto.statusConfigurator,
        templateMailName: dto.templateMailName,
        templateWebappName: dto.templateWebappName,
        totalForYouSlots: dto.totalForYouSlots,
        trainingMandatory: dto.trainingMandatory,
        updateDate: dto.updateDate,
        urlCorporateDomain: dto.urlCorporateDomain,
        urlDomain: dto.urlDomain,
        visCarBestRating: dto.visCarBestRating,
        visCarCategory: dto.visCarCategory,
        visCarSuggested: dto.visCarSuggested,
        visCarTrainingByTrade: dto.visCarTrainingByTrade,
        visCarTrainingTransversal: dto.visCarTrainingTransversal,
        visForyou: dto.visForyou,
        webDesktop: dto.webDesktop,
        webMobile: dto.webMobile,
        widgetBadge: dto.widgetBadge,
        widgetCalendar: dto.widgetCalendar,
        widgetContinueLearning: dto.widgetContinueLearning,
        widgetNews: dto.widgetNews,
    );
  }

  @JsonKey(name: 'EXT_SCORM_TRACKER')
  final String? extScormTracker;
  @JsonKey(name: 'EXT_SCORM_TRK_AUTH_KEY')
  final String? extScormTrkAuthKey;
  @JsonKey(name: 'EXT_XAPI_TRACKER')
  final String? extXapiTracker;
  @JsonKey(name: 'EXT_XAPI_TRK_AUTH_KEY')
  final String? extXapiTrkAuthKey;
  @JsonKey(name: 'INT_SCORM_TRACKER')
  final String? intScormTracker;
  @JsonKey(name: 'INT_XAPI_TRACKER')
  final String? intXapiTracker;
  @JsonKey(name: 'aiSuggestedAltSlots')
  final int? aiSuggestedAltSlots;
  @JsonKey(name: 'api')
  final bool? api;
  @JsonKey(name: 'appNativa')
  final bool? appNativa;
  @JsonKey(name: 'brandassetName')
  final String? brandassetName;
  @JsonKey(name: 'carConteSpeciDurata')
  final bool? carConteSpeciDurata;
  @JsonKey(name: 'chatbot')
  final bool? chatbot;
  @JsonKey(name: 'communityDiscussion')
  final bool? communityDiscussion;
  @JsonKey(name: 'communityFreePost')
  final bool? communityFreePost;
  @JsonKey(name: 'communityShareContent')
  final bool? communityShareContent;
  @JsonKey(name: 'creationDate')
  final String? creationDate;
  @JsonKey(name: 'extscormtracker')
  final String? extscormtracker;
  @JsonKey(name: 'extscormtrkauthkey')
  final String? extscormtrkauthkey;
  @JsonKey(name: 'extxapitracker')
  final String? extxapitracker;
  @JsonKey(name: 'extxapitrkauthkey')
  final String? extxapitrkauthkey;
  @JsonKey(name: 'favourites')
  final bool? favourites;
  @JsonKey(name: 'freshDesk')
  final bool? freshDesk;
  @JsonKey(name: 'funcCommunity')
  final bool? funcCommunity;
  @JsonKey(name: 'funcFavourites')
  final bool? funcFavourites;
  @JsonKey(name: 'funcRating')
  final bool? funcRating;
  @JsonKey(name: 'goalsWidgets')
  final bool? goalsWidgets;
  @JsonKey(name: 'hrSuggestedAltSlots')
  final int? hrSuggestedAltSlots;
  @JsonKey(name: 'idConfiguration')
  final int? idConfiguration;
  @JsonKey(name: 'idCorporate')
  final int? idCorporate;
  @JsonKey(name: 'idWidgetFreshdesk')
  final int? idWidgetFreshdesk;
  @JsonKey(name: 'initiativeId')
  final int? initiativeId;
  @JsonKey(name: 'initiativeName')
  final String? initiativeName;
  @JsonKey(name: 'intscormtracker')
  final String? intscormtracker;
  @JsonKey(name: 'intxapitracker')
  final String? intxapitracker;
  @JsonKey(name: 'isDigitedDomain')
  final bool? isDigitedDomain;
  @JsonKey(name: 'knowledgeDomainHRWeight')
  final double? knowledgeDomainHRWeight;
  @JsonKey(name: 'knowledgeDomainManagerWeight')
  final double? knowledgeDomainManagerWeight;
  @JsonKey(name: 'knowledgeDomainUserWeight')
  final double? knowledgeDomainUserWeight;
  @JsonKey(name: 'lastSavedTemplateChannel')
  final String? lastSavedTemplateChannel;
  @JsonKey(name: 'leaderboard')
  final bool? leaderboard;
  @JsonKey(name: 'leaderboardAnonymous')
  final bool? leaderboardAnonymous;
  @JsonKey(name: 'linkFeedRSS')
  final String? linkFeedRSS;
  @JsonKey(name: 'logoBlackName')
  final String? logoBlackName;
  @JsonKey(name: 'logoRgbName')
  final String? logoRgbName;
  @JsonKey(name: 'logoWhiteName')
  final String? logoWhiteName;
  @JsonKey(name: 'lrsEsterno')
  final bool? lrsEsterno;
  @JsonKey(name: 'managerSuggestedAltSlots')
  final int? managerSuggestedAltSlots;
  @JsonKey(name: 'mandatoryAltSlots')
  final int? mandatoryAltSlots;
  @JsonKey(name: 'multiUserMassiv')
  final bool? multiUserMassiv;
  @JsonKey(name: 'notificationName')
  final String? notificationName;
  @JsonKey(name: 'progressWidget')
  final bool? progressWidget;
  @JsonKey(name: 'ratingMax')
  final int? ratingMax;
  @JsonKey(name: 'skillsHRWeight')
  final double? skillsHRWeight;
  @JsonKey(name: 'skillsUserWeight')
  final double? skillsUserWeight;
  @JsonKey(name: 'sliderTopContentExplore')
  final bool? sliderTopContentExplore;
  @JsonKey(name: 'smartLearning')
  final bool? smartLearning;
  @JsonKey(name: 'statusConfigurator')
  final String? statusConfigurator;
  @JsonKey(name: 'templateMailName')
  final String? templateMailName;
  @JsonKey(name: 'templateWebappName')
  final String? templateWebappName;
  @JsonKey(name: 'totalForYouSlots')
  final int? totalForYouSlots;
  @JsonKey(name: 'trainingMandatory')
  final bool? trainingMandatory;
  @JsonKey(name: 'updateDate')
  final String? updateDate;
  @JsonKey(name: 'urlCorporateDomain')
  final String? urlCorporateDomain;
  @JsonKey(name: 'urlDomain')
  final String? urlDomain;
  @JsonKey(name: 'visCarBestRating')
  final bool? visCarBestRating;
  @JsonKey(name: 'visCarCategory')
  final bool? visCarCategory;
  @JsonKey(name: 'visCarSuggested')
  final bool? visCarSuggested;
  @JsonKey(name: 'visCarTrainingByTrade')
  final bool? visCarTrainingByTrade;
  @JsonKey(name: 'visCarTrainingTransversal')
  final bool? visCarTrainingTransversal;
  @JsonKey(name: 'visForyou')
  final bool? visForyou;
  @JsonKey(name: 'webDesktop')
  final bool? webDesktop;
  @JsonKey(name: 'webMobile')
  final bool? webMobile;
  @JsonKey(name: 'widgetBadge')
  final bool? widgetBadge;
  @JsonKey(name: 'widgetCalendar')
  final bool? widgetCalendar;
  @JsonKey(name: 'widgetContinueLearning')
  final bool? widgetContinueLearning;
  @JsonKey(name: 'widgetNews')
  final bool? widgetNews;
}