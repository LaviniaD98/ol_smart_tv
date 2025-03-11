import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/core/dependency_injection/dependency_injection.dart';
import 'package:open_learning_smart_tv/domain/entities/menu/route/menu_route.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/calendar/activity/calendar_activity.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/row/strip_row.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/error/error_screen.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/cubit/dynamic_all_content_cubit.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/calendar/cubit/calendar_strip_cubit.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/calendar/widgets/learning_object_activity.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/calendar/widgets/smart_learning_activity.dart';
import 'package:open_learning_smart_tv/presentation/main/agenda/agenda_screen.dart';
import 'package:open_learning_smart_tv/presentation/main/for_you/for_you_vertical_carousel.dart';
import 'package:open_learning_smart_tv/presentation/main/main_state_cubit.dart';
import 'package:open_learning_smart_tv/presentation/main/widgets/user_widgets_list.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';

class ForYouScreen extends StatefulWidget {
  const ForYouScreen({required this.dynamicRoutes, super.key});

  final List<MenuRoute> dynamicRoutes;

  @override
  State<ForYouScreen> createState() => _ForYouScreenState();
}

class _ForYouScreenState extends State<ForYouScreen>
    with AutomaticKeepAliveClientMixin {
  MenuRoute? currentMenuRoute;

  final focusNode = OlFocusScopeNode(id: 'ForYou');
  final forYouFocusNode = OlFocusScopeNode(id: 'ForYou-Items-List');

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
                  success: (c, _, filters, refreshing) {
                    Future.delayed(const Duration(milliseconds: 100), () {
                      focusNode.requestFocus();
                    });
                  },
                  loading: () {},
                  error: (f) {},
                  orElse: () {},
                );
              },
              listenWhen: (previous, current) {
                return current.maybeWhen(
                  success: (c, _, filters, refreshing) => true,
                  orElse: () => false,
                );
              },
              builder: (context, state) => state.map(
                success: (value) {
                  context.read<MainStateCubit>().homeContentCubit =
                      context.read<DynamicAllContentCubit>();

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
                loading: (value) => content(null, isLoading: true),
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

  Widget content(
    Map<StripRow, List<LearningObjectModel>>? contentSource, {
    bool isLoading = false,
  }) {
    const strip = StripRow.widgetCalendar(
      id: 30002,
      apiPath: AgendaScreen.apiRoute,
    );

    return FocusScope(
      node: focusNode,
      onFocusChange: (value) {
        print('focusNode.hasFocus: ${value}');
        if (value) {
          if (focusNode.focusedChild == null) {
            forYouFocusNode.requestFocus();
          }
        }
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: FocusScope(
              node: forYouFocusNode,
              onFocusChange: (value) {
                if (value) {
                  if (forYouFocusNode.focusedChild == null) {
                    final res = forYouFocusNode.nextFocus();
                    if (!res) {
                      context
                          .read<MainStateCubit>()
                          .firstForYouCardFocus
                          ?.requestFocus();
                    }
                  }
                }
              },
              child: CallbackShortcuts(
                bindings: <ShortcutActivator, VoidCallback>{
                  const SingleActivator(LogicalKeyboardKey.arrowRight): () {
                    final focus = focusNode.descendants
                        .firstWhereOrNull((e) => e.id == 'User-Widgets');

                    focus?.requestFocus();
                  },
                },
                child: Builder(builder: (context) {
                  if (isLoading) {
                    return ForYouVerticalCarousel.buildShimmerList();
                  }
                  if (contentSource == null) {
                    return const SizedBox.shrink();
                  }
                  return Column(
                    children: [
                      Expanded(
                        child: ForYouVerticalCarousel(
                          strip: contentSource,
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 60),
                BlocProvider(
                  create: (context) => getIt<CalendarStripCubit>()
                    ..fetch(
                      strip,
                      DateTime.now(),
                      endDate: DateTime.now().add(const Duration(days: 14)),
                    ),
                  child: BlocBuilder<CalendarStripCubit, CalendarStripState>(
                    buildWhen: (previous, current) => previous is ParentShimmer,
                    builder: (context, state) {
                      return state.maybeMap(
                        success: (value) =>
                            returnEventsBuilder(value.activities),
                        error: (value) => returnEventsBuilder([]),
                        parentShimmer: (value) => const SizedBox.shrink(),
                        orElse: () => const SizedBox.shrink(),
                      );
                    },
                  ),
                ),
                const UserWidgetsList(),
              ],
            ),
          ),
          const SizedBox(width: Dimens.hPadding),
        ],
      ),
    );
  }

  Widget returnEventsBuilder(List<CalendarActivity> items) {
    if (items.isEmpty) {
      return const SizedBox.shrink();
    }
    return SizedBox(
      width: 550,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        padding: const EdgeInsets.only(bottom: 40),
        itemBuilder: (context, index) {
          return items[index].map(
            learningObject: (e) => LearningObjectActivity(
              model: e.model,
              date: DateTime.now(),
              index: index,
              onFocusChanged: (c) {},
            ),
            smartLearningObject: (e) => SmartLearningActivity(
              model: e.model,
              date: DateTime.now(),
              index: index,
              onFocusChanged: (c) {},
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => false;
}
