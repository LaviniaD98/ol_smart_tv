import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/domain/entities/menu/route/menu_route.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/row/strip_row.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/calendar/calendar_strip_row.dart';
import 'package:open_learning_smart_tv/presentation/main/main_state_cubit.dart';

class AgendaScreen extends StatefulWidget {
  const AgendaScreen({
    super.key,
    required this.dynamicRoutes,
  });
  final List<MenuRoute> dynamicRoutes;

  static const String apiRoute =
      '/learning-catalogue/{corporateId}/{initiativeId}/learnerAgenda?selectedDate=2024-09-13&startDate=2024-09-09&endDate=2024-09-15&pageNumber=0&pageSize=9';

  @override
  State<AgendaScreen> createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen>
    with AutomaticKeepAliveClientMixin {
  MenuRoute? currentMenuRoute;

  final OrderedTraversalPolicy _focusNodeOrder = OrderedTraversalPolicy();

  final focusNode = FocusScopeNode(debugLabel: 'Agenda');

  @override
  void initState() {
    super.initState();

    context.read<MainStateCubit>().agendaFocusNode = focusNode;

    currentMenuRoute = widget.dynamicRoutes.firstWhereOrNull(
      (element) => element.routeName == 'widgetCalendar',
    );
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
          final res = focusNode.focusInDirection(TraversalDirection.left);

          if (res == false) {
            final focus = context.read<MainStateCubit>().state;
            focus.requestFocus();
          }
        },
      },
      child: Scaffold(
        backgroundColor: OLColors.backgroundPrimary,
        body: FocusScope(
          node: focusNode,
          onFocusChange: (value) {
            if (value) {
              print('focusNode: ${focusNode.debugLabel}');
            }
          },
          child: Builder(
            builder: (context) {
              final strip = StripRow.widgetCalendar(
                id: 30001,
                apiPath: AgendaScreen.apiRoute,
              );

              return CalendarStripRow(
                strip,
                smartLearningEnabled: true,
              );
            },
          ),
        ),

        // BlocProvider(
        //   create: (_) =>
        //       getIt<AgendaContentCubit>()..init(AgendaScreen.apiRoute),
        //   child: BlocConsumer<AgendaContentCubit, AgendaContentState>(
        //     listener: (context, state) {
        //       state.maybeWhen(
        //         success: (_) {},
        //         loading: () {},
        //         error: (f) {},
        //         orElse: () {},
        //       );
        //     },
        //     listenWhen: (previous, current) {
        //       return current.maybeWhen(
        //         success: (_) => true,
        //         orElse: () => false,
        //       );
        //     },
        //     builder: (context, state) => state.map(
        //       success: (value) {
        //         final smart = context
        //             .read<AgendaContentCubit>()
        //             .dynamicContent
        //             ?.smartConfig;

        //         final source =
        //             List<Map<StripRow, List<LearningObjectModel>>>.from(
        //           value.rowItems ?? [],
        //         );
        //         source.removeWhere(
        //           (element) => element.entries.firstOrNull == null,
        //         );

        //         print('source:$source');

        //         final contentSource = source.firstWhereOrNull(
        //           (element) =>
        //               element.entries.firstOrNull?.key.labelMapping ==
        //               'currentMenuRoute',
        //         );

        //         print('contentSource?.keys: ${contentSource?.keys}');

        //         if (contentSource?.keys.firstOrNull == null) {
        //           return const SizedBox();
        //         }

        //         final strip = StripRow.widgetCalendar(
        //             id: 30001, apiPath: AgendaScreen.apiRoute);

        //         return CalendarStripRow(
        //           strip,
        //           smartLearningEnabled: smart?.smartLearning == true,
        //         );
        //       },
        //       loading: (value) => const Center(
        //         child: CircularProgressIndicator(),
        //       ),
        //       error: (value) => ErrorScreen(
        //         title: LabelsManager().getRemoteStringFromLabelKeys(
        //           RemoteLabelKeys.error,
        //         ),
        //         message: value.failure.error ??
        //             LabelsManager().getRemoteStringFromLabelKeys(
        //               RemoteLabelKeys.error_occurred,
        //             ),
        //         onReload: () => context.read<DynamicAllContentCubit>().init(
        //               currentMenuRoute?.apiPath ?? '',
        //             ),
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
