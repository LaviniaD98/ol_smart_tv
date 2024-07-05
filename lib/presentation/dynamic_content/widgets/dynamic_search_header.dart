import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../theme/app_theme.dart';
import '../../common/widgets/app_header.dart';
import '../../common/widgets/topics_filter/topics_filter_list.dart';
import '../../search/widgets/search_button.dart';
import '../pages/topic_search_page.dart';

class DynamicSearchHeader extends StatelessWidget {
  final String title;
  final int routeId;
  final String? apiPath;

  const DynamicSearchHeader({
    super.key,
    required this.title,
    required this.apiPath,
    required this.routeId,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          AppHeader(title: title),
          const SearchButton(),
          const SizedBox(height: Dimens.spacingS),
          if (apiPath != null)
            TopicsFilterList.navigation(onTap: (id) {
              context.pushNamed(
                TopicSearchPage.routeName,
                extra: TopicSearchPageArgs(
                  apiPath: apiPath!,
                  title: title,
                  routeId: routeId,
                  selectedFilter: id.toString(),
                ),
              );
            }),
        ],
      ),
    );
  }
}
