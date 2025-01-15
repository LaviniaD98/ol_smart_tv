import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_learning_smart_tv/app_manager.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/core/dependency_injection/dependency_injection.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/row/strip_row.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/cards/topic_list.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/cubit/detail_page_cubit.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/detail_page.dart';
import 'package:open_learning_smart_tv/presentation/main/explore/explore_carousel_item.dart';
import 'package:open_learning_smart_tv/presentation/main/main_state_cubit.dart';
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

  static Widget shimmerLoader() {
    return Shimmer.fromColors(
      baseColor: AppColors.white.withValues(alpha: .09),
      highlightColor: AppColors.primaryFaded,
      period: const Duration(seconds: 2),
      child: Padding(
        padding: const EdgeInsets.only(
          left: Dimens.hViewPadding,
          right: Dimens.hViewPadding,
          top: 40,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 110, horizontal: 96),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: .3),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: OLColors.border,
              width: 1,
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
          ),
          height: 600,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 40,
                  width: 160,
                  decoration: BoxDecoration(
                    color: ColorManager()
                        .getColorSystemSecondary05()
                        .withValues(alpha: .6),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  color: ColorManager()
                      .getColorSystemSecondary05()
                      .withValues(alpha: .6),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'Aknlcknlvdfvòòòlmvdfmpovvdf',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextTheme.body(
                    color: Colors.transparent,
                    weight: FontWeight.bold,
                    size: 56,
                  ).copyWith(height: 1),
                ),
              ),

              const SizedBox(height: 28),
              TopicList(
                const ['Testingcdcfd', 'Testing csdc ce'],
                textColor: Colors.transparent,
                color: ColorManager()
                    .getColorSystemSecondary05()
                    .withValues(alpha: .6),
              ),

              const SizedBox(height: 20),
              // descrizione

              Container(
                height: 20,
                width: 400,
                decoration: BoxDecoration(
                  color: ColorManager()
                      .getColorSystemSecondary05()
                      .withValues(alpha: .6),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 20,
                width: 400,
                decoration: BoxDecoration(
                  color: ColorManager()
                      .getColorSystemSecondary05()
                      .withValues(alpha: .6),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 20,
                  width: 200,
                  decoration: BoxDecoration(
                    color: ColorManager()
                        .getColorSystemSecondary05()
                        .withValues(alpha: .6),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<ExploreCarousel> createState() => _ExploreCarouselState();
}

class _ExploreCarouselState extends State<ExploreCarousel> {
  late CarouselSliderController carouselController;
  late PageController pageController;

  final focusNode = OlFocusScopeNode(id: 'EXPLORE_CAROUSEL');

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
          if (strip.value.length > 1) {
            carouselController.nextPage();
          }
        },
        const SingleActivator(LogicalKeyboardKey.arrowLeft): () {
          if (pageController.page == 0) {
            final focus = context.read<MainStateCubit>().state;
            focus.requestFocus();
          } else {
            carouselController.previousPage();
          }
        },
        const SingleActivator(LogicalKeyboardKey.enter): () =>
            pushDetails(items: strip.value),
        const SingleActivator(LogicalKeyboardKey.select): () =>
            pushDetails(items: strip.value),
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
                      autoPlay: strip.value.length > 1 ? true : false,
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
                    count: strip.value.length,
                    effect: ExpandingDotsEffect(
                      dotHeight: 12,
                      dotWidth: 12,
                      spacing: 16,
                      expansionFactor: 3.2,
                      activeDotColor: OLColors.textPrimary,
                      dotColor: OLColors.textPrimary.withValues(alpha: 0.5),
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

  void pushDetails({required List<LearningObjectModel> items}) async {
    final index = pageController.page?.toInt() ?? 0;

    final item = items[index];

    final args = DetailPageArgs(
      id: item.id.toString(),
      object: item,
      parentId: item.parentId?.toString(),
      grandParentId: item.grandParentId?.toString(),
      typology: item.learningObjectTypology,
    );

    manager.pushOnStack(
      screen: BlocProvider(
        create: (_) => getIt<DetailPageCubit>()..init(args),
        child: DetailPage(args: args),
      ),
    );
  }
}
