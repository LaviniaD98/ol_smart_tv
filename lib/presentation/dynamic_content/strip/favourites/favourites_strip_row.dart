import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/core/utils/nav.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/row/strip_row.dart';
import 'package:open_learning_smart_tv/presentation/wall/wall_strip_content_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/dependency_injection/dependency_injection.dart';
import '../../../../theme/app_theme.dart';
import '../../../common/widgets/cards/learning_card.dart';
import '../../cubit/dynamic_content_cubit.dart' as dc;
import 'cubit/favourites_strip_cubit.dart';

class FavouritesStripRow extends StatefulWidget {
  final StripRow strip;
  const FavouritesStripRow({super.key, required this.strip});

  @override
  State<FavouritesStripRow> createState() => _FavouritesStripRowState();
}

class _FavouritesStripRowState extends State<FavouritesStripRow>
    with AutomaticKeepAliveClientMixin {
  static const _padding = EdgeInsets.fromLTRB(12.0, 16.0, 16.0, 0.0);

  @override
  void initState() {
    getIt<FavouritesStripCubit>().fetch(
      stripRow: widget.strip,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener<dc.DynamicContentCubit, dc.DynamicContentState>(
      listener: (contexts, state) => state.mapOrNull(
        success: (_) =>
            context.read<FavouritesStripCubit>().fetch(stripRow: widget.strip),
      ),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 100),
        child: BlocBuilder<FavouritesStripCubit, FavouritesStripState>(
          builder: (context, state) => state.map(
            success: (value) => value.items.isNotEmpty
                ? AspectRatio(
                    aspectRatio: Dimens.learningCardRatio.toDouble(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 4.0,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  widget.strip.label,
                                  style: AppTextTheme.subtitle(
                                    weight: FontWeight.w700,
                                    color: ColorManager().getColorTextPrimary(),
                                  ),
                                ),
                              ),
                              const SizedBox(width: Dimens.spacingM),
                              GestureDetector(
                                onTap: () {
                                  Nav.push(
                                    context,
                                    screen: WallStripContentPage(
                                      WallStripContentPageArgs(widget.strip),
                                    ),
                                  );
                                },
                                child: SvgPicture.asset(
                                  "assets/icons/right_arrow.svg",
                                  colorFilter: ColorFilter.mode(
                                      ColorManager().getColorTextPrimary(),
                                      BlendMode.srcIn),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Dimens.learningCardHeight,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            padding: _padding,
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: Dimens.spacingXS),
                            itemCount: value.items.length,
                            itemBuilder: (context, index) {
                              return LearningCard(data: value.items[index]);
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
            loading: (value) => _shimmerLoader,
            error: (_) => const SizedBox.shrink(),
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
      child: AspectRatio(
        aspectRatio: Dimens.learningCardTVRatio,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20.0, 4.0, 16.0, 4.0),
              width: (MediaQuery.of(context).size.width /
                      Dimens.learningCardRatio) *
                  .7,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.3),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            SizedBox(
              height: Dimens.learningCardHeight,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: _padding,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) =>
                    const SizedBox(width: Dimens.spacingXS),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return const LearningCardShimmer();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
