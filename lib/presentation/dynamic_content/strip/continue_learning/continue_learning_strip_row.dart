import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/dependency_injection/dependency_injection.dart';
import '../../../../domain/entities/strip/row/strip_row.dart';
import '../../../../theme/app_theme.dart';
import '../../../common/widgets/continue_card.dart';
import '../../../course_detail/detail_page.dart';
import '../../../wall/wall_strip_content_page.dart';
import '../../cubit/dynamic_content_cubit.dart';
import 'cubit/continue_learning_strip_cubit.dart';

class ContinueLearningStripRow extends StatefulWidget {
  final StripRow strip;
  const ContinueLearningStripRow({super.key, required this.strip});

  @override
  State<ContinueLearningStripRow> createState() =>
      _ContinueLearningStripRowState();
}

class _ContinueLearningStripRowState extends State<ContinueLearningStripRow>
    with AutomaticKeepAliveClientMixin {
  static const _padding = EdgeInsets.fromLTRB(20.0, 16.0, 16.0, 32.0);

  @override
  void initState() {
    getIt<ContinueLearningStripCubit>().fetch(
      stripRow: widget.strip,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener<DynamicContentCubit, DynamicContentState>(
      listener: (contexts, state) => state.mapOrNull(
        success: (_) => context
            .read<ContinueLearningStripCubit>()
            .fetch(stripRow: widget.strip),
      ),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 100),
        child:
            BlocBuilder<ContinueLearningStripCubit, ContinueLearningStripState>(
          builder: (context, state) => state.map(
            success: (value) => value.items.isNotEmpty
                ? Column(
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
                                    extra:
                                        WallStripContentPageArgs(widget.strip),
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
                        height: Dimens.continueCardHeight,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: _padding,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: Dimens.spacingXS),
                          itemCount: value.items.length,
                          itemBuilder: (context, index) {
                            return ContinueCard(
                              data: value.items[index],
                              index: index,
                              onButtonPressed: (index) {
                                context.pushNamed(
                                  DetailPage.routeName,
                                  extra: DetailPageArgs(
                                    id: value.items[index].id.toString(),
                                    parentId:
                                        value.items[index].parentId?.toString(),
                                    grandParentId: value
                                        .items[index].grandParentId
                                        ?.toString(),
                                    typology: value
                                        .items[index].learningObjectTypology,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(20.0, 4.0, 16.0, 4.0),
            width:
                (MediaQuery.of(context).size.width / Dimens.continueCardWidth) *
                    .7,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.3),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          SizedBox(
            height: Dimens.continueCardHeight,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: _padding,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) =>
                  const SizedBox(width: Dimens.spacingXS),
              itemCount: 2,
              itemBuilder: (context, index) {
                return const ContinueCardShimmer();
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
