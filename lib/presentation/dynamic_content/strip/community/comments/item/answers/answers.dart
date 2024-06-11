import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/comments/item/answers/cubit/answers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../../color_management/color_manager.dart';
import '../../../../../../../domain/entities/community/comment/comment_model.dart';
import '../../../../../../../remote_theming/labels/labels_manager.dart';
import '../../../../../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../../../../../theme/app_theme.dart';
import 'widgets/answer_item.dart';

class Answers extends StatelessWidget {
  final CommentModel data;
  final String? apiPath;
  const Answers(this.data, {super.key, this.apiPath});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnswersCubit, AnswersState>(
      builder: (context, state) {
        if (state.loading) return _loading(data.reply >= 10 ? 10 : data.reply);
        if (state.error) return _error(context);
        if (state.answers.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              ...state.answers.map(
                (e) => AnswerItem(
                  e,
                  apiPath: apiPath,
                  onSuccess: () =>
                      context.read<AnswersCubit>().refresh(data, apiPath),
                ),
              ),
              if (state.showMore)
                TextButton(
                  style: AppButtonStyle.textSmall,
                  onPressed: () {
                    context
                        .read<AnswersCubit>()
                        .fetch(data, apiPath, showLoading: false);
                  },
                  child: Text(
                    LabelsManager().getRemoteStringFromLabelKeys(
                        RemoteLabelKeys.community_more_answers),
                  ),
                ),
            ],
          );
        }
        return TextButton(
          style: AppButtonStyle.textSmall,
          onPressed: () {
            context.read<AnswersCubit>().fetch(data, apiPath);
          },
          child: Text(
            LabelsManager()
                .getRemoteStringFromLabelKeys(RemoteLabelKeys.show_replies),
          ),
        );
      },
    );
  }

  Widget _error(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimens.spacingS),
      child: Row(
        children: [
          Expanded(
            child: Text(
              LabelsManager()
                  .getRemoteStringFromLabelKeys(RemoteLabelKeys.error_occurred),
              textAlign: TextAlign.start,
              style: AppTextTheme.body(),
            ),
          ),
          const SizedBox(width: Dimens.spacingL),
          InkWell(
            onTap: () => context.read<AnswersCubit>().fetch(data, apiPath),
            child: Text(
              LabelsManager()
                  .getRemoteStringFromLabelKeys(RemoteLabelKeys.retry),
              style: AppTextTheme.caption(
                color: ColorManager().getColorTextPrimaryCta(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loading(int length) {
    const size = 36.0;
    return Shimmer.fromColors(
      baseColor: AppColors.white.withOpacity(.09),
      highlightColor: AppColors.primaryFaded,
      period: const Duration(seconds: 2),
      child: Column(
        children: List.generate(
          length,
          (_) => Padding(
            padding: const EdgeInsets.only(top: Dimens.spacingM),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size,
                  height: size,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(.2),
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: Dimens.spacingS),
                    child: Container(
                      height: size * 2,
                      padding: const EdgeInsets.all(Dimens.spacingXS),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(.2),
                          borderRadius:
                              BorderRadius.circular(Dimens.radiusCard)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
