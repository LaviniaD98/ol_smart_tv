import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_button.dart';
import 'package:open_learning_smart_tv/presentation/web_player/cubit/web_view_page_cubit.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../common/widgets/dialog/ol_alert_dialog.dart';

class WebViewPageArgs {
  final LearningObjectModel model;
  WebViewPageArgs({required this.model});
}

class WebViewPage extends StatefulWidget {
  const WebViewPage({
    super.key,
    required this.args,
    this.isYoutube = false,
  });

  static String routeName = 'webviewroute';
  final WebViewPageArgs args;
  final bool isYoutube;

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    if (_controller != null) {
      _controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: AppColors.backgroundGradient,
                image: const DecorationImage(
                  image: AssetImage('assets/images/login_back.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: BlocConsumer<WebViewPageCubit, WebViewPageState>(
                listener: (context, state) => state.whenOrNull(
                  getToken: () =>
                      context.read<WebViewPageCubit>().requestSessionId(),
                  error: () async {
                    await OlAlertDialog.show(
                      context,
                      title: LabelsManager()
                          .getRemoteStringFromLabelKeys(RemoteLabelKeys.error),
                      message: LabelsManager().getRemoteStringFromLabelKeys(
                          RemoteLabelKeys.error_occurred),
                      actionLabel: LabelsManager()
                          .getRemoteStringFromLabelKeys(RemoteLabelKeys.retry),
                      barrierDismissible: false,
                    );
                    if (context.mounted) Navigator.pop(context, true);
                    return null;
                  },
                  success: (playerUrl) async {
                    final continueRes = await showDialog(
                        context: context,
                        barrierColor: Colors.white.withValues(alpha: 0.05),
                        barrierDismissible: false,
                        builder: (context) {
                          return Dialog(
                            backgroundColor: OLColors.backgroundPrimary,
                            insetPadding: const EdgeInsets.all(Dimens.spacingL),
                            child: OlAlertDialog(
                              title: 'Avviso',
                              message:
                                  'Per uscire dalla fruizione premi il tasto "Indietro" del telecomando',
                              actionLabel: LabelsManager()
                                  .getRemoteStringFromLabelKeys(
                                      RemoteLabelKeys.continue_button),
                              actions: [
                                OLButton(
                                  autoFocus: true,
                                  title: LabelsManager()
                                      .getRemoteStringFromLabelKeys(
                                          RemoteLabelKeys.continue_button),
                                  outline: true,
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                ),
                              ],
                            ),
                          );
                        }) as bool?;

                    if (continueRes == true) {
                      final res = await launchUrl(
                        Uri.parse(playerUrl),
                        mode: widget.isYoutube
                            ? LaunchMode.externalApplication
                            : LaunchMode.inAppWebView,
                      );

                      if (res) {
                        if (context.mounted) {
                          Navigator.of(context).pop();
                        }
                      }
                    } else {
                      Navigator.of(context).pop();
                    }

                    return null;
                  },
                ),
                buildWhen: (previous, current) => current.maybeMap(
                  success: (_) => true,
                  orElse: () => false,
                ),
                builder: (context, state) => state.maybeWhen(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  success: (String playerUrl) {
                    return const SizedBox.shrink();
                  },
                  orElse: () => const SizedBox(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _content(BuildContext context, String playerUrl) {
  //   String urlStr = playerUrl;

  //   return FullScreenWebView(
  //     url: urlStr,
  //     onClose: () {
  //       Navigator.pop(context, true);
  //     },
  //   );
  // }
}
