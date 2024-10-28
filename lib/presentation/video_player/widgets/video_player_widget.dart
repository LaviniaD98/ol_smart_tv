import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/domain/entities/detail/detail_page_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/detail_page.dart';
import 'package:video_player/video_player.dart';

import '../../../domain/enums/types.dart';
import 'video_player_wrapper.dart';
import 'video_scrubber_widget.dart';

class VideoPlayerWidget extends StatefulWidget {
  final VideoPlayerArgs args;

  const VideoPlayerWidget({
    super.key,
    required this.args,
  });

  @override
  State<VideoPlayerWidget> createState() => VideoPlayerWidgetState();
}

class VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VoidCallback listener;
  bool _isScrubbing = false;
  VideoPlayerWidgetStatus status = VideoPlayerWidgetStatus.idle;

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  void _initPlayer() async {
    listener = () {
      if (context.mounted && widget.args.controller.value.isInitialized) {
        if (status != VideoPlayerWidgetStatus.completed &&
            widget.args.controller.value.isCompleted) {
          widget.args.onComplete?.call(widget.args.controller);
          status = VideoPlayerWidgetStatus.completed;

          if (kDebugMode) print('VIDEO EVENT: ****** END ******');
        } else if (status == VideoPlayerWidgetStatus.inPause &&
            widget.args.controller.value.isPlaying &&
            !_isScrubbing &&
            !widget.args.controller.value.isCompleted) {
          status = VideoPlayerWidgetStatus.inPlay;
          if (kDebugMode) print('VIDEO EVENT: ****** RESUME ******');
        } else if (status == VideoPlayerWidgetStatus.inPlay &&
            !widget.args.controller.value.isPlaying &&
            !_isScrubbing &&
            !widget.args.controller.value.isCompleted) {
          widget.args.onPause?.call(widget.args.controller);
          status = VideoPlayerWidgetStatus.inPause;
          if (kDebugMode) print('VIDEO EVENT: ****** PAUSE ******');
        }
      }
    };

    widget.args.controller
      ..addListener(listener)
      ..setLooping(false)
      ..initialize().then((_) async {
        if (widget.args.start != null) {
          final delta =
              widget.args.controller.value.duration - widget.args.start!;

          if (delta.inSeconds > 1) {
            await widget.args.controller.seekTo(widget.args.start!);
          }
          widget.args.controller.play().then((value) {
            if (kDebugMode) print('VIDEO EVENT: ****** START ******');
            setState(() => status = VideoPlayerWidgetStatus.inPlay);
            widget.args.onStart?.call(widget.args.controller);
          });
        }
      });
  }

  @override
  void dispose() {
    widget.args.controller.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayerWrapper(
      controller: widget.args.controller,
      args: widget.args,
      scrubberActionsArgs: _getScrubberActionArgs(widget.args.isMandatory),
    );
  }

  ScrubberActionsArgs? _getScrubberActionArgs(bool isMandatory) {
    if (isMandatory) return null;
    return ScrubberActionsArgs(
      onScrubbingStart: () {
        setState(() => _isScrubbing = true);
      },
      onScrubbingUpdate: (pos) {
        if (_isScrubbing) {
          widget.args.controller.seekTo(pos);
        }
      },
      onScrubbingEnd: () {
        setState(() => _isScrubbing = false);
      },
    );
  }
}

class VideoPlayerArgs {
  final String url;
  final String title;
  final LearningObjectTypology? typology;
  final LearningObjectType? type;
  final bool isMandatory;
  final VideoPlayerType videoPlayerType;
  final Duration? start;
  final VoidCallback? onTapDetail;
  final VideoCallback? onStart;
  final VideoCallback? onPause;
  final VideoCallback? onClose;
  final VideoCallback? onComplete;
  final VideoPlayerController controller;
  final DetailPageModel? detailModel;
  final DetailPageArgs args;
  final String? grandParentId;
  final String? parentId;
  final LearningObjectModel? currentObject;

  VideoPlayerArgs(
    this.url, {
    required this.title,
    this.typology,
    this.type,
    required this.isMandatory,
    required this.videoPlayerType,
    this.start,
    this.onTapDetail,
    this.onStart,
    this.onPause,
    this.onClose,
    this.onComplete,
    required this.controller,
    required this.args,
    this.detailModel,
    this.grandParentId,
    this.parentId,
    this.currentObject,
  });
}

enum VideoPlayerType { file, network, assets }

enum VideoPlayerWidgetStatus { idle, inPause, inScrubbing, inPlay, completed }

typedef VideoCallback = void Function(VideoPlayerController);
