import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
//import 'package:video_player/video_player.dart';

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
  //late VideoPlayerController controller;

  late final Player player;
  late final VideoController controller;

  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }

  loadVideoPlayer() {
    // controller =
    //     VideoPlayerController.networkUrl(Uri.parse(widget.videoPlayerUrl));
    // controller.addListener(() {
    //   if (context.mounted) {
    //     setState(() {});
    //   }
    // });

    player = Player();
    controller = VideoController(player);
    player.open(Media(widget.videoPlayerUrl));
    player.play();

    player.stream.error.listen((error) {
      if (kDebugMode) print('VideoPlayerController - Error: $error');
    });

    player.stream.playing.listen((error) {
      if (kDebugMode) print('VideoPlayerController - playing: $error');
    });

    // controller.initialize().then((value) {
    //   if (mounted) {
    //     setState(() {});
    //     controller.setLooping(true);
    //     controller.setVolume(0.0);
    //     controller.play();
    //   }
    // });

    controller.rect.addListener(() {
      if (kDebugMode) {
        print('VideoPlayerTrailerWidget - Rect: ${controller.rect}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: controller.rect,
        builder: (context, rect, _) {
          print('-------rect: ${rect}');

          if (rect == null) {
            return const SizedBox.shrink();
          }
          return ClipRRect(
              // child: FittedBox(
              //   alignment: Alignment.center,
              //   fit: BoxFit.cover,
              //   child: AspectRatio(
              //     aspectRatio: (rect?.width ?? 1) / (rect?.height ?? 1),
              //     child: Video(controller: controller),
              //   ),
              // ),
              );
        });
  }

  @override
  void didChangeDependencies() {
    if (kDebugMode) print("didChangeDependencies key: ${widget.key}");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant VideoPlayerTrailerWidget oldWidget) {
    if (kDebugMode) print("didUpdateWidget key:${widget.source} ${widget.key}");
    // if (!controller.value.isPlaying) {
    //   controller.play();
    // } else {
    //   controller.pause();
    // }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('DISPOSING------------VideoPlayerTrailerWidget');
    // if (controller.value.isPlaying) controller.pause();
    controller.player.dispose();
    super.dispose();
  }
}
