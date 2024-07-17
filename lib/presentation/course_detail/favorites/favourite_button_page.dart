import 'package:open_learning_smart_tv/domain/entities/generic/favourite_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_icon_button.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/favorites/cubit/favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteButton extends StatelessWidget {
  final LearningObjectModel object;
  final String? parentId;
  final String? grandParentId;

  const FavoriteButton({
    super.key,
    required this.object,
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
        loading: (_) => false,
        orElse: () => true,
      ),
      builder: (context, state) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 120),
        child: state.maybeWhen(
          loading: () => const SizedBox.shrink(),
          error: () {
            return buildAddToFavoriteButton(
              context,
              object: object,
              parentId: parentId,
              grandParentId: grandParentId,
            );
          },
          success: (LearningObjectModel model) => buildAddToFavoriteButton(
            context,
            object: model,
            parentId: parentId,
            grandParentId: grandParentId,
          ),
          orElse: () => const SizedBox.shrink(),
        ),
      ),
    );
  }

  // Widget get _loading {
  //   return const Center(
  //     child: SizedBox.square(
  //       dimension: 12.0,
  //       child: CircularProgressIndicator(
  //         strokeWidth: 1,
  //       ),
  //     ),
  //   );
  // }

  Widget buildAddToFavoriteButton(
    BuildContext context, {
    required LearningObjectModel object,
    String? parentId,
    String? grandParentId,
    FavouriteModel? favouriteModel,
  }) {
    return OLIconButton(
      outline: true,
      image: object.isFavourite == true
          ? "assets/icons/detail/favourite.svg"
          : "assets/icons/detail/dettaglio_add.svg",
      onPressed: () {
        if (object.isFavourite == true) {
          context.read<FavouriteCubit>().removeFromFavorite(
                model: object,
                parentId: parentId,
                grandParentId: grandParentId,
              );
        } else {
          context.read<FavouriteCubit>().addToFavorite(
                model: object,
                parentId: parentId,
                grandParentId: grandParentId,
              );
        }
      },
    );
  }
}
