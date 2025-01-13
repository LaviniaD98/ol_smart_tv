import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/calendar/days_to_highlight_model.dart';
import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_icon_button.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:table_calendar/table_calendar.dart';
import 'week_row_item.dart';
import 'package:collection/collection.dart';

class WeekRow extends StatefulWidget {
  final List<DaysToHighlightModel> highlighted;
  final DateTime date;
  final OnDayTap onTap;
  final ValueNotifier<DateTime> focusedDayNotifier;
  final ValueNotifier<DateTime> selectedDayNotifier;
  final void Function(DateTime)? onWeekChanged;
  final void Function(TraversalDirection)? onFocusOutside;
  final OlFocusScopeNode parentFocus;

  const WeekRow({
    super.key,
    required this.date,
    required this.highlighted,
    required this.onTap,
    required this.focusedDayNotifier,
    required this.selectedDayNotifier,
    required this.parentFocus,
    this.onWeekChanged,
    this.onFocusOutside,
  });

  @override
  State<WeekRow> createState() => _WeekRowState();
}

class _WeekRowState extends State<WeekRow> {
  final focusNode = OlFocusScopeNode(id: 'WeekRow');

  CalendarFormat _calendarFormat = CalendarFormat.month;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: <ShortcutActivator, VoidCallback>{
        const SingleActivator(LogicalKeyboardKey.arrowLeft): () {
          final res = focusNode.focusInDirection(TraversalDirection.left);

          if (res == false) {
            widget.parentFocus.focusInDirection(TraversalDirection.left);
          }
        },
        const SingleActivator(LogicalKeyboardKey.arrowDown): () {
          final res = focusNode.focusInDirection(TraversalDirection.down);
          if (res == false) {
            widget.parentFocus.focusInDirection(TraversalDirection.down);
          }
        },
      },
      child: FocusScope(
        node: focusNode,
        onFocusChange: (value) {},
        child: ValueListenableBuilder(
            valueListenable: widget.selectedDayNotifier,
            builder: (context, sDay, _) {
              return ValueListenableBuilder(
                  valueListenable: widget.focusedDayNotifier,
                  builder: (context, fDay, _) {
                    return Stack(
                      children: [
                        TableCalendar(
                          firstDay: DateTime.now()
                              .subtract(const Duration(days: 365)),
                          lastDay:
                              DateTime.now().add(const Duration(days: 365)),
                          focusedDay: sDay,
                          currentDay: fDay,
                          calendarFormat: CalendarFormat.week,
                          availableCalendarFormats: const {
                            CalendarFormat.week: 'Week',
                          },
                          selectedDayPredicate: (day) {
                            final selectedDay =
                                widget.selectedDayNotifier.value;
                            return isSameDay(selectedDay, day);
                          },
                          onDaySelected: (selectedDay, focusedDay) {
                            if (!isSameDay(widget.selectedDayNotifier.value,
                                selectedDay)) {
                              widget.focusedDayNotifier.value = focusedDay;
                              widget.selectedDayNotifier.value = selectedDay;
                            }
                          },
                          onFormatChanged: (format) {
                            if (_calendarFormat != format) {
                              setState(() => _calendarFormat = format);
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
                            decoration: const BoxDecoration(
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
                                selected: isSameDay(
                                    day, widget.selectedDayNotifier.value),
                                date: day,
                                type: _activityType(
                                  widget.highlighted.firstWhereOrNull(
                                      (el) => el.day == day.day),
                                ),
                                onTap: widget.onTap,
                              );
                            },
                            outsideBuilder: (context, day, focusedDay) {
                              return WeekRowItem(
                                isOffMonth: true,
                                selected: false,
                                date: day,
                                type: _activityType(
                                  widget.highlighted.firstWhereOrNull(
                                      (el) => el.day == day.day),
                                ),
                                onTap: widget.onTap,
                              );
                            },
                            defaultBuilder: (context, day, focusedDay) {
                              return WeekRowItem(
                                selected: isSameDay(
                                    day, widget.selectedDayNotifier.value),
                                date: day,
                                type: _activityType(
                                  widget.highlighted.firstWhereOrNull(
                                      (el) => el.day == day.day),
                                ),
                                onTap: widget.onTap,
                              );
                            },
                            todayBuilder: (context, day, focusedDay) {
                              return WeekRowItem(
                                selected: isSameDay(
                                    day, widget.selectedDayNotifier.value),
                                date: day,
                                type: _activityType(
                                  widget.highlighted.firstWhereOrNull(
                                      (el) => el.day == day.day),
                                ),
                                onTap: (_) {},
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
                            widget.focusedDayNotifier.value = focusedDay;
                            widget.onWeekChanged?.call(focusedDay);
                          },
                          calendarStyle: const CalendarStyle(),
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
                    );
                  });
            }),
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
