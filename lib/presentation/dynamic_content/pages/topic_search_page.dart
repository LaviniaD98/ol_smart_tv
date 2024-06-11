import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../theme/app_theme.dart';
import '../../common/widgets/app_bar/styled_app_bar.dart';
import '../../common/widgets/topics_filter/topics_filter_list.dart';
import '../cubit/dynamic_content_cubit.dart';
import '../dynamic_content.dart';

class TopicSearchPage extends StatelessWidget {
  static String routeName = 'topicSearch';

  final TopicSearchPageArgs args;

  const TopicSearchPage(this.args, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StyledAppBar(
        title: args.title,
      ),
      body: DynamicContent(
        args: DynamicContentArgs(
          apiPath: args.apiPath,
          header: SliverPadding(
            padding: const EdgeInsets.only(top: Dimens.spacingXS),
            sliver: SliverToBoxAdapter(
              child: TopicsFilterList.reload(
                initialFilters: [args.selectedFilter],
                onTapReload: context.read<DynamicContentCubit>().setFilters,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TopicSearchPageArgs {
  final String title;
  final String apiPath;
  final int routeId;
  final String selectedFilter;

  TopicSearchPageArgs({
    required this.title,
    required this.apiPath,
    required this.routeId,
    required this.selectedFilter,
  });
}
