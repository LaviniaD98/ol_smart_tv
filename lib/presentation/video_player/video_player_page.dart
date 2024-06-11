import 'dart:developer';
import 'dart:io';

import 'package:open_learning_smart_tv/presentation/video_player/cubit/video_player_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';

import '../../domain/enums/types.dart';
import '../../remote_theming/labels/labels_manager.dart';
import '../../remote_theming/labels/remote_labels_keys.dart';
import '../../theme/app_theme.dart';
import '../common/widgets/error/error_screen.dart';
import '../common/widgets/styled_icon_button.dart';
import 'widgets/video_player_widget.dart';

class VideoPlayerPage extends StatefulWidget {
  static const routeName = 'player';
  final VideoPlayerPageArgs args;
  const VideoPlayerPage({super.key, required this.args});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController controller;
  bool popping = false;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (bool didPop) async {
        if (Platform.isAndroid) {
          if (kDebugMode) print("PopScope onPopInvoked popping: $popping");
          if (popping) {
            return;
          }
          popping = true;
          await context.read<VideoPlayerCubit>().setStateCall(
              widget.args, false, controller.value.position, controller, true);
          if (context.mounted) {
            context.pop(true);
          }
        }
      },
      canPop: false,
      child: _content,
    );
  }

  Widget get _content {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: UnconstrainedBox(
          alignment: Alignment.centerRight,
          child: BlocBuilder<VideoPlayerCubit, VideoPlayerState>(
              builder: (context, state) {
            bool enabled =
                state.maybeMap(orElse: () => true, tracking: (_) => false);
            return StyledIconButton(
              svgPath: 'assets/icons/back_arrow.svg',
              onTap: enabled
                  ? () async {
                      popping = true;
                      await context.read<VideoPlayerCubit>().setStateCall(
                          widget.args,
                          false,
                          controller.value.position,
                          controller,
                          true);
                      if (context.mounted) {
                        context.pop(true);
                      }
                    }
                  : null,
            );
          }),
        ),
      ),
      body: BlocBuilder<VideoPlayerCubit, VideoPlayerState>(
        builder: (context, state) => state.map(
          loading: (_) => _loading,
          tracking: (_) => _loading,
          done: (value) {
            controller =
                VideoPlayerController.networkUrl(Uri.parse(value.source.src!));
            return VideoPlayerWidget(
              args: VideoPlayerArgs(
                  start: value.bookmark,
                  value.source.src!,
                  title: widget.args.title,
                  typology: widget.args.typology,
                  type: widget.args.type,
                  isMandatory: widget.args.isMandatory,
                  onTapDetail: () async {
                    bool enabled = state.maybeMap(
                        orElse: () => true, loading: (_) => false);
                    if (enabled) {
                      await context.read<VideoPlayerCubit>().setStateCall(
                          widget.args,
                          false,
                          controller.value.position,
                          controller,
                          true);
                      if (context.mounted) {
                        context.pop(true);
                      }
                      widget.args.onTapDetail;
                    }
                  },
                  controller: controller,
                  videoPlayerType: VideoPlayerType.network,
                  onComplete: (controller) async {
                    await context.read<VideoPlayerCubit>().statementsCall(
                        widget.args,
                        true,
                        controller.value.duration,
                        controller,
                        true);
                    if (context.mounted) {
                      context.pop(true);
                    }
                  },
                  onStart: (controller) {
                    context.read<VideoPlayerCubit>().statementsCall(widget.args,
                        false, controller.value.duration, controller);
                  },
                  onPause: (controller) {
                    context.read<VideoPlayerCubit>().setStateCall(widget.args,
                        false, controller.value.position, controller);
                  }),
            );
          },
          error: (_) => _error(context),
        ),
      ),
    );
  }

  Widget get _loading {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _error(BuildContext context) {
    return Center(
      child: ErrorScreen(
          title: LabelsManager()
              .getRemoteStringFromLabelKeys(RemoteLabelKeys.error),
          message: LabelsManager()
              .getRemoteStringFromLabelKeys(RemoteLabelKeys.error_occurred),
          onReload: () {
            context.pop();
            //context.read<VideoPlayerCubit>().init(widget.args.brightcoveId, widget.args)
          }),
    );
  }
}

class VideoPlayerPageArgs {
  final int id;
  final String title;
  final LearningObjectTypology? typology;
  final LearningObjectType? type;
  final bool isMandatory;
  final String? brightcoveId;
  final String? pathId;
  final VoidCallback? onTapDetail;
  final String? tentativeId;

  VideoPlayerPageArgs({
    required this.id,
    required this.title,
    this.typology,
    this.type,
    required this.isMandatory,
    required this.brightcoveId,
    required this.pathId,
    required this.tentativeId,
    this.onTapDetail,
  });
}
