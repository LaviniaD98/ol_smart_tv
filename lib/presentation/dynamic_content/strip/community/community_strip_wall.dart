import 'package:open_learning_smart_tv/domain/entities/community/community_data_model.dart';
import 'package:open_learning_smart_tv/domain/entities/community/enriched_information_model.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/app_header.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/cubit/community_wall_cubit.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/widgets/community_card.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/widgets/community_filter_list.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/widgets/cubit/community_card_cubit.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../color_management/color_manager.dart';
import '../../../../core/dependency_injection/dependency_injection.dart';
import '../../../../remote_theming/config/config_manager.dart';
import '../../../../remote_theming/config/remote_config_keys.dart';
import '../../../../remote_theming/labels/labels_manager.dart';
import '../../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../common/widgets/error/error_screen.dart';
import '../../../wall/widgets/on_scroll_error.dart';
import 'widgets/add_post_button.dart';

class CommunityStripWall extends StatefulWidget {
  const CommunityStripWall({
    super.key,
    this.apiPath,
    required this.title,
  });

  static String routeName = 'community';
  final String title;
  final String? apiPath;

  @override
  State<CommunityStripWall> createState() => _CommunityStripWallState();
}

class _CommunityStripWallState extends State<CommunityStripWall> {
  @override
  void initState() {
    getIt<CommunityWallCubit>().init(widget.apiPath);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppTheme.backgroundGradient),
        child: SafeArea(
          child: RefreshIndicator(
            color: ColorManager().getColorTextPrimaryCta(),
            backgroundColor: ColorManager().getColorBackgroundPrimaryLighter(),
            onRefresh: () => context.read<CommunityWallCubit>().refresh(),
            child: CustomScrollView(
              primary: true,
              slivers: [
                SliverToBoxAdapter(
                  child: AppHeader(
                    title: widget.title,
                    trailing:
                        BlocBuilder<CommunityWallCubit, CommunityWallState>(
                      builder: (context, state) => AnimatedSwitcher(
                        duration: const Duration(milliseconds: 120),
                        child: state.maybeMap(
                          initialized: (_) => InkWell(
                            onTap: () => _openFilterMenu(context),
                            child: SvgPicture.asset('assets/icons/filters.svg',
                                colorFilter: ColorFilter.mode(
                                    ColorManager().getColorTextPrimary(),
                                    BlendMode.srcIn)),
                          ),
                          orElse: () => const SizedBox.shrink(),
                        ),
                      ),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: AddPostButton(),
                ),
                SliverToBoxAdapter(
                  child: BlocBuilder<CommunityWallCubit, CommunityWallState>(
                    builder: (context, state) => state.maybeWhen(
                      initialized: (_, __, topics) => CommunityFilterList(
                        topics: topics ?? [],
                        initialFilters:
                            context.read<CommunityWallCubit>().filterTopics,
                        onReload: (newFilters) {
                          context
                              .read<CommunityWallCubit>()
                              .updateTopicFilters(newFilters);
                        },
                      ),
                      orElse: () => const SizedBox.shrink(),
                    ),
                  ),
                ),
                BlocBuilder<CommunityWallCubit, CommunityWallState>(
                  builder: (context, state) => state.maybeWhen(
                    initialized: (userId, enrichedInformation, _) =>
                        _pagedList(context, userId, enrichedInformation),
                    orElse: () =>
                        const SliverToBoxAdapter(child: SizedBox.shrink()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _pagedList(BuildContext context, int userId,
      EnrichedInformationModel? enrichedInformation) {
    final cubit = context.read<CommunityWallCubit>();
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: Dimens.spacingS),
      sliver: PagedSliverList.separated(
        pagingController: cubit.controller,
        separatorBuilder: (context, index) =>
            const SizedBox(height: Dimens.spacingM),
        builderDelegate: PagedChildBuilderDelegate<CommunityDataModel>(
          itemBuilder: (context, item, index) => BlocProvider(
            create: (context) => getIt<CommunityCardCubit>(),
            child: CommunityCard(
              enInfo: enrichedInformation,
              post: item,
              postAuthor: item.owner,
              userId: userId,
              apiPath: widget.apiPath,
            ),
          ),
          firstPageErrorIndicatorBuilder: (_) => ErrorScreen(
            title: LabelsManager()
                .getRemoteStringFromLabelKeys(RemoteLabelKeys.error),
            message: cubit.controller.error,
            onReload: () {
              cubit.controller.refresh();
            },
          ),
          noItemsFoundIndicatorBuilder: (context) => Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimens.spacingM, vertical: Dimens.spacingXXXL),
            child: Center(
              child: Text(
                LabelsManager()
                    .getRemoteStringFromLabelKeys(RemoteLabelKeys.no_elements),
                textAlign: TextAlign.center,
                style: AppTextTheme.subtitle(),
              ),
            ),
          ),
          firstPageProgressIndicatorBuilder: (_) =>
              const Center(child: CircularProgressIndicator()),
          newPageErrorIndicatorBuilder: (_) => OnScrollError(cubit.controller),
          newPageProgressIndicatorBuilder: (_) => const Padding(
            padding: EdgeInsets.all(Dimens.spacingM),
            child: Center(
              child: SizedBox.square(
                dimension: 18.0,
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _openFilterMenu(BuildContext context) {
    final cubit = context.read<CommunityWallCubit>();
    final menuItems = ConfigManager()
        .getRemoteList(RemoteConfigKeys.community_post_types, []).map((e) {
      final item = e.toString();
      return CheckedPopupMenuItem(
        checked: cubit.filterTypes?.contains(item) ?? false,
        onTap: () {
          final newFilters = cubit.filterTypes ?? [];
          if (cubit.filterTypes?.contains(item) ?? false) {
            newFilters.remove(item);
          } else {
            newFilters.add(item);
          }
          cubit.updateTypeFilters(newFilters);
        },
        child: Text(LabelsManager().getRemoteStringFromLabelKeys(switch (item) {
          "free" => RemoteLabelKeys.post,
          "shared" => RemoteLabelKeys.shared,
          "discussion" => RemoteLabelKeys.talk,
          _ => RemoteLabelKeys.talk
        })),
      );
    }).toList();

    showMenu(
        context: context,
        position: const RelativeRect.fromLTRB(100, 0, 0, 100),
        items: menuItems);
  }
}
