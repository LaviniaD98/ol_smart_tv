import 'package:open_learning_smart_tv/color_management/color_manager.dart';
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
  const RatingsDialog(
      {super.key,
      required this.detailPageModel,
      this.initialRating = 0,
      this.max = 5});

  final DetailPageModel detailPageModel;
  final int initialRating;
  final int max;

  @override
  State<RatingsDialog> createState() => _RatingsDialogState();
}

class _RatingsDialogState extends State<RatingsDialog> {
  double? starRating;

  @override
  Widget build(BuildContext context) {
    starRating ??= widget.initialRating.toDouble();

    return BlocProvider(
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
    );
  }

  Widget _success(BuildContext parentContext) {
    return Dialog(
        insetPadding: const EdgeInsets.all(Dimens.spacingL),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.radius)),
        clipBehavior: Clip.antiAlias,
        child: Container(
          padding: const EdgeInsets.all(Dimens.spacingM),
          decoration: BoxDecoration(gradient: AppTheme.greyGradient),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                LabelsManager()
                    .getRemoteStringFromLabelKeys(RemoteLabelKeys.rating),
                style: AppTextTheme.subtitle(
                    color: ColorManager().getColorTextPrimary()),
              ),
              const SizedBox(
                height: Dimens.spacingXS,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: Dimens.spacingM),
                child: Text(
                  LabelsManager().getRemoteStringFromLabelKeys(
                      RemoteLabelKeys.rating_text),
                  textAlign: TextAlign.center,
                  style: AppTextTheme.caption(
                      color: ColorManager().getColorTextPrimary()),
                ),
              ),
              const SizedBox(
                height: Dimens.spacingXL,
              ),
              _buildStars(),
              const SizedBox(
                height: Dimens.spacingM,
              ),
              SizedBox(
                height: 14,
                child: Text(
                  _getRatingText(starRating?.toInt()),
                  style: AppTextTheme.caption(
                      color: ColorManager().getColorTextPrimary()),
                ),
              ),
              const SizedBox(
                height: Dimens.spacingXL,
              ),
              Slider(
                  value: starRating!,
                  min: 0,
                  max: widget.max.toDouble(),
                  divisions: widget.max,
                  activeColor: ColorManager().getColorBackgroundPrimaryCta(),
                  inactiveColor: ColorManager().getColorBackgroundDisabled(),
                  onChanged: (value) {
                    setState(() {
                      starRating = value;
                    });
                  }),
              const SizedBox(
                height: Dimens.spacingXL,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: AppButtonStyle.outlined,
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                      child: Text(
                        LabelsManager()
                            .getRemoteStringFromLabelKeys(RemoteLabelKeys.undo),
                        style: AppTextTheme.button(
                            color: ColorManager().getColorTextPrimaryCta()),
                      )),
                  ElevatedButton(
                      style: AppButtonStyle.red,
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
                      child: Text(
                        LabelsManager().getRemoteStringFromLabelKeys(
                            RemoteLabelKeys.confirm),
                      ))
                ],
              )
            ],
          ),
        ));
  }

  Widget get _loading {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.radius)),
      clipBehavior: Clip.antiAlias,
      child: Container(
          padding: const EdgeInsets.all(Dimens.spacingM),
          decoration: BoxDecoration(gradient: AppTheme.greyGradient),
          height: 275,
          child: const Center(
            child: CircularProgressIndicator(),
          )),
    );
  }

  Widget _buildStars() {
    List<Widget> stars = List.empty(growable: true);
    for (int i = 1; i <= widget.max; i++) {
      stars.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: Glow(
            glow: i <= (starRating ?? 0),
            child: SvgPicture.asset(
              i <= (starRating ?? 0)
                  ? "assets/icons/rating_full.svg"
                  : "assets/icons/rating.svg",
              height: 24,
              width: 24,
              colorFilter: ColorFilter.mode(
                  ColorManager().getColorBackgroundPrimaryCta(),
                  BlendMode.srcIn),
            ),
          ),
        ),
      );
    }

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: stars);
  }

  String _getRatingText(int? starRating) {
    int? adjustedRating =
        (widget.max <= 5 && starRating != null) ? starRating * 2 : starRating;
    return switch (adjustedRating) {
      1 ||
      2 =>
        LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.rating_1),
      3 ||
      4 =>
        LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.rating_2),
      5 ||
      6 =>
        LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.rating_3),
      7 ||
      8 =>
        LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.rating_4),
      9 ||
      10 =>
        LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.rating_5),
      _ => ""
    };
  }
}
