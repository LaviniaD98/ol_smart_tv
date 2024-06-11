import 'dart:developer';

import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/row/strip_row.dart';
import 'package:open_learning_smart_tv/presentation/wall/wall_strip_content_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/dependency_injection/dependency_injection.dart';
import '../../../../theme/app_theme.dart';
import '../../../common/widgets/cards/learning_card.dart';
import '../../cubit/dynamic_content_cubit.dart' as dc;
import 'cubit/standard_strip_cubit.dart';

class StandardStripRow extends StatelessWidget {
  final StripRow strip;
  const StandardStripRow({super.key, required this.strip});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode)
      print("${DateTime.now()} https:// in StandardStripRow build");
    return BlocProvider(
      create: (context) => getIt<StandardStripCubit>()
        ..fetch(
          strip: strip,
          filters: (context.read<dc.DynamicContentCubit>().state as dc.Success)
              .filters,
        ),
      child: _StandardStripContent(key: key, strip: strip),
    );
  }
}

class _StandardStripContent extends StatefulWidget {
  final StripRow strip;
  const _StandardStripContent({super.key, required this.strip});
  @override
  State<_StandardStripContent> createState() => _StandardStripContentState();
}

class _StandardStripContentState extends State<_StandardStripContent>
    with AutomaticKeepAliveClientMixin {
  static const _padding = EdgeInsets.fromLTRB(12.0, 16.0, 16.0, 0.0);
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener<dc.DynamicContentCubit, dc.DynamicContentState>(
      listener: (contexts, state) => state.mapOrNull(
        success: (_) => context
            .read<StandardStripCubit>()
            .fetch(strip: widget.strip, filters: _.filters),
      ),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 100),
        child: BlocBuilder<StandardStripCubit, StandardStripState>(
          builder: (context, state) => state.map(
            success: (value) => value.items.isNotEmpty
                ? AspectRatio(
                    aspectRatio: Dimens.learningCardRatio,
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
                                    context.pushNamed(
                                      WallStripContentPage.routeName,
                                      extra: WallStripContentPageArgs(
                                          widget.strip),
                                    );
                                  },
                                  child: Transform.scale(
                                      scale: 0.9999,
                                      child: SvgPicture.asset(
                                          "assets/icons/right_arrow.svg",
                                          colorFilter: ColorFilter.mode(
                                              ColorManager()
                                                  .getColorTextPrimary(),
                                              BlendMode.srcIn)))),
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
        aspectRatio: Dimens.learningCardRatio,
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
