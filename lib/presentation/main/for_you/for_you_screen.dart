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
import 'package:open_learning_smart_tv/presentation/common/widgets/error/error_screen.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/cubit/dynamic_all_content_cubit.dart';
import 'package:open_learning_smart_tv/presentation/main/for_you/for_you_vertical_carousel.dart';
import 'package:open_learning_smart_tv/presentation/main/for_you/widget_focus_card.dart';
import 'package:open_learning_smart_tv/presentation/main/main_state_cubit.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ForYouScreen extends StatefulWidget {
  const ForYouScreen({required this.dynamicRoutes, super.key});

  final List<MenuRoute> dynamicRoutes;

  @override
  State<ForYouScreen> createState() => _ForYouScreenState();
}

class _ForYouScreenState extends State<ForYouScreen>
    with AutomaticKeepAliveClientMixin {
  final OrderedTraversalPolicy _policy = OrderedTraversalPolicy();

  final autoScrollController = AutoScrollController(
    viewportBoundaryGetter: () => const Rect.fromLTRB(0, 100, 0, 0),
    axis: Axis.vertical,
  );

  MenuRoute? currentMenuRoute;

  final FocusScopeNode focusNode = FocusScopeNode(debugLabel: 'ForYou');
  final FocusScopeNode widgetsFocusNode =
      FocusScopeNode(debugLabel: 'ForYou-Widgets');
  final FocusScopeNode forYouFocusNode =
      FocusScopeNode(debugLabel: 'ForYou-Widgets');

  @override
  void initState() {
    super.initState();

    currentMenuRoute = widget.dynamicRoutes.firstWhereOrNull(
      (element) => element.routeName == 'visForyou',
    );

    context.read<MainStateCubit>().forYouFocusNode = focusNode;
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
          create: (_) => getIt<DynamicAllContentCubit>()
            ..init(currentMenuRoute?.apiPath ?? ''),
          child: RefreshIndicator(
            color: ColorManager().getColorTextPrimaryCta(),
            backgroundColor: ColorManager().getColorBackgroundPrimaryLighter(),
            onRefresh: () => context.read<DynamicAllContentCubit>().refresh(
                  currentMenuRoute?.apiPath ?? '',
                ),

            /// Dynamic Strip
            child: BlocConsumer<DynamicAllContentCubit, DynamicAllContentState>(
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
                  final smart = context
                      .read<DynamicAllContentCubit>()
                      .dynamicContent
                      ?.smartConfig;

                  print('smartConfig: ${smart?.visForyou}');

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
                        'visForyou',
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
        if (value) {
          if (focusNode.focusedChild == null) {
            forYouFocusNode.requestFocus();
          }
        }
      },
      child: Row(
        children: [
          Expanded(
            child: FocusScope(
              node: forYouFocusNode,
              onFocusChange: (value) {
                if (value) {
                  if (forYouFocusNode.focusedChild == null) {
                    forYouFocusNode.nextFocus();
                  }
                }
              },
              child: CallbackShortcuts(
                bindings: <ShortcutActivator, VoidCallback>{
                  const SingleActivator(LogicalKeyboardKey.arrowRight): () {
                    widgetsFocusNode.requestFocus();
                  },
                },
                child: ForYouVerticalCarousel(
                  strip: contentSource,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 550,
            child: CallbackShortcuts(
              bindings: <ShortcutActivator, VoidCallback>{
                const SingleActivator(LogicalKeyboardKey.arrowUp): () {
                  _policy.previous(widgetsFocusNode);
                },
                const SingleActivator(LogicalKeyboardKey.arrowDown): () {
                  _policy.next(widgetsFocusNode);
                },
                const SingleActivator(LogicalKeyboardKey.arrowLeft): () {
                  forYouFocusNode.requestFocus();
                },
              },
              child: FocusTraversalGroup(
                key: const ValueKey('Widgets-list'),
                policy: _policy,
                child: FocusScope(
                  node: widgetsFocusNode,
                  onFocusChange: (value) {
                    if (value) {
                      if (widgetsFocusNode.focusedChild == null) {
                        final firstFocus =
                            _policy.findFirstFocus(widgetsFocusNode);
                        firstFocus?.requestFocus();
                      }
                    }
                  },
                  child: ListView.separated(
                    controller: autoScrollController,
                    clipBehavior: Clip.none,
                    padding: const EdgeInsets.only(
                      left: Dimens.hViewPadding,
                      right: Dimens.hViewPadding,
                      top: 100,
                      bottom: 400,
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: Dimens.spacingXS),
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return CallbackShortcuts(
                        bindings: <ShortcutActivator, VoidCallback>{
                          const SingleActivator(LogicalKeyboardKey.enter):
                              () {},
                          const SingleActivator(LogicalKeyboardKey.select):
                              () {},
                        },
                        child: AutoScrollTag(
                          key: ValueKey(index),
                          controller: autoScrollController,
                          index: index,
                          child: WidgetFocusCard(
                            index: index,
                            onFocusChange: (p0) {
                              if (p0) {
                                autoScrollController.scrollToIndex(index,
                                    preferPosition: AutoScrollPosition.begin);
                              }
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
