import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/domain/entities/community/attachments_item_model.dart';
import 'package:open_learning_smart_tv/presentation/video_player/community/video_player_community_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../../core/dependency_injection/dependency_injection.dart';
import '../../../domain/entities/download/source_model.dart';
import '../../../router/app_router.dart';
import '../../../theme/app_theme.dart';
import '../../../wrappers/tracking/tracking_manager.dart';
import 'cubit/video_player_thumbnail_cubit.dart';

class VideoPlayerThumbnailWidget extends StatefulWidget {
  final AttachmentsItemModel brightcove;
  final EdgeInsets? padding;
  const VideoPlayerThumbnailWidget(
    this.brightcove, {
    super.key,
    this.padding,
  });

  @override
  State<VideoPlayerThumbnailWidget> createState() =>
      _VideoPlayerThumbnailWidgetState();
}

class _VideoPlayerThumbnailWidgetState
    extends State<VideoPlayerThumbnailWidget> {
  late VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<VideoPlayerThumbnailCubit>()..init(widget.brightcove.content),
      child: BlocBuilder<VideoPlayerThumbnailCubit, VideoPlayerThumbnailState>(
        builder: (context, state) => AnimatedSwitcher(
          duration: const Duration(milliseconds: 120),
          child: state.maybeWhen(
            done: (SourceModel source, String thumbnail) => Padding(
              padding:
                  widget.padding ?? const EdgeInsets.only(top: Dimens.spacingM),
              child: _content(context, source, thumbnail),
            ),
            error: () => const SizedBox.shrink(),
            orElse: () => Padding(
              padding:
                  widget.padding ?? const EdgeInsets.only(top: Dimens.spacingM),
              child: _loading,
            ),
          ),
        ),
      ),
    );
  }

  Widget _content(BuildContext context, SourceModel source, String thumbnail) {
    return InkWell(
      onTap: () async {
        WakelockPlus.enable();
        await context.pushNamed(VideoPlayerCommunityPage.routeName,
            extra: VideoPlayerCommunityPageArgs(
              title: widget.brightcove.name ?? '',
              brightcoveId: widget.brightcove.id,
              source: source,
            ));
        getIt<TrackingManager>().communityTrackingHandler(AppRouter.I.fullPath);
        WakelockPlus.disable();
      },
      child: AspectRatio(
        aspectRatio: 3 / 1.6,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Dimens.radiusImage),
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              _image(thumbnail),
              _overlay,
              UnconstrainedBox(
                child: SizedBox.square(
                  dimension: 24.0,
                  child: SvgPicture.asset(
                    'assets/icons/play.svg',
                    colorFilter: ColorFilter.mode(
                      ColorManager().getColorSystemPrimary01(),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _loading {
    return AspectRatio(
      aspectRatio: 3 / 1.6,
      child: Shimmer.fromColors(
          baseColor: AppColors.white.withOpacity(.09),
          highlightColor: AppColors.primaryFaded,
          period: const Duration(seconds: 2),
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(.2),
            ),
          )),
    );
  }

  Widget get _overlay {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ColorManager().getColorBackgroundPrimaryLighter().withOpacity(.3),
            ColorManager().getColorBackgroundPrimaryLighter().withOpacity(.7),
          ],
        ),
      ),
    );
  }

  Widget _image(String? url) {
    if (url != null && url.isNotEmpty == true) {
      return CachedNetworkImage(
        imageUrl: url,
        errorWidget: (context, url, error) => _placeholder,
        alignment: Alignment.center,
        fit: BoxFit.cover,
      );
    }
    return _placeholder;
  }

  Widget get _placeholder {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(.05),
      ),
    );
  }
}
