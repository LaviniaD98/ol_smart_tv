import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';
import 'package:video_player/video_player.dart';

import '../../../color_management/color_manager.dart';
import 'video_scrubber_widget.dart';

class VideoProgressWidget extends StatefulWidget {
  const VideoProgressWidget(
    this.controller, {
    super.key,
    this.scrubberActionsArgs,
    this.colors = const VideoProgressColors(),
    this.padding = const EdgeInsets.only(top: 5.0),
  });

  /// The [VideoPlayerController] that actually associates a video with this
  /// widget.
  final VideoPlayerController controller;

  final ScrubberActionsArgs? scrubberActionsArgs;

  /// The default colors used throughout the indicator.
  ///
  /// See [VideoProgressColors] for default values.
  final VideoProgressColors colors;

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

  VideoPlayerController get controller => widget.controller;

  VideoProgressColors get colors => widget.colors;

  @override
  void initState() {
    super.initState();
    if (controller.value.isInitialized) {
      duration = controller.value.duration.inMilliseconds;
      position = controller.value.position.inMilliseconds;
    }
    controller.addListener(handleProgressUpdate);
  }

  @override
  void deactivate() {
    controller.removeListener(handleProgressUpdate);
    super.deactivate();
  }

  void handleProgressUpdate() {
    if (controller.value.isInitialized) {
      duration = controller.value.duration.inMilliseconds;
      position = controller.value.position.inMilliseconds;

      for (final DurationRange range in controller.value.buffered) {
        final int end = range.end.inMilliseconds;
        if (end > maxBuffering) {
          maxBuffering = end;
        }
      }
      setState(() {});
    }
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
                    value: maxBuffering / duration,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(colors.bufferedColor),
                    backgroundColor: colors.backgroundColor,
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
                    value: (position / duration),
                    valueColor:
                        AlwaysStoppedAnimation<Color>(colors.playedColor),
                    backgroundColor: colors.backgroundColor,
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
