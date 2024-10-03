import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/calendar/days_to_highlight_model.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/calendar/widgets/week_row_item.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../theme/app_theme.dart';

class OlMonthCalendar extends StatefulWidget {
  const OlMonthCalendar({
    required this.focusedDayNotifier,
    required this.selectedDayNotifier,
    required this.highlighted,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.dayBuilder,
    this.onPageChanged,
    this.isLoadingNotifier,
    this.rowHeight = 62,
    super.key,
  });
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final ValueNotifier<DateTime> focusedDayNotifier;
  final ValueNotifier<DateTime> selectedDayNotifier;
  final double rowHeight;
  final List<DaysToHighlightModel> highlighted;

  final void Function(DateTime)? onPageChanged;
  final ValueNotifier<bool>? isLoadingNotifier;
  final Widget? Function(
    BuildContext context,
    DateTime selectedDay,
    DateTime focusedDay,
    bool isToday,
    bool isSelected,
    bool isDisabled,
  )? dayBuilder;

  @override
  State<OlMonthCalendar> createState() => _OlMonthCalendarState();
}

class _OlMonthCalendarState extends State<OlMonthCalendar> {
  PageController pageController = PageController();
  DateTime? _selectedDay;

  late ValueNotifier<String> monthStringNotifier;
  late ValueNotifier<bool> isLoadingNotifier;

  bool appStart = true;

  @override
  void initState() {
    super.initState();

    isLoadingNotifier = widget.isLoadingNotifier ?? ValueNotifier(false);

    widget.focusedDayNotifier.addListener(_updateDateString);
    monthStringNotifier = ValueNotifier<String>(
      DateFormat.yMMMM().format(widget.focusedDayNotifier.value),
    );

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      appStart = false;
    });
  }

  void _updateDateString() {
    monthStringNotifier.value =
        DateFormat.yMMMM().format(widget.focusedDayNotifier.value);
  }

  @override
  void didUpdateWidget(covariant OlMonthCalendar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.highlighted != oldWidget.highlighted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    monthStringNotifier.dispose();
    widget.focusedDayNotifier.removeListener(_updateDateString);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<DateTime>(
      valueListenable: widget.focusedDayNotifier,
      builder: (context, fDay, child) {
        return ValueListenableBuilder(
          valueListenable: widget.selectedDayNotifier,
          builder: (context, sDay, _) {
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF19191F),
                    Color(0xFF3E3E43),
                  ],
                ),
                color: OLColors.backgroundPrimary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildMonthSwhitch(),
                  const SizedBox(height: 24),
                  Stack(
                    children: [
                      TableCalendar<dynamic>(
                        focusedDay: fDay,
                        currentDay: sDay,
                        firstDay: widget.firstDate ??
                            DateTime.now().subtract(const Duration(days: 365)),
                        lastDay: widget.lastDate ??
                            DateTime.now().add(const Duration(days: 365)),
                        rowHeight: widget.rowHeight,
                        startingDayOfWeek: StartingDayOfWeek.monday,
                        onPageChanged: (focusedDay) {
                          print('FOCUSED DAY: $focusedDay');
                          widget.onPageChanged?.call(focusedDay);
                        },
                        daysOfWeekHeight: 62,
                        headerStyle: const HeaderStyle(
                          headerMargin: EdgeInsets.only(bottom: 30),
                        ),
                        selectedDayPredicate: (day) {
                          if (appStart && widget.initialDate != null) {
                            return isSameDay(fDay, day);
                          } else {
                            return isSameDay(_selectedDay, day);
                          }
                        },
                        availableGestures: AvailableGestures.none,
                        calendarStyle: const CalendarStyle(
                          markersAlignment: Alignment.center,
                          cellMargin: EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 4,
                          ),
                          cellAlignment: Alignment.center,
                        ),
                        calendarBuilders: CalendarBuilders(
                          selectedBuilder: (context, day, focusedDay) {
                            return WeekRowItem(
                              selected: isSameDay(
                                  day, widget.selectedDayNotifier.value),
                              date: day,
                              isSmall: true,
                              type: _activityType(
                                widget.highlighted.firstWhereOrNull(
                                    (el) => el.day == day.day),
                              ),
                              onTap: (_) {},
                            );
                          },
                          todayBuilder: (context, day, focusedDay) {
                            return WeekRowItem(
                              selected: isSameDay(
                                  day, widget.selectedDayNotifier.value),
                              date: day,
                              isSmall: true,
                              type: _activityType(
                                widget.highlighted.firstWhereOrNull(
                                    (el) => el.day == day.day),
                              ),
                              onTap: (_) {},
                            );
                          },
                          defaultBuilder: (context, day, focusedDay) {
                            return WeekRowItem(
                              selected: isSameDay(
                                  day, widget.selectedDayNotifier.value),
                              date: day,
                              isSmall: true,
                              type: _activityType(
                                widget.highlighted.firstWhereOrNull(
                                    (el) => el.day == day.day),
                              ),
                              onTap: (_) {},
                            );
                          },
                          outsideBuilder: (context, day, focusedDay) {
                            return const SizedBox.shrink();
                          },
                          dowBuilder: (context, day) {
                            return Column(
                              children: [
                                const SizedBox(height: 12),
                                Text(
                                  (DateFormat.E()
                                              .format(day)
                                              .characters
                                              .firstOrNull ??
                                          '')
                                      .capitalize,
                                  style: AppTextTheme.caption(
                                    color: OLColors.accentVariantA,
                                    weight: FontWeight.w700,
                                    size: 16,
                                  ),
                                ),
                                const SizedBox(height: Dimens.spacingXS),
                              ],
                            );
                          },
                        ),
                        headerVisible: false,
                        onCalendarCreated: (controller) {
                          pageController = controller;
                        },
                      ),
                      ValueListenableBuilder<bool>(
                        valueListenable: isLoadingNotifier,
                        builder: (context, isLoading, child) {
                          if (isLoading) {
                            return Positioned.fill(
                              child: Container(color: OLColors.textPrimary),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget buildMonthSwhitch() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.hPadding,
            vertical: 12,
          ),
          child: Row(
            children: [
              Expanded(
                child: ValueListenableBuilder<String>(
                  valueListenable: monthStringNotifier,
                  builder: (context, value, child) {
                    return Text(
                      value,
                      style: AppTextTheme.caption(
                        color: AppColors.red,
                        weight: FontWeight.w700,
                        size: 24,
                      ).copyWith(height: 1.3),
                      textAlign: TextAlign.center,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
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

class CalendarController extends ChangeNotifier {
  CalendarController({required this.day});
  DateTime day;

  void changeDay(DateTime day) {
    this.day = day;
    notifyListeners();
  }
}
