import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_icon_button.dart';
import 'package:video_player/video_player.dart';

import '../../../color_management/color_manager.dart';
import '../../../theme/app_theme.dart';
import 'video_player_widget.dart';
import 'video_progress_widget.dart';
import 'video_scrubber_widget.dart';

class VideoOverlayWidget extends StatefulWidget {
  final VideoPlayerController controller;

  final VoidCallback? onFullScreen;
  final VideoPlayerArgs args;
  final ScrubberActionsArgs? scrubberActionsArgs;

  const VideoOverlayWidget({
    super.key,
    required this.controller,
    required this.args,
    this.scrubberActionsArgs,
    this.onFullScreen,
  });

  @override
  State<VideoOverlayWidget> createState() => VideoOverlayWidgetState();
}

class VideoOverlayWidgetState extends State<VideoOverlayWidget> {
  static const _iconSize = 28.0;
  late bool isPortrait;
  ValueNotifier<bool> showInfo = ValueNotifier(false);
  FocusScopeNode focusNode = FocusScopeNode();

  Timer? _hideTimer;

  bool isSeeking = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      focusNode.requestFocus();
      setTimer();
    });
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    _hideTimer = null;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: <ShortcutActivator, VoidCallback>{
        const SingleActivator(LogicalKeyboardKey.play): () {
          widget.controller.play();
          setTimer();
        },
        const SingleActivator(LogicalKeyboardKey.pause): () {
          widget.controller.pause();
          showInfo.value = true;
        },
        const SingleActivator(LogicalKeyboardKey.arrowLeft): () {
          if (!showInfo.value) {
            setTimer();
          }

          if (focusNode.focusedChild?.debugLabel == 'VIDEO-PROGRESS') {
            widget.controller.seekTo(
                widget.controller.value.position - const Duration(seconds: 10));
          }
        },
        const SingleActivator(LogicalKeyboardKey.arrowRight): () {
          if (!showInfo.value) {
            setTimer();
          }

          if (focusNode.focusedChild?.debugLabel == 'VIDEO-PROGRESS') {
            widget.controller.seekTo(
                widget.controller.value.position + const Duration(seconds: 10));
          }
        },
        const SingleActivator(LogicalKeyboardKey.select): () {
          if (focusNode.focusedChild?.debugLabel == 'VIDEO-CONTROLS') {
            if (widget.controller.value.isPlaying) {
              widget.controller.pause();
            } else {
              widget.controller.play();
            }
          }
          setTimer();
        },
        const SingleActivator(LogicalKeyboardKey.enter): () {
          if (focusNode.focusedChild?.debugLabel == 'VIDEO-CONTROLS') {
            if (widget.controller.value.isPlaying) {
              widget.controller.pause();
            } else {
              widget.controller.play();
            }
          }
          setTimer();
        },
        const SingleActivator(LogicalKeyboardKey.arrowUp): () {
          if (!showInfo.value) {
            setTimer();
          }
          focusNode.focusInDirection(TraversalDirection.up);
        },
        const SingleActivator(LogicalKeyboardKey.arrowDown): () {
          if (!showInfo.value) {
            setTimer();
          }
          focusNode.focusInDirection(TraversalDirection.down);
        },
      },
      child: FocusScope(
        node: focusNode,
        child: ValueListenableBuilder<bool>(
            valueListenable: showInfo,
            builder: (context, show, _) {
              return AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: show ? 1 : 0,
                child: IgnorePointer(
                  ignoring: !show,
                  child: Column(
                    children: [
                      _topOverlay,
                      const Spacer(),
                      _bottomOverlay,
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  void setTimer() {
    if (!showInfo.value) {
      showInfo.value = true;
    }

    _hideTimer?.cancel();
    _hideTimer = null;
    _hideTimer = Timer(const Duration(seconds: 20), () {
      showInfo.value = false;
    });
  }

  Widget get _topOverlay {
    return Container(
      height: 257,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            AppColors.black.withOpacity(0),
            AppColors.black,
          ],
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 84,
        vertical: 71,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if (widget.args.type != null && widget.args.typology != null)
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: widget.args.type!.value.toUpperCase(),
                    style: AppTextTheme.caption(
                      weight: FontWeight.w700,
                      size: 20,
                      color: ColorManager().getColorTextMandatory(),
                    ),
                  ),
                  TextSpan(
                    text: ' | ',
                    style: AppTextTheme.caption(weight: FontWeight.w700),
                  ),
                  TextSpan(
                    text: widget.args.typology!.value.toUpperCase(),
                    style: AppTextTheme.caption(
                      weight: FontWeight.w700,
                      size: 20,
                      color: ColorManager().getColorTextPrimary(),
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: Dimens.spacingXXS),
          Text(
            widget.args.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextTheme.caption(
              weight: FontWeight.w700,
              size: 48,
            ),
          ),
        ],
      ),
    );
  }

  Widget get _bottomOverlay {
    return Container(
      height: 270,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.black.withOpacity(.1),
            AppColors.black,
          ],
        ),
      ),
      padding: const EdgeInsets.all(Dimens.spacingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            children: [
              const SizedBox(width: Dimens.hViewPadding),
              controls,
              const Spacer(),
              // if (widget.args.onTapDetail != null) ...[
              //   details,
              // ],
              const SizedBox(width: Dimens.hViewPadding),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              const SizedBox(width: Dimens.hViewPadding),
              Expanded(
                child: VideoProgressWidget(
                  widget.controller,
                  scrubberActionsArgs: widget.scrubberActionsArgs,
                  colors: VideoProgressColors(
                    backgroundColor: ColorManager().getColorBorder(),
                    bufferedColor: ColorManager().getColorSystemPrimary01(),
                    playedColor: ColorManager().getColorSystemSecondary01(),
                  ),
                ),
              ),
              const SizedBox(width: 84),
              SizedBox(
                width: 200,
                child: Text(
                  getPosition,
                  style: AppTextTheme.caption(
                    color: ColorManager().getColorTextPrimary(),
                  ),
                ),
              ),
              const SizedBox(width: Dimens.hViewPadding),
            ],
          ),
        ],
      ),
    );
  }

  Widget get controls {
    final isPlaying = widget.controller.value.isPlaying;
    return OLIconButton(
      debugLabel: 'VIDEO-CONTROLS',
      image: isPlaying ? 'assets/icons/pause.svg' : 'assets/icons/play.svg',
      onPressed: isPlaying ? widget.controller.pause : widget.controller.play,
      outline: true,
    );
  }

  Widget get audio {
    final isMute = widget.controller.value.volume < 1.0;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => widget.controller.setVolume(isMute ? 1 : 0),
      child: SvgPicture.asset(
        isMute ? 'assets/icons/audio_off.svg' : 'assets/icons/audio_on.svg',
        height: _iconSize,
        colorFilter: ColorFilter.mode(
            ColorManager().getColorSystemPrimary01(), BlendMode.srcIn),
      ),
    );
  }

  Widget get details {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: widget.args.onTapDetail,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.spacingXS),
        child: SvgPicture.asset(
          'assets/icons/details.svg',
          height: _iconSize,
          colorFilter: ColorFilter.mode(
              ColorManager().getColorSystemPrimary01(), BlendMode.srcIn),
        ),
      ),
    );
  }

  String get getPosition {
    final position = formatDuration(Duration(
        milliseconds: widget.controller.value.position.inMilliseconds.round()));
    final total = formatDuration(widget.controller.value.duration);
    return '$position / $total';
  }

  String formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;

    final hoursString = '$hours'.padLeft(2, '0');
    final minutesString = '$minutes'.padLeft(2, '0');
    final secondsString = '$seconds'.padLeft(2, '0');
    return '$hoursString:$minutesString:$secondsString';
  }
}
