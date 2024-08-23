import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/row/strip_row.dart';
import 'package:open_learning_smart_tv/presentation/main/explore/explore_carousel_item.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ExploreCarousel extends StatefulWidget {
  final Map<StripRow, List<LearningObjectModel>> row;
  final void Function(bool)? onFocusChange;

  const ExploreCarousel({
    super.key,
    required this.row,
    this.onFocusChange,
  });

  @override
  State<ExploreCarousel> createState() => _ExploreCarouselState();
}

class _ExploreCarouselState extends State<ExploreCarousel> {
  late CarouselSliderController carouselController;
  late PageController pageController;

  final FocusScopeNode focusNode =
      FocusScopeNode(debugLabel: 'EXPLORE_CAROUSEL');

  @override
  void initState() {
    super.initState();
    carouselController = CarouselSliderController();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final strip = widget.row.entries.firstOrNull;

    if (strip == null) {
      return const SizedBox.shrink();
    }

    if (strip.value.isEmpty) {
      return const SizedBox.shrink();
    }

    return CallbackShortcuts(
      bindings: <ShortcutActivator, VoidCallback>{
        const SingleActivator(LogicalKeyboardKey.arrowRight): () {
          carouselController.nextPage();
        },
        const SingleActivator(LogicalKeyboardKey.arrowLeft): () {
          carouselController.previousPage();
        },
      },
      child: FocusTraversalGroup(
        key: ValueKey(strip.key.labelMapping),
        child: FocusScope(
          node: focusNode,
          onFocusChange: (value) {
            widget.onFocusChange?.call(value);
            setState(() {});
          },
          child: Padding(
            padding: const EdgeInsets.only(
              left: Dimens.hViewPadding,
              right: Dimens.hViewPadding,
              top: 40,
            ),
            child: Stack(
              children: [
                Opacity(
                  opacity: 0,
                  child: SizedBox(
                    height: 0,
                    child: PageView.builder(
                      itemCount: strip.value.length,
                      controller: pageController,
                      itemBuilder: (context, index) {
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ),
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: OLColors.backgroundCard,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: focusNode.hasFocus
                          ? OLColors.textPrimary
                          : OLColors.border,
                      width: focusNode.hasFocus ? 5 : 1,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                  ),
                  child: CarouselSlider.builder(
                    itemBuilder: (context, index, realIndex) {
                      final obj = strip.value[index];
                      return ExploreCarouselItem(item: obj);
                    },
                    carouselController: carouselController,
                    options: CarouselOptions(
                      height: 600,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 8),
                      aspectRatio: 16 / 9,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                    itemCount: strip.value.length,
                  ),
                ),
                Positioned(
                  bottom: 26,
                  right: 44,
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      dotHeight: 12,
                      dotWidth: 12,
                      spacing: 16,
                      expansionFactor: 3.2,
                      activeDotColor: OLColors.textPrimary,
                      dotColor: OLColors.textPrimary.withOpacity(0.5),
                    ),
                    onDotClicked: (index) {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get _shimmerLoader {
    return Shimmer.fromColors(
      baseColor: AppColors.white.withOpacity(.09),
      highlightColor: AppColors.primaryFaded,
      period: const Duration(seconds: 2),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.3),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: focusNode.hasFocus ? OLColors.textPrimary : OLColors.border,
            width: focusNode.hasFocus ? 5 : 1,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
        height: 600,
      ),
    );
  }
}
