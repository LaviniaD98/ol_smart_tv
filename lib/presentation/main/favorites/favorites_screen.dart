import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/core/dependency_injection/dependency_injection.dart';
import 'package:open_learning_smart_tv/domain/entities/menu/route/menu_route.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/row/strip_row.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/list_header_title.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/error/error_screen.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/cubit/dynamic_all_content_cubit.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/cubit/favorites_content_cubit.dart';
import 'package:open_learning_smart_tv/presentation/main/favorites/favorites_vertical_carousel.dart';
import 'package:open_learning_smart_tv/presentation/main/main_state_cubit.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';

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

  final focusNode = OlFocusScopeNode(id: 'FavoritesScreen');

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
          print('vsldknvldfnvlkndfkvndnkfv LEFT');
          final focus = context.read<MainStateCubit>().state;
          focus.requestFocus();
        },
      },
      child: Scaffold(
        backgroundColor: OLColors.backgroundPrimary,
        body: BlocProvider.value(
          value: context.read<FavoritesContentCubit>()
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
                  success: (_) {
                    if (focusNode.focusedChild == null) {
                      Future.delayed(const Duration(milliseconds: 100), () {
                        final f = focusNode.descendants.firstWhereOrNull(
                          (element) {
                            return element.id == 'FAVORITES-SCREEN-LIST';
                          },
                        );
                        f?.requestFocus();
                      });
                    }
                  },
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
    final favoritesLength =
        contentSource?.entries.firstOrNull?.value.length ?? 0;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 140.0),
          child: FocusScope(
            node: focusNode,
            onFocusChange: (value) {
              if (value) {}

              //print('FAVORITES HAS FOCUS: $value - ${focusNode.focusedChild}');
              // if (value) {}

              // print('focusNode.children: ${focusNode.children.length}');
            },
            child: Builder(
              builder: (context) {
                if (contentSource == null) {
                  return buildEmptyFavorites();
                }
                if (contentSource.values.isEmpty) {
                  return buildEmptyFavorites();
                }
                return Row(
                  children: [
                    Expanded(
                      child: FavoritesVerticalCarousel(
                        strip: contentSource,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        ListHeaderTitle(
          title: LabelsManager().getRemoteStringFromLabelKeys(
            RemoteLabelKeys.favourite_text,
          ),
          subtitle: favoritesLength > 0
              ? LabelsManager()
                  .getRemoteStringFromLabelKeys(RemoteLabelKeys.saved_count)
                  .replaceFirst('{{count}}', '$favoritesLength')
              : null,
        ),
      ],
    );
  }

  Widget buildEmptyFavorites() {
    return CallbackShortcuts(
      bindings: <ShortcutActivator, VoidCallback>{
        const SingleActivator(LogicalKeyboardKey.arrowLeft): () {
          final focus = context.read<MainStateCubit>().state;
          focus.requestFocus();
        },
      },
      child: Container(
        color: ColorManager().getColorBackgroundPrimaryLighter(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 120,
              width: 120,
              child: Image.asset("assets/images/app_icon.png"),
            ),
            SvgPicture.asset(
              "assets/images/app_logo.svg",
              width: 24,
              height: 44,
              colorFilter: ColorFilter.mode(
                  ColorManager().getColorBackgroundPrimaryCta(),
                  BlendMode.srcIn),
            ),
            const SizedBox(height: 32),
            Text(
              LabelsManager().getRemoteStringFromLabelKeys(
                RemoteLabelKeys.favourites_empty,
              ),
              textAlign: TextAlign.center,
              style: AppTextTheme.body(
                color: ColorManager().getColorTextPrimary(),
                weight: FontWeight.w500,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
