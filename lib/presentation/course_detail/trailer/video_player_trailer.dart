import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerTrailerWidget extends StatefulWidget {
  final String videoPlayerUrl;
  const VideoPlayerTrailerWidget(this.videoPlayerUrl, {super.key});

  @override
  State<VideoPlayerTrailerWidget> createState() =>
      _VideoPlayerTrailerWidgetState();
}

class _VideoPlayerTrailerWidgetState extends State<VideoPlayerTrailerWidget> {
  late VideoPlayerController controller;

  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }

  loadVideoPlayer() {
    controller =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoPlayerUrl));
    controller.addListener(() {
      if (context.mounted) {
        setState(() {});
      }
    });
    controller.initialize().then((value) {
      if (mounted) {
        setState(() {});
        controller.setLooping(true);
        controller.setVolume(0.0);
        controller.play();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: FittedBox(
        alignment: Alignment.center,
        fit: BoxFit.cover,
        child: SizedBox(
          height: controller.value.size.height,
          width: controller.value.size.width,
          child: VideoPlayer(
            controller,
          ),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    if (kDebugMode) print("didChangeDependencies key: ${widget.key}");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant VideoPlayerTrailerWidget oldWidget) {
    if (kDebugMode) print("didUpdateWidget key: ${widget.key}");
    // if (!controller.value.isPlaying) {
    //   controller.play();
    // } else {
    //   controller.pause();
    // }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    if (controller.value.isPlaying) controller.pause();
    controller.dispose();
    super.dispose();
  }
}
