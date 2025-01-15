import 'package:flutter/services.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/core/dependency_injection/dependency_injection.dart';
import 'package:open_learning_smart_tv/domain/entities/detail/detail_page_model.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/glow.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/rating/ratings_dialog_cubit.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../remote_theming/labels/labels_manager.dart';
import '../../../../remote_theming/labels/remote_labels_keys.dart';

class RatingsDialog extends StatefulWidget {
  const RatingsDialog({
    super.key,
    required this.detailPageModel,
    this.initialRating = 0,
    this.max = 5,
  });

  final DetailPageModel detailPageModel;
  final int initialRating;
  final int max;

  @override
  State<RatingsDialog> createState() => _RatingsDialogState();
}

class _RatingsDialogState extends State<RatingsDialog> {
  double? starRating;

  final _focusNode = FocusScopeNode();

  @override
  Widget build(BuildContext context) {
    starRating ??= widget.initialRating.toDouble();

    return Align(
      child: Container(
        constraints: const BoxConstraints()
            .copyWith(maxWidth: 750, minHeight: 600, maxHeight: 600),
        child: BlocProvider(
          create: (_) => getIt<RatingsDialogCubit>()..init(),
          child: BlocConsumer<RatingsDialogCubit, RatingsDialogState>(
            listener: (context, state) => state.whenOrNull(),
            listenWhen: (previous, current) => current.maybeMap(
              error: (_) => false,
              orElse: () => false,
            ),
            buildWhen: (previous, current) => current.maybeMap(
              success: (_) => true,
              orElse: () => true,
            ),
            builder: (context, state) => state.maybeWhen(
              loading: () => _loading,
              success: () => _success(context),
              orElse: () => const SizedBox(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _success(BuildContext parentContext) {
    return Dialog(
      insetPadding: const EdgeInsets.all(Dimens.spacingL),
      backgroundColor: OLColors.backgroundPrimary.withValues(alpha: 0.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.radius),
      ),
      clipBehavior: Clip.antiAlias,
      child: CallbackShortcuts(
        bindings: <ShortcutActivator, VoidCallback>{
          const SingleActivator(LogicalKeyboardKey.arrowLeft): () {
            if (starRating! > 0) {
              setState(() {
                starRating = starRating! - 1;
              });
            }
          },
          const SingleActivator(LogicalKeyboardKey.arrowRight): () {
            if (starRating! < widget.max) {
              setState(() {
                starRating = starRating! + 1;
              });
            }
          },
          const SingleActivator(LogicalKeyboardKey.select): () =>
              sendFeedback(parentContext),
          const SingleActivator(LogicalKeyboardKey.enter): () =>
              sendFeedback(parentContext),
        },
        child: FocusScope(
          autofocus: true,
          node: _focusNode,
          onFocusChange: (hasFocus) {
            setState(() {});
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  LabelsManager()
                      .getRemoteStringFromLabelKeys(RemoteLabelKeys.rating),
                  style: AppTextTheme.title(
                    size: 32,
                    weight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: Dimens.spacingXS),
                Text(
                  LabelsManager().getRemoteStringFromLabelKeys(
                      RemoteLabelKeys.rating_text),
                  style: AppTextTheme.subtitle(
                    color: ColorManager().getColorBackgroundPrimaryCta(),
                    weight: FontWeight.w700,
                    size: 24,
                  ),
                ),
                const SizedBox(height: 48),
                _buildStars(),
                /*const SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OLButton(
                      title: LabelsManager()
                          .getRemoteStringFromLabelKeys(RemoteLabelKeys.undo),
                      outline: true,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    OLButton(
                      title: LabelsManager().getRemoteStringFromLabelKeys(
                          RemoteLabelKeys.confirm),
                      onPressed: (starRating == 0)
                          ? null
                          : () async {
                              await parentContext
                                  .read<RatingsDialogCubit>()
                                  .rateLearningObject(widget.detailPageModel,
                                      starRating!.toInt());
                              if (parentContext.mounted) {
                                Navigator.of(parentContext, rootNavigator: true)
                                    .pop();
                              }
                            },
                    ),
                  ],
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> sendFeedback(BuildContext parentContext) async {
    if (starRating == 0) {
      return;
    }
    await parentContext
        .read<RatingsDialogCubit>()
        .rateLearningObject(widget.detailPageModel, starRating!.toInt());
    if (parentContext.mounted) {
      Navigator.of(parentContext).pop();
    }
  }

  Widget get _loading {
    return Dialog(
      backgroundColor: OLColors.backgroundPrimary.withValues(alpha: 0.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.radius),
      ),
      clipBehavior: Clip.antiAlias,
      child: Container(
        padding: const EdgeInsets.all(Dimens.spacingM),
        height: 275,
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget _buildStars() {
    List<Widget> stars = List.empty(growable: true);
    for (int i = 1; i <= widget.max; i++) {
      stars.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Glow(
            glow: i <= (starRating ?? 0),
            child: SvgPicture.asset(
              i <= (starRating ?? 0)
                  ? "assets/icons/rating_full.svg"
                  : "assets/icons/rating.svg",
              height: 48,
              width: 48,
              colorFilter: ColorFilter.mode(
                  ColorManager().getColorBackgroundPrimaryCta(),
                  BlendMode.srcIn),
            ),
          ),
        ),
      );
    }

    return Align(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 70),
        decoration: BoxDecoration(
          color: OLColors.backgroundSideNav.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: OLColors.backgroundSideNav,
              blurRadius: 12,
              offset: Offset(4, 4),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: stars,
        ),
      ),
    );
  }

  // String _getRatingText(int? starRating) {
  //   int? adjustedRating =
  //       (widget.max <= 5 && starRating != null) ? starRating * 2 : starRating;
  //   return switch (adjustedRating) {
  //     1 ||
  //     2 =>
  //       LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.rating_1),
  //     3 ||
  //     4 =>
  //       LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.rating_2),
  //     5 ||
  //     6 =>
  //       LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.rating_3),
  //     7 ||
  //     8 =>
  //       LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.rating_4),
  //     9 ||
  //     10 =>
  //       LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.rating_5),
  //     _ => ""
  //   };
  // }
}
