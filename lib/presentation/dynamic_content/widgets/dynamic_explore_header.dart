import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../theme/app_theme.dart';
import '../../common/widgets/app_header.dart';
import '../../common/widgets/topics_filter/topics_filter_list.dart';
import '../cubit/dynamic_content_cubit.dart';

class DynamicExploreHeader extends StatelessWidget {
  final String title;

  const DynamicExploreHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          AppHeader(title: title),
          const SizedBox(height: Dimens.spacingM,),
          TopicsFilterList.reload(
            onTapReload: context.read<DynamicContentCubit>().setFilters,
          ),
        ],
      ),
    );
  }
}
