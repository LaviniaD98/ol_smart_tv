import 'package:flutter/services.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/calendar/cubit/calendar_month_strip_cubit.dart'
    as month;
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/calendar/ol_month_calendar.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/calendar/widgets/calendar_shimmer.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/calendar/widgets/grid_activities.dart';
import 'package:open_learning_smart_tv/presentation/main/main_state_cubit.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/dependency_injection/dependency_injection.dart';
import '../../../../domain/entities/strip/calendar/activity/calendar_activity.dart';
import '../../../../domain/entities/strip/calendar/days_to_highlight_model.dart';
import '../../../../domain/entities/strip/row/strip_row.dart';
import 'cubit/calendar_strip_cubit.dart';
import 'widgets/inner_calendar_shimmer.dart';
import 'widgets/week_row.dart';

class CalendarStripRow extends StatefulWidget {
  final StripRow strip;
  final bool smartLearningEnabled;

  const CalendarStripRow(
    this.strip, {
    super.key,
    required this.smartLearningEnabled,
  });

  @override
  State<CalendarStripRow> createState() => _CalendarStripRowState();
}

class _CalendarStripRowState extends State<CalendarStripRow> {
  late ValueNotifier<DateTime> focusedDayNotifier;
  late ValueNotifier<DateTime> selectedDayNotifier;

  @override
  void initState() {
    super.initState();
    focusedDayNotifier = ValueNotifier(DateTime.now());
    selectedDayNotifier = ValueNotifier(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 500,
          child: BlocProvider(
            create: (context) => getIt<month.CalendarMonthStripCubit>()
              ..init(widget.strip, widget.smartLearningEnabled),
            child: BlocBuilder<month.CalendarMonthStripCubit,
                month.CalendarMonthStripState>(
              buildWhen: (previous, current) => previous is month.ParentShimmer,
              builder: (context, state) {
                final calendar = _CalendarStripContent(
                  key: const ValueKey('calendarWidget'),
                  strip: widget.strip,
                  smartLearningEnabled: widget.smartLearningEnabled,
                  focusedDayNotifier: focusedDayNotifier,
                  selectedDayNotifier: selectedDayNotifier,
                  fullMonth: true,
                );
                return state.maybeMap(
                  success: (value) => calendar,
                  error: (value) => calendar,
                  parentShimmer: (value) => const CalendarShimmer(),
                  orElse: () => const SizedBox.shrink(),
                );
              },
            ),
          ),
        ),
        Expanded(
          child: BlocProvider(
            create: (context) => getIt<CalendarStripCubit>()
              ..init(widget.strip, widget.smartLearningEnabled),
            child: AnimatedSize(
              alignment: Alignment.topCenter,
              duration: const Duration(milliseconds: 200),
              child: BlocBuilder<CalendarStripCubit, CalendarStripState>(
                buildWhen: (previous, current) => previous is ParentShimmer,
                builder: (context, state) {
                  final calendar = _CalendarStripContent(
                    key: const ValueKey('calendarWidget'),
                    strip: widget.strip,
                    smartLearningEnabled: widget.smartLearningEnabled,
                    focusedDayNotifier: focusedDayNotifier,
                    selectedDayNotifier: selectedDayNotifier,
                  );
                  return state.maybeMap(
                    success: (value) => calendar,
                    error: (value) => calendar,
                    parentShimmer: (value) => const CalendarShimmer(),
                    orElse: () => const SizedBox.shrink(),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CalendarStripContent extends StatefulWidget {
  final StripRow strip;
  final bool smartLearningEnabled;
  final bool fullMonth;
  final ValueNotifier<DateTime> focusedDayNotifier;
  final ValueNotifier<DateTime> selectedDayNotifier;

  const _CalendarStripContent({
    super.key,
    required this.strip,
    required this.smartLearningEnabled,
    required this.focusedDayNotifier,
    required this.selectedDayNotifier,
    this.fullMonth = false,
  });

  @override
  State<_CalendarStripContent> createState() => _CalendarStripContentState();
}

class _CalendarStripContentState extends State<_CalendarStripContent> {
  final focusNode = OlFocusScopeNode(id: 'CalendarStripContent');

  @override
  Widget build(BuildContext context) {
    if (widget.fullMonth) {
      return BlocConsumer<month.CalendarMonthStripCubit,
          month.CalendarMonthStripState>(
        buildWhen: (previous, current) => previous is! month.ParentShimmer,
        listenWhen: (previous, current) => current.maybeWhen(
          orElse: () => false,
        ),
        builder: (context, state) => state.maybeMap(
          success: (value) {
            return _content(
              context,
              activities: value.activities,
              daysToHighlight: value.daysToHighlight,
              date: value.date,
            );
          },
          error: (value) => _content(
            context,
            hasError: true,
            date: value.date,
          ),
          innerShimmer: (value) => _content(
            context,
            showShimmer: true,
            date: value.date,
          ),
          orElse: () => const SizedBox.shrink(),
        ),
        listener:
            (BuildContext context, month.CalendarMonthStripState state) {},
      );
    }

    return CallbackShortcuts(
      bindings: <ShortcutActivator, VoidCallback>{
        const SingleActivator(LogicalKeyboardKey.arrowLeft): () {
          final res = focusNode.focusInDirection(TraversalDirection.left);

          if (res == false) {
            final focus = context.read<MainStateCubit>().state;
            focus.requestFocus();
          }
        },
        const SingleActivator(LogicalKeyboardKey.arrowDown): () {
          final res = focusNode.focusInDirection(TraversalDirection.down);

          if (res == false) {
            //widget.onFocusOutside?.call(TraversalDirection.down);
          }
        },
      },
      child: FocusScope(
        node: focusNode,
        onFocusChange: (value) {},
        child: BlocConsumer<CalendarStripCubit, CalendarStripState>(
          buildWhen: (previous, current) => previous is! ParentShimmer,
          listenWhen: (previous, current) => current.maybeWhen(
            orElse: () => false,
          ),
          builder: (context, state) => state.maybeMap(
            success: (value) {
              return _content(
                context,
                activities: value.activities,
                daysToHighlight: value.daysToHighlight,
                date: value.date,
              );
            },
            error: (value) => _content(
              context,
              hasError: true,
              date: value.date,
            ),
            innerShimmer: (value) => _content(
              context,
              showShimmer: true,
              date: value.date,
            ),
            orElse: () => const SizedBox.shrink(),
          ),
          listener: (BuildContext context, CalendarStripState state) {},
        ),
      ),
    );
  }

  Widget _content(
    BuildContext context, {
    List<CalendarActivity>? activities,
    List<DaysToHighlightModel>? daysToHighlight,
    bool showShimmer = false,
    bool hasError = false,
    required DateTime date,
  }) {
    if (widget.fullMonth) {
      return Container(
        width: 500,
        padding: const EdgeInsets.all(Dimens.spacingM),
        margin: const EdgeInsets.all(Dimens.spacingL),
        child: OlMonthCalendar(
          focusedDayNotifier: widget.focusedDayNotifier,
          selectedDayNotifier: widget.selectedDayNotifier,
          highlighted: daysToHighlight ?? [],
          onPageChanged: (p0) {
            context
                .read<month.CalendarMonthStripCubit>()
                .fetch(widget.strip, p0);
          },
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(Dimens.spacingM),
        margin: const EdgeInsets.all(Dimens.spacingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WeekRow(
              focusedDayNotifier: widget.focusedDayNotifier,
              selectedDayNotifier: widget.selectedDayNotifier,
              highlighted: daysToHighlight ?? [],
              date: date,
              onWeekChanged: (focusedDay) {
                context
                    .read<CalendarStripCubit>()
                    .fetch(widget.strip, focusedDay);
              },
              onTap: (date) {
                widget.selectedDayNotifier.value = date;
                context.read<CalendarStripCubit>().fetch(widget.strip, date);
              },
              parentFocus: focusNode,
            ),
            const Divider(height: Dimens.spacingXXXL, color: AppColors.grey),
            Flexible(
              child: AnimatedSize(
                alignment: Alignment.topCenter,
                duration: const Duration(milliseconds: 160),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 600),
                  child: showShimmer
                      ? _innerShimmerLoader
                      : GridActivities(
                          items: activities ?? [],
                          date: date,
                          parentFocus: focusNode,
                          hasError: hasError,
                        ),
                ),
              ),
            ),
            //const SizedBox(height: Dimens.spacingM),
            // Row(
            //   children: [
            //     if (widget.smartLearningEnabled) ...[
            //       Expanded(
            //         child: SmartLearningButton(
            //           onTap: date.isAfter(
            //                   DateTime.now().subtract(const Duration(days: 1)))
            //               ? () async {
            //                   final res =
            //                       await SmartLearningBottomSheet.create<bool>(
            //                     context,
            //                     date: date,
            //                     strip: widget.strip,
            //                   );
            //                   if (context.mounted && res != null && res) {
            //                     context.read<CalendarStripCubit>().refresh();
            //                   }
            //                 }
            //               : null,
            //         ),
            //       ),
            //     ],
            //   ],
            // )
          ],
        ),
      );
    }
  }

  Widget get _innerShimmerLoader {
    return Shimmer.fromColors(
      baseColor: AppColors.white.withOpacity(.2),
      highlightColor: AppColors.primaryFaded,
      period: const Duration(seconds: 2),
      child: const InnerCalendarShimmer(),
    );
  }
}
