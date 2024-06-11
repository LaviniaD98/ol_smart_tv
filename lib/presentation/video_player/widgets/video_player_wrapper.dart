import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  Orientation? target = Orientation.portrait;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    super.initState();
  }

  void setOrientation(bool isPortrait) {
    if (isPortrait) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: SystemUiOverlay.values);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.controller.value.isInitialized
        ? Container(alignment: Alignment.center, child: _buildVideo())
        : const Center(child: CircularProgressIndicator());
  }

  Widget _buildVideo() => OrientationBuilder(
        builder: (context, orientation) {
          final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait; //orientation == Orientation.portrait;
          setOrientation(isPortrait);
          return Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: AspectRatio(
                  aspectRatio: widget.controller.value.aspectRatio,
                  child: VideoPlayer(widget.controller),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: VideoOverlayWidget(
                  controller: widget.controller,
                  args: widget.args,
                  scrubberActionsArgs: widget.scrubberActionsArgs,
                  isPortrait: isPortrait,
                  onFullScreen: () {
                    target = isPortrait ? Orientation.landscape : Orientation.portrait;
                    if (isPortrait) {
                      AutoOrientation.landscapeAutoMode();
                    } else {
                      AutoOrientation.portraitUpMode();
                    }
                  },
                ),
              ),
            ],
          );
        },
      );

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: SystemUiOverlay.values);
    super.dispose();
  }
}
