import 'package:flutter/material.dart';
import 'package:media_kit_video/media_kit_video.dart';

import 'video_overlay_widget.dart';
import 'video_player_widget.dart';
import 'video_scrubber_widget.dart';

class VideoPlayerWrapper extends StatefulWidget {
  final VideoController controller;
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
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: ExcludeFocus(
              child: Video(
            controller: widget.controller,
            controls: (state) => const SizedBox.shrink(),
            pauseUponEnteringBackgroundMode: true,
            resumeUponEnteringForegroundMode: false,
          )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: VideoOverlayWidget(
            controller: widget.controller,
            args: widget.args,
            scrubberActionsArgs: widget.scrubberActionsArgs,
          ),
        ),
      ],
    );
  }
}
