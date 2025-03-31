import 'package:open_learning_smart_tv/domain/entities/detail/detail_page_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/detail_page.dart';
import 'package:open_learning_smart_tv/presentation/video_player/cubit/video_player_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import '../../domain/enums/types.dart';
import '../../remote_theming/labels/labels_manager.dart';
import '../../remote_theming/labels/remote_labels_keys.dart';
import '../common/widgets/error/error_screen.dart';
import 'widgets/video_player_widget.dart';

class VideoPlayerPage extends StatefulWidget {
  static const routeName = 'player';
  final VideoPlayerPageArgs args;
  const VideoPlayerPage({super.key, required this.args});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  VideoPlayerController? controller;
  bool popping = false;

  @override
  Widget build(BuildContext context) {
    return _content;
  }

  @override
  dispose() {
    controller?.dispose();
    super.dispose();
  }

  Widget get _content {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 1, 1),
      body: BlocConsumer<VideoPlayerCubit, VideoPlayerState>(
        listener: (context, state) {
          state.maybeMap(
            done: (value) {
              controller = VideoPlayerController.networkUrl(
                Uri.parse(value.source.src!),
              );
            },
            orElse: () {},
          );
        },
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) => state.map(
          loading: (_) {
            return _loading;
          },
          tracking: (_) => _loading,
          done: (value) {
            print(
                '-----currentObject: ${widget.args.currentObject?.learningObjectTypology}');
            print('parentId:: ${widget.args.currentObject?.parentId}');
            print(
                'grandparentId:: ${widget.args.currentObject?.grandParentId}');

            print(
                'VideoPlayerPage done:${widget.args.type} ${widget.args.title} - ${widget.args.detailModel?.title} - G ${widget.args.grandParentId} - P ${widget.args.parentId}');
                
            return VideoPlayerWidget(
              args: VideoPlayerArgs(
                start: value.bookmark,
                value.source.src!,
                title: widget.args.title,
                typology: widget.args.typology,
                type: widget.args.type,
                isMandatory: widget.args.isMandatory,
                args: widget.args.args!,
                detailModel: widget.args.detailModel,
                grandParentId: widget.args.grandParentId,
                parentId: widget.args.parentId,
                currentObject: widget.args.currentObject,
                onTapDetail: () async {
                  bool enabled =
                      state.maybeMap(orElse: () => true, loading: (_) => false);
                  if (enabled) {
                    if (controller != null) {
                      await context.read<VideoPlayerCubit>().setStateCall(
                            widget.args,
                            false,
                            controller!.value.position,
                            controller!,
                            true,
                          );
                    }

                    if (context.mounted) {
                      Navigator.of(context).pop(true);
                    }
                    widget.args.onTapDetail;
                  }
                },
                controller: controller!,
                videoPlayerType: VideoPlayerType.network,
                onComplete: (controller) async {
                  if (context.mounted) {
                    await context.read<VideoPlayerCubit>().setStateCall(
                          widget.args,
                          false,
                          controller.value.position,
                          controller,
                          true,
                        );

                    // ignore: use_build_context_synchronously
                    await context.read<VideoPlayerCubit>().statementsCall(
                          widget.args,
                          true,
                          controller.value.duration,
                          controller,
                          true,
                        );

                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pop(true);
                  }
                },
                onStart: (controller) {
                  context.read<VideoPlayerCubit>().statementsCall(widget.args,
                      false, controller.value.duration, controller);
                },
                onPause: (controller) {
                  context.read<VideoPlayerCubit>().setStateCall(widget.args,
                      false, controller.value.position, controller);
                },
              ),
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
        title:
            LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.error),
        message: LabelsManager()
            .getRemoteStringFromLabelKeys(RemoteLabelKeys.error_occurred),
        onReload: () {
          context
              .read<VideoPlayerCubit>()
              .init(widget.args.brightcoveId, widget.args);
        },
      ),
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
  final DetailPageModel? detailModel;
  final DetailPageArgs? args;
  final String? grandParentId;
  final String? parentId;
  final LearningObjectModel? currentObject;

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
    this.detailModel,
    this.grandParentId,
    this.parentId,
    required this.args,
    required this.currentObject,
  });
}
