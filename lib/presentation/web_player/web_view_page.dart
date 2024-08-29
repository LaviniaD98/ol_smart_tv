import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/presentation/web_player/cubit/web_view_page_cubit.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../common/widgets/dialog/ol_alert_dialog.dart';
import 'common/fullscreen_web_view.dart';

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
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.backgroundGradient),
        child: BlocConsumer<WebViewPageCubit, WebViewPageState>(
          listener: (context, state) => state.whenOrNull(
            getToken: () => context.read<WebViewPageCubit>().requestSessionId(),
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
          ),
          buildWhen: (previous, current) => current.maybeMap(
            success: (_) => true,
            orElse: () => false,
          ),
          builder: (context, state) => state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (String playerUrl) => _content(context, playerUrl),
            orElse: () => const SizedBox(),
          ),
        ),
      ),
    );
  }

  Widget _content(BuildContext context, String playerUrl) {
    String urlStr = playerUrl;

    print('playerUrl: $playerUrl');

    if (widget.isYoutube) {
      if (_controller == null) {
        final videoId = YoutubePlayer.convertUrlToId(playerUrl);

        print('videoId: $videoId');

        _controller = YoutubePlayerController(
          initialVideoId: videoId ?? '',
          flags: const YoutubePlayerFlags(
            autoPlay: true,
            mute: true,
          ),
        );
      }

      return const SizedBox.shrink();
      return YoutubePlayer(
        controller: _controller!,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
        progressColors: const ProgressBarColors(
          playedColor: Colors.amber,
          handleColor: Colors.amberAccent,
        ),
        onReady: () {
          _controller!.addListener(() {});
        },
      );
    } else {
      return FullScreenWebView(
        url: urlStr,
        onClose: () {
          Navigator.pop(context, true);
        },
      );
    }
  }
}
