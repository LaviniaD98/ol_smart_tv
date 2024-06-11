import 'package:open_learning_smart_tv/presentation/community_webview/cubit/community_web_view_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:go_router/go_router.dart';
import '../common/widgets/dialog/ol_alert_dialog.dart';
import 'common/community_fullscreen_web_view.dart';

class CommunityWebViewPage extends StatelessWidget {
  static String routeName = 'communitywebviewroute';
  const CommunityWebViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: Container(
            decoration: BoxDecoration(gradient: AppColors.backgroundGradient),
            child: BlocConsumer<CommunityWebViewPageCubit,
                CommunityWebViewPageState>(
              listener: (context, state) => state.whenOrNull(
                error: () async {
                  await OlAlertDialog.show(context,
                      title: 'Errore',
                      message: "Errore durante il caricamento della sezione.",
                      actionLabel: 'Riprova',
                      barrierDismissible: false);
                  if (context.mounted) context.pop(true);
                  return null;
                },
              ),
              buildWhen: (previous, current) => current.maybeMap(
                success: (_) => true,
                orElse: () => false,
              ),
              builder: (context, state) => state.maybeWhen(
                loading: () => _loading,
                success: (webViewUrl, communityUrl) =>
                    _content(context, webViewUrl, communityUrl),
                orElse: () => const SizedBox(),
              ),
            ),
          ),
        ));
  }

  Widget get _loading {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _content(
      BuildContext context, String webViewUrl, String communityUrl) {
    return CommunityFullScreenWebView(
        url: webViewUrl,
        communityUrl: communityUrl,
        onClose: () {
          Navigator.pop(context);
        });
  }
}
