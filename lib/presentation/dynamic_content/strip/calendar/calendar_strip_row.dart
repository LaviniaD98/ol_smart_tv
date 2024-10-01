import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/calendar/ol_month_calendar.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/calendar/widgets/calendar_shimmer.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/dependency_injection/dependency_injection.dart';
import '../../../../domain/entities/strip/calendar/activity/calendar_activity.dart';
import '../../../../domain/entities/strip/calendar/days_to_highlight_model.dart';
import '../../../../domain/entities/strip/row/strip_row.dart';
import '../../../common/widgets/smart_learning_bottom_sheet/smart_learning_bottom_sheet.dart';
import 'cubit/calendar_strip_cubit.dart';
import 'widgets/activities.dart';
import 'widgets/inner_calendar_shimmer.dart';
import 'widgets/smart_learning_button.dart';
import 'widgets/week_row.dart';

class CalendarStripRow extends StatelessWidget {
  final StripRow strip;
  final bool smartLearningEnabled;

  const CalendarStripRow(
    this.strip, {
    super.key,
    required this.smartLearningEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<CalendarStripCubit>()..init(strip, smartLearningEnabled),
      child: AnimatedSize(
        alignment: Alignment.topCenter,
        duration: const Duration(milliseconds: 200),
        child: BlocBuilder<CalendarStripCubit, CalendarStripState>(
          buildWhen: (previous, current) => previous is ParentShimmer,
          builder: (context, state) {
            final calendar = _CalendarStripContent(
              key: const ValueKey('calendarWidget'),
              strip: strip,
              smartLearningEnabled: smartLearningEnabled,
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
    );
  }
}

class _CalendarStripContent extends StatefulWidget {
  final StripRow strip;
  final bool smartLearningEnabled;
  final bool fullMonth;

  const _CalendarStripContent({
    super.key,
    required this.strip,
    required this.smartLearningEnabled,
    this.fullMonth = false,
  });

  @override
  State<_CalendarStripContent> createState() => _CalendarStripContentState();
}

class _CalendarStripContentState extends State<_CalendarStripContent> {
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
    return BlocConsumer<CalendarStripCubit, CalendarStripState>(
      buildWhen: (previous, current) => previous is! ParentShimmer,
      listenWhen: (previous, current) => current.maybeWhen(
        orElse: () => false,
      ),
      builder: (context, state) => state.maybeMap(
        success: (value) {
          return buildLayout(
            context,
            activities: value.activities,
            daysToHighlight: value.daysToHighlight,
            date: value.date,
          );
        },
        error: (value) => buildLayout(
          context,
          hasError: true,
          date: value.date,
        ),
        innerShimmer: (value) => buildLayout(
          context,
          showShimmer: true,
          date: value.date,
        ),
        orElse: () => const SizedBox.shrink(),
      ),
      listener: (BuildContext context, CalendarStripState state) {},
    );
  }

  Widget buildLayout(
    BuildContext context, {
    List<CalendarActivity>? activities,
    List<DaysToHighlightModel>? daysToHighlight,
    bool showShimmer = false,
    bool hasError = false,
    required DateTime date,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _content(
          context,
          activities: activities,
          daysToHighlight: daysToHighlight,
          date: date,
          fullMonth: true,
        ),
        Expanded(
          child: _content(
            context,
            hasError: hasError,
            activities: activities,
            daysToHighlight: daysToHighlight,
            date: date,
          ),
        ),
      ],
    );
  }

  Widget _content(
    BuildContext context, {
    List<CalendarActivity>? activities,
    List<DaysToHighlightModel>? daysToHighlight,
    bool showShimmer = false,
    bool hasError = false,
    bool fullMonth = false,
    required DateTime date,
  }) {
    if (fullMonth) {
      return Container(
        width: 500,
        padding: const EdgeInsets.all(Dimens.spacingM),
        margin: const EdgeInsets.all(Dimens.spacingL),
        child: OlMonthCalendar(
          focusedDayNotifier: focusedDayNotifier,
          selectedDayNotifier: selectedDayNotifier,
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
              focusedDayNotifier: focusedDayNotifier,
              selectedDayNotifier: selectedDayNotifier,
              highlighted: daysToHighlight ?? [],
              date: date,
              onTap: (date) {
                selectedDayNotifier.value = date;
                context.read<CalendarStripCubit>().fetch(widget.strip, date);
              },
            ),
            const Divider(height: Dimens.spacingXXXL, color: AppColors.grey),
            AnimatedSize(
              alignment: Alignment.topCenter,
              duration: const Duration(milliseconds: 160),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 600),
                child: showShimmer
                    ? _innerShimmerLoader
                    : Activities(
                        date: date,
                        hasError: hasError,
                        items: activities ?? [],
                      ),
              ),
            ),
            const SizedBox(height: Dimens.spacingM),
            Row(
              children: [
                if (widget.smartLearningEnabled) ...[
                  Expanded(
                    child: SmartLearningButton(
                      onTap: date.isAfter(
                              DateTime.now().subtract(const Duration(days: 1)))
                          ? () async {
                              final res =
                                  await SmartLearningBottomSheet.create<bool>(
                                context,
                                date: date,
                                strip: widget.strip,
                              );
                              if (context.mounted && res != null && res) {
                                context.read<CalendarStripCubit>().refresh();
                              }
                            }
                          : null,
                    ),
                  ),
                ],
              ],
            )
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
