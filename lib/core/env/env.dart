import 'package:injectable/injectable.dart';

abstract class Env {

  String get baseUrl;

  String get lmsPlayerUrlScorm;
  String get lmsPlayerUrlXapi;
  String get lmsPlayerUrlYoutube;
  String get lmsPlayerUrlLinkedin;
  String get lmsPlayerUrlGoalsPlayerMobile;
  String get lmsPlayerUrlFinalBalancePlayerMobile;
  String get lmsPlayerUrlMaterialPlayerMobile;
  String get lmsPlayerUrlSurvey;
  String get lmsPlayerUrlExternalResource;

  ///SSO parameters
  String get openidConfigUrl;

  String get brightcoveDownloadUrl;
  String get viteSCORMTracker;

  String get trackingIdUrl;
  String get viteXAPITracker;

  String get freshDeskHtmlPageUrl;

  String get name;
}

@LazySingleton(as: Env, env: ['dev'])
class Test implements Env {
  
  @override
  String get baseUrl => 'https://api.openlearning-test.digitedacademy.net/';

  @override
  String get lmsPlayerUrlScorm => 'https://static.openlearning-test.digitedacademy.net/js/scorm_player_mobile.html?session-id=';

  @override
  String get lmsPlayerUrlXapi => 'https://static.openlearning-test.digitedacademy.net/js/xapi_player_mobile.html?session-id=';

  @override
  String get lmsPlayerUrlYoutube => 'https://static.openlearning-test.digitedacademy.net/js/youtube_player_mobile.html?session-id=';

  @override
  String get lmsPlayerUrlLinkedin => 'https://static.openlearning-test.digitedacademy.net/js/linkedin_player_mobile.html?session-id=';

  @override
  String get lmsPlayerUrlGoalsPlayerMobile => 'https://static.openlearning-test.digitedacademy.net/js/toj/goals_player_mobile.html?session-id=';

  @override
  String get lmsPlayerUrlFinalBalancePlayerMobile => 'https://static.openlearning-test.digitedacademy.net/js/toj/final_balance_player_mobile.html?session-id=';

  @override
  String get lmsPlayerUrlMaterialPlayerMobile => 'https://static.openlearning-test.digitedacademy.net/js/toj/material_player_mobile.html?session-id=';

  @override
  String get openidConfigUrl => 'https://cognito-idp.{userpool_region}.amazonaws.com/{userpool}/.well-known/openid-configuration';

  @override
  String get brightcoveDownloadUrl => "https://edge.api.brightcove.com/playback/v1/accounts/{brightcoveaccountid}/videos";

  @override
  String get viteSCORMTracker => 'https://api.openlearning-test.digitedacademy.net';

  @override
  String get trackingIdUrl => 'https://digited.catalogo.digitedacademy.net/';

  @override
  String get viteXAPITracker => 'https://api.openlearning-test.digitedacademy.net/xapi/';

  @override
  String get freshDeskHtmlPageUrl => 'https://static.openlearning-test.digitedacademy.net/js/mobile/index-60000004255.html';

  @override
  String get lmsPlayerUrlSurvey => 'https://static.openlearning-test.digitedacademy.net/js/survey_player_mobile.html?session-id=';

  @override
  String get lmsPlayerUrlExternalResource => 'https://static.openlearning-test.digitedacademy.net/js/exturl_player_mobile.html?session-id=';
  
  @override
  String get name => "dev";
}

@LazySingleton(as: Env, env: ['production'])
class Prod implements Env {
  @override
  String get baseUrl => 'https://api.openlearning.digitedacademy.net/';

  @override
  String get lmsPlayerUrlScorm => 'https://static.openlearning.digitedacademy.net/js/scorm_player_mobile.html?session-id=';
  
  @override
  String get lmsPlayerUrlXapi => 'https://static.openlearning.digitedacademy.net/js/xapi_player_mobile.html?session-id=';

  @override
  String get lmsPlayerUrlYoutube => 'https://static.openlearning.digitedacademy.net/js/youtube_player_mobile.html?session-id=';

  @override
  String get lmsPlayerUrlLinkedin => 'https://static.openlearning.digitedacademy.net/js/linkedin_player_mobile.html?session-id=';

  @override
  String get lmsPlayerUrlGoalsPlayerMobile => 'https://static.openlearning.digitedacademy.net/js/toj/goals_player_mobile.html?session-id=';

  @override
  String get lmsPlayerUrlFinalBalancePlayerMobile => 'https://static.openlearning.digitedacademy.net/js/toj/final_balance_player_mobile.html?session-id=';

  @override
  String get lmsPlayerUrlMaterialPlayerMobile => 'https://static.openlearning.digitedacademy.net/js/toj/material_player_mobile.html?session-id=';

  @override
  String get openidConfigUrl => 'https://cognito-idp.{userpool_region}.amazonaws.com/{userpool}/.well-known/openid-configuration';

  @override
  String get brightcoveDownloadUrl => "https://edge.api.brightcove.com/playback/v1/accounts/{brightcoveaccountid}/videos";

  @override
  String get viteSCORMTracker => 'https://api.openlearning.digitedacademy.net';

  @override
  String get trackingIdUrl => 'https://digited.catalogo.digitedacademy.net/';

  @override
  String get viteXAPITracker => 'https://api.openlearning.digitedacademy.net/xapi/';

  @override
  String get freshDeskHtmlPageUrl => 'https://static.openlearning.digitedacademy.net/js/mobile/index-60000004255.html';

  @override
  String get lmsPlayerUrlSurvey => 'https://static.openlearning.digitedacademy.net/js/survey_player_mobile.html?session-id=';

  @override
  String get lmsPlayerUrlExternalResource => 'https://static.openlearning.digitedacademy.net/js/exturl_player_mobile.html?session-id=';

  @override
  String get name => "production";
}
