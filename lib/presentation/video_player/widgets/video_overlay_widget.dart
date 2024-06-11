import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

import '../../../color_management/color_manager.dart';
import '../../../theme/app_theme.dart';
import 'video_player_widget.dart';
import 'video_progress_widget.dart';
import 'video_scrubber_widget.dart';

class VideoOverlayWidget extends StatefulWidget {
  final VideoPlayerController controller;
  final bool isPortrait;
  final VoidCallback? onFullScreen;
  final VideoPlayerArgs args;
  final ScrubberActionsArgs? scrubberActionsArgs;

  const VideoOverlayWidget({
    super.key,
    required this.controller,
    required this.isPortrait,
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
  bool showInfo = false;

  @override
  void initState() {
    isPortrait = widget.isPortrait;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: () => setState(() => showInfo = !showInfo),
    child: AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: showInfo
          ? _overlay
          : const SizedBox.expand(),
    ),
  );

  Widget get _overlay {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.black.withOpacity(.1),
              AppColors.black,
            ],
          )
      ),
      padding: const EdgeInsets.all(Dimens.spacingM),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            if (widget.args.type != null && widget.args.typology != null) RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: widget.args.type!.value.toUpperCase(),
                    style:
                    AppTextTheme.caption(weight: FontWeight.w700,
                    color: ColorManager().getColorTextMandatory(),),
                  ),
                  TextSpan(
                    text: ' | ',
                    style:
                    AppTextTheme.caption(weight: FontWeight.w700),
                  ),
                  TextSpan(
                    text:
                    widget.args.typology!.value.toUpperCase(),
                    style: AppTextTheme.caption(
                      weight: FontWeight.w700,
                      color: ColorManager().getColorTextPrimary(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: Dimens.spacingXXS),
            Text(
              widget.args.title,
              style: AppTextTheme.caption(weight: FontWeight.w700),
            ),
            const SizedBox(height: Dimens.spacingS),
            VideoProgressWidget(
              widget.controller,
              scrubberActionsArgs: widget.scrubberActionsArgs,
              colors: VideoProgressColors(
                backgroundColor:  ColorManager().getColorBorder(),
                bufferedColor: ColorManager().getColorSystemPrimary01(),
                playedColor: ColorManager().getColorSystemSecondary01(),
              ),
            ),
            const SizedBox(height: Dimens.spacingL),
            Row(
              children: [
                controls,
                const SizedBox(width: Dimens.spacingM),
                audio,
                const SizedBox(width: Dimens.spacingM),
                Expanded(child: Text(getPosition, style: AppTextTheme.caption(color: ColorManager().getColorTextPrimary()))),
                if (widget.args.onTapDetail != null) ...[
                  details,
                ],
                orientation,
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget get controls {
    final isPlaying = widget.controller.value.isPlaying;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: isPlaying ? widget.controller.pause : widget.controller.play,
      child: SvgPicture.asset(
        isPlaying ? 'assets/icons/pause.svg' : 'assets/icons/play.svg',
        height: _iconSize,
        colorFilter: ColorFilter.mode(ColorManager().getColorSystemPrimary01(), BlendMode.srcIn),
      ),
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
        colorFilter: ColorFilter.mode(ColorManager().getColorSystemPrimary01(), BlendMode.srcIn),
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
            colorFilter: ColorFilter.mode(ColorManager().getColorSystemPrimary01(), BlendMode.srcIn),
          ),
        ),
      );
  }

  Widget get orientation {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: widget.onFullScreen,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.spacingXS),
        child: SvgPicture.asset(
          isPortrait
              ? 'assets/icons/landscape.svg'
              : 'assets/icons/portrait.svg',
          height: _iconSize,
          colorFilter: ColorFilter.mode(
            ColorManager().getColorSystemPrimary01(),
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }

  String get getPosition {
    final position = formatDuration(Duration(milliseconds: widget.controller.value.position.inMilliseconds.round()));
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

  @override
  void didUpdateWidget(covariant VideoOverlayWidget oldWidget) {
    if(oldWidget.isPortrait != widget.isPortrait) {
      setState(() {
        isPortrait = widget.isPortrait;
      });
    }
    super.didUpdateWidget(oldWidget);
  }
}
