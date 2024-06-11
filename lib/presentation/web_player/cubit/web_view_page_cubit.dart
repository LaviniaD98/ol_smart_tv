import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:open_learning_smart_tv/domain/use_cases/webview/web_view_player_linkedin_use_case.dart';
import 'package:open_learning_smart_tv/presentation/web_player/web_view_page.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../core/env/env.dart';
import '../../../domain/entities/user/user_info_model.dart';
import '../../../domain/use_cases/get_secure_stored_user_info_use_case.dart';
import '../../../domain/use_cases/webview/web_view_player_use_case.dart';
import '../../../wrappers/cognito_auth.dart';

part 'web_view_page_state.dart';
part 'web_view_page_cubit.freezed.dart';

@injectable
class WebViewPageCubit extends Cubit<WebViewPageState> {
  final Env env;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;
  final CognitoAuthManager _cognitoAuthManager;
  final WebViewPlayerUseCase _webPlayerUseCase;
  final WebViewPlayerLinkedinUseCase _webViewPlayerLinkedinUseCase;

  late LearningObjectModel model;
  String jwtToken = "";

  WebViewPageCubit(
      this.env,
      this._getSecureStoredUserInfoUseCase,
      this._cognitoAuthManager,
      this._webPlayerUseCase,
      this._webViewPlayerLinkedinUseCase)
      : super(const WebViewPageState.loading());

  void init(WebViewPageArgs args) async {
    model = args.model;
    //emit(WebViewPageState.init());
    requestToken();
  }

  Future<void> requestToken() async {
    final res = await _cognitoAuthManager.checkSession();
    res.fold(
      (l) {},
      (cognitoSession) {
        jwtToken = cognitoSession.accessToken.jwtToken!;
        emit(const WebViewPageState.getToken());
      },
    );
  }

  Future<void> requestSessionId() async {
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase.call();
    String? sessionId = userInfoModel?.sessionId;

    switch (model.learningObjectTypology) {
      case LearningObjectTypology.linkedin:
        {
          final res = await _webViewPlayerLinkedinUseCase.call(
              model, jwtToken, sessionId!);
          res.fold(
            (l) => emit(
              const WebViewPageState.error(),
            ),
            (linkedInResponseModel) async {
              await WebViewCookieManager().clearCookies();
              String playerUrl = linkedInResponseModel.webURL ?? "";
              emit(WebViewPageState.success(playerUrl));
            },
          );
        }
        break;
      default:
        {
          final res = await _webPlayerUseCase.call(model, jwtToken, sessionId!);
          res.fold(
            (l) => emit(
              const WebViewPageState.error(),
            ),
            (sessionIdResponseModel) async {
              await WebViewCookieManager().clearCookies();
              // Map<String, dynamic> jsonMap = sessionIdResponseModel.toJson();
              // String cookieValue = jsonEncode(jsonMap);
              // var cookieDecoded = Uri.encodeFull(cookieValue);
              // await WebViewCookieManager().clearCookies();
              // // var aa = '{"sessionId":"66e93228-7a00-4a0b-ae76-e6fc6b2b19e7","accessToken":"eyJraWQiOiJRRVwvOUg0Z2ZLZGlDZWNkb0tuem91MTlGSUh5ajZQUlpPeXZ6Z0NGRzVuWT0iLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJhNjVlNzIxMC03MGExLTcwNWUtNTNkNS05YjA5MTY5YjBhYzAiLCJpc3MiOiJodHRwczpcL1wvY29nbml0by1pZHAuZXUtc291dGgtMS5hbWF6b25hd3MuY29tXC9ldS1zb3V0aC0xXzFyYk1sVk4ySiIsImNsaWVudF9pZCI6IjVnZDRkN3FiaTMwNTludWRocHA0NGt1ZjllIiwib3JpZ2luX2p0aSI6IjA1NDY2M2UwLTRiMDAtNDNiYS1hZDI2LTM3NGRjOGEwYjhjYSIsImV2ZW50X2lkIjoiN2Q4NjZkNGQtMWM3MC00YzY1LTkxNjktNmEzZTQ3ZmUwYjQyIiwidG9rZW5fdXNlIjoiYWNjZXNzIiwic2NvcGUiOiJhd3MuY29nbml0by5zaWduaW4udXNlci5hZG1pbiIsImF1dGhfdGltZSI6MTcwMjQ2NDY2NSwiZXhwIjoxNzAyNDk0Mzc3LCJpYXQiOjE3MDI0Nzk5NzcsImp0aSI6ImVkZjVjZTY4LTIwMTctNDNkYy04YjM4LTg0MzQ3MmMxZGZhNSIsInVzZXJuYW1lIjoiZXh0ZXJuYWwuaWQucG8xIn0.h94PU7sLxI_qI2MPHGIiVukcPSJvA6YpU3puEQrs4BCseGxKf5mkCxXD6WbEVaCy4FeH8Mbnh4aBhbv1BVyjgNdYIYY56YzQEbLosor3XO4xRm6l_ERFuIE7WhU6yddw40KXMszEyl3F88vlOz_O3vWdssGXX_sdkA-Az8xHSpB4tl9Hiyc2hLB7dIsAWYHtyIQ45QXjS3ot77VuIgjC2ZiuYrjAOy6urBb1UTFFe4jSXsOIVPfQ0P7YjEB0x2ktktqbIvx-lqBf_HkEyP5B44mmBpjzypJb3PJVFqZoYSfm8sUpuyZ-IYDvUNriye4FXGOECVjTbsVK5HD4P-dJxg"}';
              // WebViewCookie cookie = WebViewCookie(name: "digitedUser", value: cookieDecoded, domain: "static.openlearning-test.digitedacademy.net");
              // await WebViewCookieManager().setCookie(cookie);
              String playerUrl = env.lmsPlayerUrlScorm;
              switch (model.learningObjectTypology) {
                case LearningObjectTypology.scorm:
                  playerUrl = env.lmsPlayerUrlScorm;
                  break;
                case LearningObjectTypology.xapi:
                  playerUrl = env.lmsPlayerUrlXapi;
                  break;
                case LearningObjectTypology.youtube:
                  playerUrl = env.lmsPlayerUrlYoutube;
                  break;
                case LearningObjectTypology.material:
                  playerUrl = env.lmsPlayerUrlMaterialPlayerMobile;
                  break;
                case LearningObjectTypology.goals:
                  playerUrl = env.lmsPlayerUrlGoalsPlayerMobile;
                  break;
                case LearningObjectTypology.finalBalance:
                  playerUrl = env.lmsPlayerUrlFinalBalancePlayerMobile;
                  break;
                case LearningObjectTypology.survey:
                  playerUrl = env.lmsPlayerUrlSurvey;
                  break;
                case LearningObjectTypology.urlRes:
                  playerUrl = env.lmsPlayerUrlExternalResource;
                  break;
                default:
                  break;
              }
              String url =
                  "$playerUrl${sessionIdResponseModel.sessionId ?? ""}&mobile=true";
              emit(WebViewPageState.success(url));
            },
          );
        }
        break;
    }
  }
}
