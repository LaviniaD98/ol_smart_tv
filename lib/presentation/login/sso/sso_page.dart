import 'dart:async';

import 'package:open_learning_smart_tv/core/dependency_injection/dependency_injection.dart';
import 'package:open_learning_smart_tv/core/utils/nav.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/ol_alert_dialog.dart';
import 'package:open_learning_smart_tv/presentation/initiatives/initiatives_page.dart';
import 'package:open_learning_smart_tv/presentation/login/sso/cubit/sso_cubit.dart';
import 'package:open_learning_smart_tv/presentation/privacy/cubit/privacy_cubit.dart';
import 'package:open_learning_smart_tv/presentation/privacy/privacy_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import '../../../remote_theming/labels/labels_manager.dart';
import '../../../remote_theming/labels/remote_labels_keys.dart';

class SsoPage extends StatefulWidget {
  const SsoPage({super.key});
  static String routeName = 'sso';

  @override
  State<SsoPage> createState() => _SsoPageState();
}

class _SsoPageState extends State<SsoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.backgroundGradient),
        child: BlocConsumer<SsoCubit, SsoState>(
          listener: (context, state) => state.whenOrNull(
            error: () async {
              await OlAlertDialog.show(context,
                  title: LabelsManager()
                      .getRemoteStringFromLabelKeys(RemoteLabelKeys.error),
                  message: LabelsManager().getRemoteStringFromLabelKeys(
                      RemoteLabelKeys.authentication_error),
                  actionLabel: LabelsManager()
                      .getRemoteStringFromLabelKeys(RemoteLabelKeys.retry),
                  barrierDismissible: false);
              if (context.mounted) {
                Navigator.of(context).pop(true);
              }

              return null;
            },
            showPolicyPage: (session, selfModel, sessionId) {
              return unawaited(
                Nav.push(
                  context,
                  screen: BlocProvider(
                    create: (_) => getIt<PrivacyCubit>(),
                    child: PrivacyPage(
                      args: PrivacyPageArgs(
                        session: session,
                        selfModel: selfModel,
                        sessionId: sessionId,
                      ),
                    ),
                  ),
                  root: true,
                ),
              );
            },
            success: (user, selfModel, sessionId) {
              return unawaited(
                Nav.push(
                  context,
                  screen: InitiativesPage(
                    args: InitiativesPageArgs(
                      session: user,
                      selfModel: selfModel,
                      sessionId: sessionId,
                    ),
                  ),
                  root: true,
                ),
              );
            },
          ),
          listenWhen: (previous, current) => current.maybeMap(
            success: (_) => true,
            showPolicyPage: (_) => true,
            error: (_) => true,
            orElse: () => false,
          ),
          buildWhen: (previous, current) => current.maybeMap(
            success: (_) => false,
            showPolicyPage: (_) => false,
            error: (_) => false,
            orElse: () => true,
          ),
          builder: (context, state) => state.maybeWhen(
            loading: () => _loading,
            initial: (ssoLoginUrl, ssoCodeRedirectUrl) =>
                _content(context, ssoLoginUrl, ssoCodeRedirectUrl),
            orElse: () => const SizedBox(),
          ),
        ),
      ),
    );
  }

  Widget get _loading {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _content(
      BuildContext context, String ssoLoginUrl, String ssoCodeRedirectUrl) {
    return getWebView(context, ssoLoginUrl, ssoCodeRedirectUrl);
  }

  Widget getWebView(
      BuildContext context, String ssoLoginUrl, String ssoCodeRedirectUrl) {
    late final PlatformWebViewControllerCreationParams params;

    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(ssoCodeRedirectUrl)) {
              String code = request.url.substring(ssoCodeRedirectUrl.length);
              context.read<SsoCubit>().signUserInWithAuthCode(code);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
          onUrlChange: (UrlChange change) {},
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.parse(ssoLoginUrl));

    return WebViewWidget(controller: controller);
  }
}
