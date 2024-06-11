import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/calendar/widgets/calendar_shimmer.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/dependency_injection/dependency_injection.dart';
import '../../../../domain/entities/strip/calendar/activity/calendar_activity.dart';
import '../../../../domain/entities/strip/calendar/days_to_highlight_model.dart';
import '../../../../domain/entities/strip/row/strip_row.dart';
import '../../../../domain/enums/types.dart';
import '../../../common/widgets/dialog/calendar/ol_calendar_dialog.dart';
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

class _CalendarStripContent extends StatelessWidget {
  final StripRow strip;
  final bool smartLearningEnabled;

  const _CalendarStripContent({
    super.key,
    required this.strip,
    required this.smartLearningEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalendarStripCubit, CalendarStripState>(
      buildWhen: (previous, current) => previous is! ParentShimmer,
      listenWhen: (previous, current) => current.maybeWhen(
        orElse: () => false,
      ),
      builder: (context, state) => state.maybeMap(
        success: (value) => _content(
          context,
          activities: value.activities,
          daysToHighlight: value.daysToHighlight,
          date: value.date,
        ),
        error: (value) => _content(context, hasError: true, date: value.date),
        innerShimmer: (value) =>
            _content(context, showShimmer: true, date: value.date),
        orElse: () => const SizedBox.shrink(),
      ),
      listener: (BuildContext context, CalendarStripState state) {},
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
    return Container(
      padding: const EdgeInsets.all(Dimens.spacingM),
      margin: const EdgeInsets.all(Dimens.spacingL),
      decoration: BoxDecoration(
        gradient: AppTheme.greyGradient,
        borderRadius: const BorderRadius.all(Radius.circular(Dimens.radius)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat(DateFormat.YEAR_MONTH).format(date).capitalize,
            style: AppTextTheme.subtitle(
              color: ColorManager().getColorTextPrimary(),
              weight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: Dimens.spacingM),
          WeekRow(
            highlighted: daysToHighlight ?? [],
            date: date,
            onTap: (date) {
              if (!showShimmer)
                context.read<CalendarStripCubit>().fetch(strip, date);
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
                      date: date, hasError: hasError, items: activities ?? []),
            ),
          ),
          const SizedBox(height: Dimens.spacingM),
          Row(
            children: [
              InkWell(
                onTap: () {
                  if (activities?.isNotEmpty == true) {
                    context.pushNamed(
                      OlCalendarDialog.routeName,
                      extra: OlCalendarDialogArgs(
                        type: AgendaEventType.events,
                        activities: activities,
                      ),
                    );
                  }
                },
                child: Container(
                  height: Dimens.buttonHeight,
                  padding: const EdgeInsets.symmetric(
                    vertical: Dimens.spacingXS,
                    horizontal: Dimens.spacingM,
                  ),
                  decoration: BoxDecoration(
                    color: ColorManager().getColorBackgroundPrimaryLighter(),
                    borderRadius: BorderRadius.circular(Dimens.radius),
                    border: Border.all(
                        width: 1, color: ColorManager().getColorBorderTag()),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/download.svg",
                    colorFilter: ColorFilter.mode(
                        (activities?.isNotEmpty == true)
                            ? ColorManager().getColorSystemSecondary04()
                            : ColorManager().getColorSystemDisabled(),
                        BlendMode.srcIn),
                  ),
                ),
              ),
              if (smartLearningEnabled) ...[
                const SizedBox(width: Dimens.spacingXS),
                Expanded(
                  child: SmartLearningButton(
                    onTap: date.isAfter(
                            DateTime.now().subtract(const Duration(days: 1)))
                        ? () async {
                            final res =
                                await SmartLearningBottomSheet.create<bool>(
                              context,
                              date: date,
                              strip: strip,
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

  Widget get _innerShimmerLoader {
    return Shimmer.fromColors(
      baseColor: AppColors.white.withOpacity(.2),
      highlightColor: AppColors.primaryFaded,
      period: const Duration(seconds: 2),
      child: const InnerCalendarShimmer(),
    );
  }
}
