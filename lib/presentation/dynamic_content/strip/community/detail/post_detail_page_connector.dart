import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/detail/widgets/add_comment_widget/cubit/add_comment_widget_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/dependency_injection/dependency_injection.dart';
import '../../../../../domain/enums/types.dart';
import 'cubit/post_detail_cubit.dart';
import 'pages/default_post_detail_page.dart';
import 'pages/talk_post_detail_page.dart';

class PostDetailPageConnector extends StatelessWidget {
  static String routeName = 'post-detail';
  final PostDetailPageArgs args;
  const PostDetailPageConnector(this.args, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostDetailCubit>(
          create: (_) => getIt<PostDetailCubit>()..init(args),
        ),
        BlocProvider<AddCommentWidgetCubit>(
          create: (_) => getIt<AddCommentWidgetCubit>(),
        ),
      ],
      child: args.type == PostType.TALK
          ? TalkPostDetailPage(args)
          : DefaultPostDetailPage(args),
    );
  }
}

class PostDetailPageArgs {
  final PostType type;
  final String? apiPath;
  final int entityId;

  PostDetailPageArgs({
    required this.type,
    required this.entityId,
    this.apiPath,
  });
}
