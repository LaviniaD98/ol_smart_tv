import 'dart:developer';

import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/ol_alert_dialog.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/onboarding/onboarding_sheet.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/onboarding/tutorial_sheet.dart';
import 'package:open_learning_smart_tv/presentation/offline_state/offline_cubit.dart';
import 'package:open_learning_smart_tv/router/app_router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../remote_theming/labels/labels_manager.dart';
import '../../remote_theming/labels/remote_labels_keys.dart';
import '../../theme/app_theme.dart';
import '../common/widgets/dialog/ol_syncing_dialog.dart';
import '../common/widgets/error/error_screen.dart';
import 'cubit/dynamic_content_cubit.dart';
import 'strip/calendar/calendar_strip_row.dart';
import 'strip/continue_learning/continue_learning_strip_row.dart';
import 'strip/favourites/favourites_strip_row.dart';
import 'strip/standard/standard_strip_row.dart';

class DynamicContent extends StatelessWidget {
  final DynamicContentArgs args;
  const DynamicContent({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppTheme.backgroundGradient),
      child: SafeArea(
        child: RefreshIndicator(
          color: ColorManager().getColorTextPrimaryCta(),
          backgroundColor: ColorManager().getColorBackgroundPrimaryLighter(),
          onRefresh: () =>
              context.read<DynamicContentCubit>().refresh(args.apiPath),
          child: CustomScrollView(
            slivers: [
              if (args.header != null) args.header!,

              /// Dynamic Strip
              BlocBuilder<DynamicContentCubit, DynamicContentState>(
                builder: (context, state) => state.map(
                  success: (_) {
                    if (kDebugMode)
                      print("${DateTime.now()} https:// in _stripRows");
                    return _stripRows(_);
                  },
                  loading: (value) => const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  error: (value) => SliverFillRemaining(
                    child: ErrorScreen(
                      title: LabelsManager()
                          .getRemoteStringFromLabelKeys(RemoteLabelKeys.error),
                      message: value.failure.error ??
                          LabelsManager().getRemoteStringFromLabelKeys(
                              RemoteLabelKeys.error_occurred),
                      onReload: () => context
                          .read<DynamicContentCubit>()
                          .init(args.apiPath),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _stripRows(Success value) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final row = value.page.strips[index];
          return row.maybeMap(
            visCarSuggested: (_) => (value.smartConfig?.visCarSuggested == true)
                ? StandardStripRow(strip: row)
                : const SizedBox(),
            latestLearning: (_) =>
                (value.smartConfig?.carConteSpeciDurata == true)
                    ? StandardStripRow(strip: row)
                    : const SizedBox(),
            sliderTopContentExplore: (_) =>
                (value.smartConfig?.sliderTopContentExplore == true)
                    ? StandardStripRow(strip: row)
                    : const SizedBox(),
            trainingMandatory: (_) =>
                (value.smartConfig?.trainingMandatory == true)
                    ? StandardStripRow(strip: row)
                    : const SizedBox(),
            visCarBestRating: (_) =>
                (value.smartConfig?.visCarBestRating == true)
                    ? StandardStripRow(strip: row)
                    : const SizedBox(),
            visCarTrainingTransversal: (_) =>
                (value.smartConfig?.visCarTrainingTransversal == true)
                    ? StandardStripRow(strip: row)
                    : const SizedBox(),
            visCarCategory: (_) => (value.smartConfig?.visCarCategory == true)
                ? StandardStripRow(strip: row)
                : const SizedBox(),
            visForYou: (_) => (value.smartConfig?.visForyou == true)
                ? StandardStripRow(strip: row)
                : const SizedBox(),
            favourites: (_) => (value.smartConfig?.favourites == true)
                ? FavouritesStripRow(strip: row)
                : const SizedBox(),
            widgetContinueLearning: (_) =>
                (value.smartConfig?.widgetContinueLearning == true)
                    ? ContinueLearningStripRow(strip: row)
                    : const SizedBox(),
            widgetCalendar: (_) => (value.smartConfig?.widgetCalendar == true)
                ? CalendarStripRow(row,
                    smartLearningEnabled:
                        value.smartConfig?.smartLearning == true)
                : const SizedBox(),
            orElse: () => const SizedBox.shrink(),
          );
        },
        childCount: value.page.strips.length,
      ),
    );
  }
}

class DynamicContentArgs {
  final String apiPath;
  final Widget? header;

  DynamicContentArgs({
    required this.apiPath,
    this.header,
  });
}
