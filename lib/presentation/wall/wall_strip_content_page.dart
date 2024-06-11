import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/row/strip_row.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/cards/wall/continue_learning_card_wall.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/smart_learning_bottom_sheet/smart_learning_bottom_sheet.dart';
import 'package:open_learning_smart_tv/presentation/wall/cubit/wall_cubit.dart';
import 'package:open_learning_smart_tv/presentation/wall/widgets/on_scroll_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';

import '../../color_management/color_manager.dart';
import '../../core/dependency_injection/dependency_injection.dart';
import '../../remote_theming/labels/labels_manager.dart';
import '../../remote_theming/labels/remote_labels_keys.dart';
import '../../theme/app_theme.dart';
import '../common/widgets/app_bar/styled_app_bar.dart';
import '../common/widgets/cards/wall/learning_card_wall.dart';
import '../common/widgets/error/error_screen.dart';

class WallStripContentPage extends StatelessWidget {
  static String routeName = 'wall';
  static const EdgeInsets _padding =
      EdgeInsets.fromLTRB(12.0, 16.0, 20.0, 16.0);

  final WallStripContentPageArgs args;

  const WallStripContentPage(this.args, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WallCubit>()..initPagingController(args.strip),
      child: Scaffold(
        appBar: StyledAppBar(
          title: args.strip.label,
          actions: args.strip.mapOrNull(
            smartLearning: (strip) => [
              GestureDetector(
                onTap: () async {
                  final res = await SmartLearningBottomSheet.edit<bool?>(
                      context,
                      id: strip.id,
                      startTime: strip.startTime!,
                      endTime: strip.endTime!,
                      strip: strip);
                  if (context.mounted && res != null && res) {
                    context.pop(true);
                  }
                },
                behavior: HitTestBehavior.opaque,
                child: Transform.scale(
                    scale: 0.9999,
                    child: SvgPicture.asset(
                      "assets/icons/edit.svg",
                      width: 20,
                      colorFilter: ColorFilter.mode(
                        ColorManager().getColorTextPrimary(),
                        BlendMode.srcIn,
                      ),
                    )),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: AppTheme.backgroundGradient,
            ),
            child: BlocBuilder<WallCubit, WallState>(
              builder: (context, state) {
                final cubit = context.read<WallCubit>();
                return state.maybeMap(
                  initialized: (value) =>
                      PagedListView<int, LearningObjectModel>.separated(
                    padding: _padding,
                    builderDelegate:
                        PagedChildBuilderDelegate<LearningObjectModel>(
                      itemBuilder: (context, item, index) =>
                          args.strip.maybeMap(
                        smartLearning: (strip) =>
                            _smartLearningCard(item, index, strip),
                        favourites: (_) => _favouriteCard(
                            context, item, index, cubit.totalElements),
                        widgetContinueLearning: (_) =>
                            ContinueLearningCardWall(item),
                        orElse: () => LearningCardWall(item),
                      ),
                      firstPageErrorIndicatorBuilder: (_) => ErrorScreen(
                        title: LabelsManager().getRemoteStringFromLabelKeys(
                            RemoteLabelKeys.error),
                        message: cubit.controller!.error,
                        onReload: () => cubit.controller!.refresh(),
                      ),
                      noItemsFoundIndicatorBuilder: (context) => Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Center(
                          child: Text(
                            LabelsManager().getRemoteStringFromLabelKeys(
                                RemoteLabelKeys.no_elements),
                            textAlign: TextAlign.center,
                            style: AppTextTheme.subtitle(),
                          ),
                        ),
                      ),
                      firstPageProgressIndicatorBuilder: (_) =>
                          const Center(child: CircularProgressIndicator()),
                      newPageErrorIndicatorBuilder: (_) =>
                          OnScrollError(cubit.controller!),
                      newPageProgressIndicatorBuilder: (_) =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                    pagingController: cubit.controller!,
                    separatorBuilder: (_, __) =>
                        const SizedBox(height: Dimens.spacingM),
                  ),
                  orElse: () =>
                      const Center(child: CircularProgressIndicator()),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _favouriteCard(BuildContext context, LearningObjectModel item,
      int index, int? totalElements) {
    final card = LearningCardWall(
      item,
      type: LearningCardWallType.favourite,
      onRemove: () => context.read<WallCubit>().removeFromFavorite(
            id: item.id,
            learningObjectTypology: item.learningObjectTypology,
            parentId: item.parentId,
            grandParentId: item.grandParentId,
          ),
    );
    if (index == 0 && totalElements != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
                Dimens.spacingXS, 0.0, Dimens.spacingL, Dimens.spacingL),
            child: Text(
              LabelsManager()
                  .getRemoteStringFromLabelKeys(RemoteLabelKeys.saved_count)
                  .replaceFirst('{{count}}', '$totalElements'),
              style: AppTextTheme.body(
                color: ColorManager().getColorTextPrimary(),
              ),
            ),
          ),
          card,
        ],
      );
    }
    return card;
  }

  Widget _smartLearningCard(
      LearningObjectModel item, int index, SmartLearning strip) {
    final card = LearningCardWall(item);
    if (index == 0 && (strip.startTime != null && strip.endTime != null)) {
      final dateFormat = DateFormat(DateFormat.HOUR24_MINUTE);
      final time =
          '${dateFormat.format(strip.startTime!)}-${dateFormat.format(strip.endTime!)}';
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
                Dimens.spacingXS, 0.0, Dimens.spacingL, Dimens.spacingL),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/time.svg",
                  width: 20,
                  colorFilter: ColorFilter.mode(
                    ColorManager().getColorTextPrimary(),
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: Dimens.spacingXS),
                Text(
                  time,
                  style: AppTextTheme.body(
                    color: ColorManager().getColorTextPrimary(),
                  ),
                ),
                const SizedBox(width: Dimens.spacingL),
                SvgPicture.asset(
                  "assets/icons/calendar.svg",
                  width: 16,
                  colorFilter: ColorFilter.mode(
                    ColorManager().getColorTextPrimary(),
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: Dimens.spacingXS),
                Expanded(
                  child: Text(
                    DateFormat('dd/MM/yyyy').format(strip.startTime!),
                    style: AppTextTheme.body(
                      color: ColorManager().getColorTextPrimary(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          card,
        ],
      );
    }
    return card;
  }
}

class WallStripContentPageArgs {
  final StripRow strip;

  WallStripContentPageArgs(this.strip);
}
