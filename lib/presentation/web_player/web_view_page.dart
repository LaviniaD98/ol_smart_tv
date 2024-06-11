import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/styled_icon_button.dart';
import 'package:open_learning_smart_tv/presentation/web_player/cubit/web_view_page_cubit.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import '../common/widgets/dialog/ol_alert_dialog.dart';
import 'common/fullscreen_web_view.dart';

class WebViewPageArgs {
  final LearningObjectModel model;
  WebViewPageArgs({required this.model});
}

class WebViewPage extends StatelessWidget {
  static String routeName = 'webviewroute';
  final WebViewPageArgs args;
  const WebViewPage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            actions: [
              StyledIconButton(
                svgPath: 'assets/icons/cross.svg',
                margin: const EdgeInsets.only(right: Dimens.spacingM),
                onTap: () => Navigator.pop(context, true),
              ),
            ],
          ),
          body: Container(
            decoration: BoxDecoration(gradient: AppColors.backgroundGradient),
            child: SafeArea(
              child: BlocConsumer<WebViewPageCubit, WebViewPageState>(
                listener: (context, state) => state.whenOrNull(
                  getToken: () =>
                      context.read<WebViewPageCubit>().requestSessionId(),
                  error: () async {
                    await OlAlertDialog.show(context,
                        title: LabelsManager().getRemoteStringFromLabelKeys(
                            RemoteLabelKeys.error),
                        message: LabelsManager().getRemoteStringFromLabelKeys(
                            RemoteLabelKeys.error_occurred),
                        actionLabel: LabelsManager()
                            .getRemoteStringFromLabelKeys(
                                RemoteLabelKeys.retry),
                        barrierDismissible: false);
                    if (context.mounted) Navigator.pop(context, true);
                    return null;
                  },
                ),
                buildWhen: (previous, current) => current.maybeMap(
                  success: (_) => true,
                  orElse: () => false,
                ),
                builder: (context, state) => state.maybeWhen(
                  loading: () => _loading,
                  success: (String playerUrl) => _content(context, playerUrl),
                  orElse: () => const SizedBox(),
                ),
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

  Widget _content(BuildContext context, String playerUrl) {
    String urlStr = playerUrl;
    return FullScreenWebView(
        url: urlStr,
        onClose: () {
          Navigator.pop(context, true);
        });
  }
}
