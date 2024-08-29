import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../color_management/color_manager.dart';
import '../../../theme/app_theme.dart';
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

  final FocusNode focusNode = FocusNode(
    debugLabel: 'VIDEO-PROGRESS',
  );

  _VideoProgressWidgetState() {
    listener = () {
      if (!mounted) {
        return;
      }
      setState(() {});
    };
  }

  late VoidCallback listener;

  VideoPlayerController get controller => widget.controller;

  VideoProgressColors get colors => widget.colors;

  @override
  void initState() {
    super.initState();
    controller.addListener(listener);
  }

  @override
  void deactivate() {
    controller.removeListener(listener);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    int duration = 0;
    int position = 0;
    int maxBuffering = 0;
    Widget progressIndicator;
    if (controller.value.isInitialized) {
      duration = controller.value.duration.inMilliseconds;
      position = controller.value.position.inMilliseconds;

      for (final DurationRange range in controller.value.buffered) {
        final int end = range.end.inMilliseconds;
        if (end > maxBuffering) {
          maxBuffering = end;
        }
      }
    }
    progressIndicator = Focus(
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
              LinearProgressIndicator(
                minHeight: 12,
                borderRadius: BorderRadius.circular(12),
                value: maxBuffering / duration,
                valueColor: AlwaysStoppedAnimation<Color>(colors.bufferedColor),
                backgroundColor:
                    focusNode.hasFocus ? Colors.red : colors.backgroundColor,
              ),
              LinearProgressIndicator(
                minHeight: 12,
                borderRadius: BorderRadius.circular(12),
                value: (position / duration),
                valueColor: AlwaysStoppedAnimation<Color>(colors.playedColor),
                //backgroundColor: Colors.transparent,
                backgroundColor:
                    focusNode.hasFocus ? Colors.red : colors.backgroundColor,
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
