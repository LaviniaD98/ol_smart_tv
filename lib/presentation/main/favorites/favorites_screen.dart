import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/core/dependency_injection/dependency_injection.dart';
import 'package:open_learning_smart_tv/domain/entities/menu/route/menu_route.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/row/strip_row.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/error/error_screen.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/cubit/dynamic_all_content_cubit.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/cubit/favorites_content_cubit.dart';
import 'package:open_learning_smart_tv/presentation/main/favorites/favorites_vertical_carousel.dart';
import 'package:open_learning_smart_tv/presentation/main/main_state_cubit.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';

class FavoritesScreen extends StatefulWidget {
  static const apiPath =
      '/learning-catalogue/{corporateId}/{initiativeId}/pageStructures?pageName=FAVOURITES_OVERVIEW';

  const FavoritesScreen({required this.dynamicRoutes, super.key});

  final List<MenuRoute> dynamicRoutes;

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  MenuRoute? currentMenuRoute;

  final focusNode = OlFocusScopeNode(id: 'ForYou');

  @override
  void initState() {
    super.initState();

    currentMenuRoute = widget.dynamicRoutes.firstWhereOrNull(
      (element) => element.routeName == 'favourites',
    );

    context.read<MainStateCubit>().favoriteContentCubit =
        getIt<FavoritesContentCubit>();

    context.read<MainStateCubit>().favoritesFocusNode = focusNode;
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: <ShortcutActivator, VoidCallback>{
        const SingleActivator(LogicalKeyboardKey.arrowLeft): () {
          final focus = context.read<MainStateCubit>().state;
          focus.requestFocus();
        },
      },
      child: Scaffold(
        backgroundColor: OLColors.backgroundPrimary,
        body: BlocProvider(
          create: (_) => context.read<MainStateCubit>().favoriteContentCubit!
            ..init(FavoritesScreen.apiPath, null, true),
          child: RefreshIndicator(
            color: ColorManager().getColorTextPrimaryCta(),
            backgroundColor: ColorManager().getColorBackgroundPrimaryLighter(),
            onRefresh: () => context
                .read<DynamicAllContentCubit>()
                .refresh(FavoritesScreen.apiPath),

            /// Dynamic Strip
            child: BlocConsumer<FavoritesContentCubit, FavoritesContentState>(
              listener: (context, state) {
                state.maybeWhen(
                  success: (_) {},
                  loading: () {},
                  error: (f) {},
                  orElse: () {},
                );
              },
              listenWhen: (previous, current) {
                return current.maybeWhen(
                  success: (_) => true,
                  orElse: () => false,
                );
              },
              builder: (context, state) => state.map(
                success: (value) {
                  // final smart = context
                  //     .read<DynamicAllContentCubit>()
                  //     .dynamicContent
                  //     ?.smartConfig;

                  Future.delayed(
                    const Duration(milliseconds: 300),
                    () {
                      if (focusNode.focusedChild == null) {
                        final f = focusNode.descendants.firstWhereOrNull(
                          (element) =>
                              (element as OlFocusable?)?.id ==
                              'BUTTONS FOCUS 0 ----- 1',
                        );
                        f?.requestFocus();
                      }
                    },
                  );

                  final source =
                      List<Map<StripRow, List<LearningObjectModel>>>.from(
                    value.rowItems ?? [],
                  );
                  source.removeWhere(
                    (element) => element.entries.firstOrNull == null,
                  );

                  final contentSource = source.firstWhereOrNull(
                    (element) =>
                        element.entries.firstOrNull?.key.labelMapping ==
                        'yourFavourites',
                  );

                  return content(contentSource);
                },
                loading: (value) => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (value) => ErrorScreen(
                  title: LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.error,
                  ),
                  message: value.failure.error ??
                      LabelsManager().getRemoteStringFromLabelKeys(
                        RemoteLabelKeys.error_occurred,
                      ),
                  onReload: () => context.read<DynamicAllContentCubit>().init(
                        currentMenuRoute?.apiPath ?? '',
                      ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget content(Map<StripRow, List<LearningObjectModel>>? contentSource) {
    if (contentSource == null) {
      return const SizedBox.shrink();
    }
    return FocusScope(
      node: focusNode,
      onFocusChange: (value) {
        // print('FAVORITES HAS FOCUS: $value - ${focusNode.focusedChild}');
        // if (value) {}

        // print('focusNode.children: ${focusNode.children.length}');
      },
      child: Row(
        children: [
          Expanded(
            child: FavoritesVerticalCarousel(
              strip: contentSource,
            ),
          ),
        ],
      ),
    );
  }
}
