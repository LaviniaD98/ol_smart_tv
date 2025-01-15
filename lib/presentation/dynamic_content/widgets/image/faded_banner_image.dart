import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/trailer/video_player_trailer.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';

class FadedBannerImage extends StatelessWidget {
  const FadedBannerImage({
    super.key,
    this.urlImage,
    this.urlVideo,
  });

  final String? urlImage;
  final String? urlVideo;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Opacity(
          opacity: 1,
          child: ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.transparent,
                  OLColors.backgroundPrimary,
                ],
              ).createShader(
                Rect.fromLTRB(
                  0,
                  0,
                  rect.width,
                  rect.height,
                ),
              );
            },
            blendMode: BlendMode.dstIn,
            child: Builder(builder: (context) {
              if (urlVideo != null) {
                return VideoPlayerTrailerWidget(urlVideo!);
              }
              return CachedNetworkImage(
                imageUrl: urlImage ?? '',
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.white.withValues(alpha: .05),
                  ),
                ),
              );
            }),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                end: const Alignment(0.0, 1),
                begin: const Alignment(0.0, -1),
                colors: <Color>[
                  OLColors.backgroundPrimary,
                  OLColors.backgroundPrimary.withValues(alpha: 0.0),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                end: const Alignment(0.0, -1),
                begin: const Alignment(0.0, 1),
                colors: <Color>[
                  OLColors.backgroundPrimary,
                  OLColors.backgroundPrimary.withValues(alpha: 0.0),
                ],
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    end: Alignment.centerRight,
                    begin: Alignment.centerLeft,
                    stops: const [0.0, 0.5],
                    colors: <Color>[
                      OLColors.backgroundPrimary,
                      OLColors.backgroundPrimary.withValues(alpha: 0.0),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
