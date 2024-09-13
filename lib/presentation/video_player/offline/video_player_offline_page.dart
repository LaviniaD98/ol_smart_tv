import 'dart:io';

import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/domain/entities/download/downloaded_item_wall.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/error/error_screen.dart';
import 'package:open_learning_smart_tv/presentation/video_player/offline/cubit/video_player_offline_cubit.dart';
import 'package:open_learning_smart_tv/presentation/video_player/widgets/video_player_widget.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerOfflinePage extends StatefulWidget {
  static const routeName = 'offlineplayer';
  final VideoPlayerOfflinePageArgs args;
  const VideoPlayerOfflinePage({super.key, required this.args});

  @override
  State<VideoPlayerOfflinePage> createState() => _VideoPlayerOfflinePageState();
}

class _VideoPlayerOfflinePageState extends State<VideoPlayerOfflinePage> {
  late VideoPlayerController controller;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppColors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: UnconstrainedBox(
            alignment: Alignment.centerRight,
            child:
                BlocBuilder<VideoPlayerOfflineCubit, VideoPlayerOfflineState>(
                    builder: (context, state) {
              bool enabled =
                  state.maybeMap(orElse: () => true, loading: (_) => false);
              return GestureDetector(
                onTap: enabled
                    ? () async {
                        await context
                            .read<VideoPlayerOfflineCubit>()
                            .handlePlayerEvent(PlayerEvent.onClose, controller,
                                widget.args.downloadedItemExtended, true);
                        if (context.mounted) {
                          Navigator.of(context).pop(true);
                        }
                      }
                    : null,
                behavior: HitTestBehavior.opaque,
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimens.radius),
                    color: ColorManager().getColorBackgroundPrimary(),
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/back_arrow.svg',
                  ),
                ),
              );
            }),
          ),
        ),
        body: BlocBuilder<VideoPlayerOfflineCubit, VideoPlayerOfflineState>(
          builder: (context, state) => state.map(
            loading: (_) => _loading,
            done: (value) {
              controller = VideoPlayerController.file(File(value.fileFullPath));
              return VideoPlayerWidget(
                args: VideoPlayerArgs(
                  start: value.bookmark,
                  value.fileFullPath,
                  title: widget.args.title,
                  typology: widget.args.typology,
                  type: widget.args.type,
                  onTapDetail: widget.args.onTapDetail,
                  isMandatory: widget.args.downloadedItemExtended.downloadedItem
                          ?.isMandatory ??
                      false,
                  // isMandatory: false,
                  controller: controller,
                  videoPlayerType: VideoPlayerType.file,
                  onStart: (playerControler) {
                    context.read<VideoPlayerOfflineCubit>().handlePlayerEvent(
                        PlayerEvent.onStart,
                        playerControler,
                        widget.args.downloadedItemExtended);
                  },
                  onPause: (playerControler) {
                    context.read<VideoPlayerOfflineCubit>().handlePlayerEvent(
                        PlayerEvent.onPause,
                        playerControler,
                        widget.args.downloadedItemExtended);
                  },
                  onComplete: (playerControler) async {
                    await context
                        .read<VideoPlayerOfflineCubit>()
                        .handlePlayerEvent(
                            PlayerEvent.onComplete,
                            playerControler,
                            widget.args.downloadedItemExtended,
                            true);
                    if (context.mounted) {
                      Navigator.of(context).pop(true);
                    }
                  },
                ),
              );
            },
            error: (_) => _error(context),
          ),
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
        onReload: () => context.read<VideoPlayerOfflineCubit>()
          ..init(widget.args.downloadedItemExtended),
      ),
    );
  }
}

class VideoPlayerOfflinePageArgs {
  final int id;
  final String title;
  final LearningObjectTypology typology;
  final LearningObjectType type;
  final String? brightcoveId;
  final VoidCallback? onTapDetail;
  final DownloadedItemExtended downloadedItemExtended;

  VideoPlayerOfflinePageArgs({
    required this.id,
    required this.title,
    required this.typology,
    required this.type,
    required this.brightcoveId,
    this.onTapDetail,
    required this.downloadedItemExtended,
  });
}
