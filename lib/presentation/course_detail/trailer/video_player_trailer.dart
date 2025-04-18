import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class VideoPlayerTrailerWidget extends StatefulWidget {
  final String videoPlayerUrl;
  final String source;
  const VideoPlayerTrailerWidget(this.videoPlayerUrl,
      {required this.source, super.key});

  @override
  State<VideoPlayerTrailerWidget> createState() =>
      _VideoPlayerTrailerWidgetState();
}

class _VideoPlayerTrailerWidgetState extends State<VideoPlayerTrailerWidget> {
  late final Player player;
  late final VideoController controller;

  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }

  loadVideoPlayer() {
    player = Player();

    controller = VideoController(
      player,
      configuration: const VideoControllerConfiguration(
        scale: 0.1,
      ),
    );
    player.open(Media(widget.videoPlayerUrl));
    player.play();
    player.setPlaylistMode(PlaylistMode.loop);

  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: controller.rect,
        builder: (context, rect, _) {
          if (rect == null) {
            return const SizedBox.shrink();
          }

          if (rect.width == 1 || rect.height == 1) {
            return const SizedBox.shrink();
          }
          return ClipRRect(
            child: FittedBox(
              alignment: Alignment.center,
              fit: BoxFit.cover,
              child: SizedBox(
                width: rect.width,
                height: rect.height,
                child: Video(controller: controller),
              ),
            ),
          );
        });
  }

  @override
  void didUpdateWidget(covariant VideoPlayerTrailerWidget oldWidget) {
    // if (!controller.value.isPlaying) {
    //   controller.play();
    // } else {
    //   controller.pause();
    // }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    // if (controller.value.isPlaying) controller.pause();
    controller.player.dispose();
    super.dispose();
  }
}
