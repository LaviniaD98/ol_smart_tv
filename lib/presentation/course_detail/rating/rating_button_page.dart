import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/data/models/responses/generic/object_statistics_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/detail/detail_page_model.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_icon_button.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/rating/ratings_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/rating/rating_cubit.dart';

class RatingButton extends StatelessWidget {
  final DetailPageModel detailPageModel;
  final String? parentId;
  final String? grandParentId;

  const RatingButton({
    super.key,
    required this.detailPageModel,
    this.parentId,
    this.grandParentId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RatingCubit, RatingState>(
      listener: (context, state) {},
      buildWhen: (previous, current) => current.maybeMap(
        Error: (_) => false,
        orElse: () => true,
      ),
      builder: (context, state) => state.maybeWhen(
        Success: (rating, maxStars, previousRating) => _ratingStarButton(
          detailPageModel,
          rating,
          maxStars,
          context,
          previousRating,
        ),
        orElse: () => const SizedBox(),
      ),
    );
  }

  Widget _ratingStarButton(
    DetailPageModel model,
    ObjectStatisticsDto? rating,
    int? maxStars,
    BuildContext buildContext,
    int? previousRating,
  ) {
    String iconPath = buildContext
        .read<RatingCubit>()
        .getRatingIconButton(rating, maxStars: maxStars);

    return OLIconButton(
      outline: true,
      image: iconPath,
      onPressed: () async {
        await showDialog(
          context: buildContext,
          barrierColor:
              ColorManager().getColorBackgroundDrawerWidget().withOpacity(.5),
          builder: (_) => RatingsDialog(
            detailPageModel: model,
            max: maxStars ?? 5,
            initialRating: previousRating ?? 0,
          ),
        );
        if (buildContext.mounted) {
          buildContext.read<RatingCubit>().updateRating(model);
        }
      },
    );
  }
}
