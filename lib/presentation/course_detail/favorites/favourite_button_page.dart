import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/domain/entities/detail/detail_page_model.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/favourite_model.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/favorites/cubit/favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class FavoriteButton extends StatelessWidget {
  final DetailPageModel detailPageModel;
  final String? parentId;
  final String? grandParentId;

  const FavoriteButton({
    super.key,
    required this.detailPageModel,
    this.parentId,
    this.grandParentId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavouriteCubit, FavouriteState>(
      listener: (context, state) => state.whenOrNull(),
      listenWhen: (previous, current) => current.maybeMap(
        error: (_) => false,
        orElse: () => false,
      ),
      buildWhen: (previous, current) => current.maybeMap(
        success: (_) => true,
        orElse: () => true,
      ),
      builder: (context, state) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 120),
        child: state.maybeWhen(
          loading: () => const SizedBox.shrink(),
          error: () {
            return buildAddToFavoriteButton(
              context,
              detailPageModel: detailPageModel,
              parentId: parentId,
              grandParentId: grandParentId,
            );
          },
          success: (DetailPageModel detailPageModel) =>
              buildAddToFavoriteButton(
            context,
            detailPageModel: detailPageModel,
            parentId: parentId,
            grandParentId: grandParentId,
          ),
          orElse: () => const SizedBox.shrink(),
        ),
      ),
    );
  }

  Widget get _loading {
    return const Center(
      child: SizedBox.square(
        dimension: 12.0,
        child: CircularProgressIndicator(
          strokeWidth: 1,
        ),
      ),
    );
  }

  Widget buildAddToFavoriteButton(
    BuildContext context, {
    required DetailPageModel detailPageModel,
    String? parentId,
    String? grandParentId,
    FavouriteModel? favouriteModel,
  }) {
    return GestureDetector(
        onTap: () {
          if (detailPageModel.isFavourite == true) {
            context.read<FavouriteCubit>().removeFromFavorite(
                  detailPageModel: detailPageModel,
                  parentId: parentId,
                  grandParentId: grandParentId,
                );
          } else {
            context.read<FavouriteCubit>().addToFavorite(
                  detailPageModel: detailPageModel,
                  parentId: parentId,
                  grandParentId: grandParentId,
                );
          }
        },
        behavior: HitTestBehavior.translucent,
        child: detailPageModel.isFavourite == true
            ? SizedBox.square(
                dimension: 24.0,
                child: Transform.scale(
                  scale: 0.9999,
                  child: SvgPicture.asset("assets/icons/detail/favourite.svg",
                      colorFilter: ColorFilter.mode(
                          ColorManager().getColorBackgroundPrimaryCta(),
                          BlendMode.srcIn)),
                ),
              )
            : Transform.scale(
                scale: 0.9999,
                child: SvgPicture.asset(
                  "assets/icons/detail/dettaglio_add.svg",
                  colorFilter: ColorFilter.mode(
                      ColorManager().getColorBackgroundPrimaryCta(),
                      BlendMode.srcIn),
                )));
  }
}
