import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';

import '../../../domain/entities/download/source_model.dart';
import '../../../theme/app_theme.dart';
import '../../common/widgets/styled_icon_button.dart';
import '../widgets/video_player_widget.dart';

class VideoPlayerCommunityPage extends StatefulWidget {
  static const routeName = 'communityPlayer';
  final VideoPlayerCommunityPageArgs args;
  const VideoPlayerCommunityPage({super.key, required this.args});

  @override
  State<VideoPlayerCommunityPage> createState() => _VideoPlayerCommunityPageState();
}

class _VideoPlayerCommunityPageState extends State<VideoPlayerCommunityPage> {
  late VideoPlayerController controller;
  bool popping = false;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (bool didPop) async{
        if (Platform.isAndroid) {
          if (kDebugMode) print("PopScope onPopInvoked popping: $popping");
          if (popping) {
            return;
          }
          popping = true;
          await controller.dispose();
          if (context.mounted) {
            context.pop(true);
          }
        }
      },
      canPop: false,
      child: _content,
    );
  }

  Widget get _content {
    controller = VideoPlayerController.networkUrl(Uri.parse(widget.args.source.src!));

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: UnconstrainedBox(
          alignment: Alignment.centerRight,
          child: StyledIconButton(
            svgPath: 'assets/icons/back_arrow.svg',
            onTap: () async {
              popping = true;
              await controller.dispose();
              if (context.mounted) {
                context.pop(true);
              }
            },
          ),
        ),
      ),
      body: VideoPlayerWidget(
        args: VideoPlayerArgs(
            start: const Duration(seconds: 0),
            widget.args.source.src!,
            title: widget.args.title,
            controller: controller,
            isMandatory: false,
            videoPlayerType: VideoPlayerType.network,
            onComplete: (controller) async {
              context.pop(true);
            },
        ),
      )
    );
  }
}

class VideoPlayerCommunityPageArgs {
  final String title;
  final String? brightcoveId;
  final VoidCallback? onTapDetail;
  final SourceModel source;

  VideoPlayerCommunityPageArgs({
    required this.title,
    required this.brightcoveId,
    required this.source,
    this.onTapDetail,
  });
}
