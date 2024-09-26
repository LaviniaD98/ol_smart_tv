import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/calendar/days_to_highlight_model.dart';
import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_icon_button.dart';
import 'package:open_learning_smart_tv/presentation/main/main_state_cubit.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:table_calendar/table_calendar.dart';
import 'week_row_item.dart';
import 'package:collection/collection.dart';

class WeekRow extends StatefulWidget {
  final List<DaysToHighlightModel> highlighted;
  final DateTime date;
  final OnDayTap onTap;

  const WeekRow({
    super.key,
    required this.date,
    required this.highlighted,
    required this.onTap,
  });

  @override
  State<WeekRow> createState() => _WeekRowState();
}

class _WeekRowState extends State<WeekRow> {
  final focusNode = FocusScopeNode(debugLabel: 'WeekRow');

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();

  DateTime? _selectedDay;
  late ValueNotifier<DateTime> focusedDayNotifier;

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
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
      child: FocusScope(
        node: focusNode,
        onFocusChange: (value) {
          if (value) {
            print('HAS FOCUS----------');
          }
        },
        child: Stack(
          children: [
            TableCalendar(
              firstDay: DateTime.now().subtract(const Duration(days: 365)),
              lastDay: DateTime.now().add(const Duration(days: 365)),
              focusedDay: _focusedDay,
              calendarFormat: CalendarFormat.week,
              availableCalendarFormats: const {
                CalendarFormat.week: 'Week',
              },
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                print('------onDaySelected');
                if (!isSameDay(_selectedDay, selectedDay)) {
                  // Call `setState()` when updating the selected day
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                }
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  // Call `setState()` when updating calendar format
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              headerVisible: true,
              rowHeight: 90,
              headerStyle: HeaderStyle(
                headerMargin: const EdgeInsets.only(bottom: 20),
                titleCentered: false,
                formatButtonVisible: false,
                leftChevronVisible: false,
                rightChevronVisible: false,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: OLColors.divider,
                    ),
                  ),
                ),
                titleTextStyle: AppTextTheme.title(
                  color: ColorManager().getColorTextPrimary(),
                  weight: FontWeight.bold,
                  size: 48,
                ),
              ),
              calendarBuilders: CalendarBuilders(
                selectedBuilder: (context, day, focusedDay) {
                  return WeekRowItem(
                    selected: isSameDay(day, widget.date),
                    date: day,
                    type: _activityType(
                      widget.highlighted
                          .firstWhereOrNull((el) => el.day == day.day),
                    ),
                    onTap: widget.onTap,
                  );
                },
                defaultBuilder: (context, day, focusedDay) {
                  return WeekRowItem(
                    selected: isSameDay(day, widget.date),
                    date: day,
                    type: _activityType(
                      widget.highlighted
                          .firstWhereOrNull((el) => el.day == day.day),
                    ),
                    onTap: widget.onTap,
                  );
                },
                dowBuilder: (context, day) {
                  return Column(
                    children: [
                      const SizedBox(height: 12),
                      Text(
                        DateFormat.E().format(day).capitalize,
                        style: AppTextTheme.caption(
                          color: OLColors.textPrimary,
                          weight: FontWeight.w400,
                          size: 24,
                        ),
                      ),
                      const SizedBox(height: Dimens.spacingXS),
                    ],
                  );
                },
              ),
              onCalendarCreated: (pageController) {
                this.pageController = pageController;
              },
              daysOfWeekHeight: 55,
              onPageChanged: (focusedDay) {
                // No need to call `setState()` here
                _focusedDay = focusedDay;
              },
              calendarStyle: CalendarStyle(),
              startingDayOfWeek: StartingDayOfWeek.monday,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OLIconButton(
                  outline: true,
                  image: 'assets/icons/arrow_left.svg',
                  onPressed: () async {
                    pageController.animateToPage(
                      (pageController.page?.toInt() ?? 0) - 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                const SizedBox(width: 42),
                OLIconButton(
                  outline: true,
                  image: 'assets/icons/arrow_right.svg',
                  onPressed: () {
                    pageController.animateToPage(
                      (pageController.page?.toInt() ?? 0) + 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<DateTime> get days {
    final firstDayOfWeek =
        widget.date.subtract(Duration(days: widget.date.weekday - 1));
    return List.generate(7, (index) => index)
        .map((value) => firstDayOfWeek.add(Duration(days: value)))
        .toList();
  }

  DayType _activityType(DaysToHighlightModel? highlighted) {
    if (highlighted != null) {
      if (highlighted.areThereMandatoryLO == true) {
        return DayType.mandatory;
      } else if (highlighted.areThereLiveLO == true) {
        return DayType.live;
      } else if (highlighted.areThereSmartSlots == true) {
        return DayType.smart;
      }
    }
    return DayType.empty;
  }
}
