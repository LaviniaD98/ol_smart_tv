import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/domain/entities/menu/route/menu_route.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/row/strip_row.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/calendar/calendar_strip_row.dart';
import 'package:open_learning_smart_tv/presentation/main/main_state_cubit.dart';

class AgendaScreen extends StatefulWidget {
  const AgendaScreen({
    super.key,
    required this.dynamicRoutes,
  });
  final List<MenuRoute> dynamicRoutes;

  static const String apiRoute =
      '/learning-catalogue/{corporateId}/{initiativeId}/learnerAgenda?selectedDate={selectedDate}&startDate={startDate}&endDate={endDate}&pageNumber={pageNumber}&pageSize={pageSize}';

  @override
  State<AgendaScreen> createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen>
    with AutomaticKeepAliveClientMixin {
  MenuRoute? currentMenuRoute;

  final focusNode = OlFocusScopeNode(id: 'Agenda');

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
          onFocusChange: (value) {},
          child: Builder(
            builder: (context) {
              const strip = StripRow.widgetCalendar(
                id: 30001,
                apiPath: AgendaScreen.apiRoute,
              );

              return const CalendarStripRow(
                strip,
                smartLearningEnabled: true,
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
