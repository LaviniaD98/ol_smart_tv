import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScrubberWidget extends StatefulWidget {
  const VideoScrubberWidget({
    super.key,
    required this.child,
    required this.controller,
    required this.scrubberActionsArgs,
  });

  final Widget child;
  final ScrubberActionsArgs scrubberActionsArgs;
  final VideoPlayerController controller;

  @override
  State<VideoScrubberWidget> createState() => _VideoScrubberWidgetState();
}

class _VideoScrubberWidgetState extends State<VideoScrubberWidget> {

  VideoPlayerController get controller => widget.controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: widget.child,
      onHorizontalDragStart: (DragStartDetails details) {
        if (!controller.value.isInitialized) {
          return;
        }
        widget.scrubberActionsArgs.onScrubbingStart();
      },
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        if (!controller.value.isInitialized) {
          return;
        }
        seekToRelativePosition(details.globalPosition);
      },
      onHorizontalDragEnd: (DragEndDetails details) {
        widget.scrubberActionsArgs.onScrubbingEnd();
      },
    );
  }

  void seekToRelativePosition(Offset globalPosition) {
    final RenderBox box = context.findRenderObject()! as RenderBox;
    final Offset tapPos = box.globalToLocal(globalPosition);
    final double relative = tapPos.dx / box.size.width;
    final Duration position = controller.value.duration * relative;
    widget.scrubberActionsArgs.onScrubbingUpdate(position);
  }
}

class ScrubberActionsArgs {
  final OnScrubbingStart onScrubbingStart;
  final OnScrubbingUpdate onScrubbingUpdate;
  final OnScrubbingEnd onScrubbingEnd;

  ScrubberActionsArgs({
    required this.onScrubbingStart,
    required this.onScrubbingUpdate,
    required this.onScrubbingEnd,
  });
}

typedef OnScrubbingStart = void Function();
typedef OnScrubbingUpdate = void Function(Duration);
typedef OnScrubbingEnd = void Function();
