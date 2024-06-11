import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../../../domain/entities/community/comment/comment_model.dart';
import '../../../../../../theme/app_theme.dart';
import '../../../../../common/widgets/user_avatar/user_avatar.dart';
import 'comment_item_actions.dart';
import 'comment_item_content.dart';

class CommentItem extends StatelessWidget {
  static const _size = 36.0;
  final CommentModel args;
  final String? apiPath;
  const CommentItem(this.args, {super.key, required this.apiPath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Positioned(
          top: 0,
          bottom: 0,
          child: Column(
            children: [
              UserAvatar(
                id: args.ownerId,
                name: args.name,
                surname: args.surname,
                size: _size,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: Dimens.spacingS),
                  width: .5,
                  decoration: BoxDecoration(
                    color: ColorManager().getColorTextPrimary(),
                  ),
                ),
              ),
            ],
          ),
        ),
        AnimatedSize(
          alignment: Alignment.topLeft,
          duration: const Duration(milliseconds: 120),
          child: Padding(
            padding: const EdgeInsets.only(left: _size + Dimens.spacingS),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommentItemContent(args),
                CommentItemAction(args, apiPath: apiPath),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class CommentItemArgs {
  final int userId;
  final String? name;
  final String? surname;

  const CommentItemArgs({
    required this.userId,
    this.name,
    this.surname,
  });
}
