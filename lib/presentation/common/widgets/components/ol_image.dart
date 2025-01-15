import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:shimmer/shimmer.dart';

class OLImage extends StatefulWidget {
  const OLImage({
    required this.imageURL,
    this.width,
    this.height,
    this.cacheHeight,
    this.cacheWidth,
    this.showLoading = false,
    this.bgColor,
    this.fit = BoxFit.cover,
    this.loadingSize = 24,
    super.key,
  });

  final String? imageURL;
  final double? width;
  final double? height;
  final int? cacheHeight;
  final int? cacheWidth;
  final BoxFit fit;
  final bool showLoading;
  final double loadingSize;
  final Color? bgColor;

  @override
  State<OLImage> createState() => _OLImageState();
}

class _OLImageState extends State<OLImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: OLColors.backgroundCard,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExtendedImage.network(
        widget.imageURL ?? '',
        cacheHeight: widget.cacheHeight,
        cacheWidth: widget.cacheWidth,
        fit: widget.fit,
        clearMemoryCacheIfFailed: false,
        width: widget.width,
        height: widget.height,
        loadStateChanged: (state) {
          if (state.extendedImageLoadState == LoadState.loading) {
            return Shimmer.fromColors(
              baseColor: AppColors.white.withValues(alpha: .09),
              highlightColor: AppColors.primaryFaded,
              period: const Duration(seconds: 2),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: .3),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            );
          } else if (state.extendedImageLoadState == LoadState.failed) {
            return const SizedBox.shrink();
          } else if (state.extendedImageLoadState == LoadState.completed) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: state.imageProvider,
                  fit: widget.fit,
                ),
              ),
            );
          }
          return null;
        },
      ),
    );
  }
}
