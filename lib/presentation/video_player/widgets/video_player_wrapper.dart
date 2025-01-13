import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'video_overlay_widget.dart';
import 'video_player_widget.dart';
import 'video_scrubber_widget.dart';

class VideoPlayerWrapper extends StatefulWidget {
  final VideoPlayerController controller;
  final VideoPlayerArgs args;
  final ScrubberActionsArgs? scrubberActionsArgs;

  const VideoPlayerWrapper({
    super.key,
    required this.controller,
    required this.args,
    this.scrubberActionsArgs,
  });

  @override
  State<VideoPlayerWrapper> createState() => VideoPlayerWrapperState();
}

class VideoPlayerWrapperState extends State<VideoPlayerWrapper> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.controller.value.isInitialized
        ? Container(alignment: Alignment.center, child: _buildVideo())
        : const Center(child: CircularProgressIndicator());
  }

  Widget _buildVideo() => Stack(
        children: <Widget>[
          VideoPlayer(widget.controller),
          Align(
            alignment: Alignment.bottomCenter,
            child: VideoOverlayWidget(
              controller: widget.controller,
              args: widget.args,
              scrubberActionsArgs: widget.scrubberActionsArgs,
              onFullScreen: () {
                AutoOrientation.landscapeAutoMode();
              },
            ),
          ),
        ],
      );

  @override
  void dispose() {
    super.dispose();
  }
}
