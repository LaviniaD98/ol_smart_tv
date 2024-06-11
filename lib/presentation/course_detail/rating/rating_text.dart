import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/domain/entities/detail/detail_page_model.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/rating/rating_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../data/models/responses/generic/object_statistics_dto.dart';

class RatingText extends StatelessWidget {
  final DetailPageModel detailPageModel;

  const RatingText({super.key, required this.detailPageModel});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RatingCubit, RatingState>(
      buildWhen: (previous, current) => current.maybeMap(
        Success: (_) => true,
        orElse: () => false,
      ),
      builder: (context, state) => state.maybeWhen(
        Success: (res, maxStars, _) =>
            buildAddToFavoriteButton(context, res, maxStars),
        orElse: () => const SizedBox(),
      ),
    );
  }

  Widget get _loading {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildAddToFavoriteButton(
      BuildContext context, ObjectStatisticsDto? res, int? maxStars) {
    final String average = (res?.averageRating != null)
        ? NumberFormat('#.#').format(res?.averageRating)
        : "0";

    return Text(
      '$average/${maxStars ?? 5}',
      style: TextStyle(color: ColorManager().getColorTextPrimary()),
    );
  }
}
