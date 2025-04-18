import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';

import '../../../color_management/color_manager.dart';
import 'video_scrubber_widget.dart';

class VideoProgressWidget extends StatefulWidget {
  const VideoProgressWidget(
    this.controller, {
    super.key,
    this.scrubberActionsArgs,
    // this.colors = const VideoProgressColors(),
    this.padding = const EdgeInsets.only(top: 5.0),
  });

  /// The [VideoPlayerController] that actually associates a video with this
  /// widget.
  final VideoController controller;

  final ScrubberActionsArgs? scrubberActionsArgs;

  /// This allows for visual padding around the progress indicator that can
  /// still detect gestures via [allowScrubbing].
  ///
  /// Defaults to `top: 5.0`.
  final EdgeInsets padding;

  @override
  State<VideoProgressWidget> createState() => _VideoProgressWidgetState();
}

class _VideoProgressWidgetState extends State<VideoProgressWidget> {
  static const dotSize = 24.0;

  final focusNode = OlFocusNode(id: 'VIDEO-PROGRESS');

  _VideoProgressWidgetState();

  int duration = 0;
  int position = 0;
  int maxBuffering = 0;

  StreamSubscription<Duration>? positionSubscription;

  VideoController get controller => widget.controller;

  @override
  void initState() {
    super.initState();
    final state = controller.player.state;

    duration = state.duration.inMilliseconds;
    position = state.position.inMilliseconds;

    positionSubscription = controller.player.stream.position.listen(
      (newPosition) {
        duration = controller.player.state.duration.inMilliseconds;
        position = newPosition.inMilliseconds;
        maxBuffering = controller.player.state.buffer.inMilliseconds;
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    positionSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Widget progressIndicator = Focus(
      focusNode: focusNode,
      onFocusChange: (value) {
        setState(() {});
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.centerLeft,
            fit: StackFit.passthrough,
            children: <Widget>[
              Container(
                height: 16,
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Align(
                  child: LinearProgressIndicator(
                    minHeight: 12,
                    borderRadius: BorderRadius.circular(12),
                    value: maxBuffering <= 0 ? 0.0 : (maxBuffering / duration),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      ColorManager().getColorSystemPrimary01(),
                    ),
                    backgroundColor: ColorManager().getColorBorder(),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                        focusNode.hasFocus ? Colors.white : Colors.transparent,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                height: 16,
                padding: const EdgeInsets.only(left: 0, right: 0),
                child: Align(
                  child: LinearProgressIndicator(
                    minHeight: 12,
                    borderRadius: BorderRadius.circular(12),
                    value: position <= 0 ? 0.0 : (position / duration),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      ColorManager().getColorSystemSecondary01(),
                    ),
                    backgroundColor: ColorManager().getColorBorder(),
                  ),
                ),
              ),
              Positioned(
                left: (constraints.maxWidth *
                        clampDouble((position / duration), 0, 100)) -
                    dotSize / 2,
                child: Container(
                  width: dotSize,
                  height: dotSize,
                  decoration: BoxDecoration(
                    color: ColorManager().getColorSystemSecondary01(),
                    border: Border.all(
                      width: 4.0,
                      color: ColorManager().getColorSystemPrimary01(),
                    ),
                    borderRadius: BorderRadius.circular(dotSize / 2),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
    final Widget paddedProgressIndicator = Padding(
      padding: widget.padding,
      child: progressIndicator,
    );
    if (widget.scrubberActionsArgs != null) {
      return VideoScrubberWidget(
        controller: controller,
        scrubberActionsArgs: widget.scrubberActionsArgs!,
        child: paddedProgressIndicator,
      );
    } else {
      return paddedProgressIndicator;
    }
  }
}
