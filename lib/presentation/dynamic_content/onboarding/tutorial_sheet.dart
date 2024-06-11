import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../color_management/color_manager.dart';
import '../../../core/dependency_injection/dependency_injection.dart';
import '../../../remote_theming/labels/labels_manager.dart';
import '../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../theme/app_theme.dart';
import '../../common/widgets/forms/reactive_checkbox_field.dart';
import '../../common/widgets/styled_icon_button.dart';
import 'cubit/onboarding_sheet_cubit.dart';

class TutorialSheet extends StatefulWidget {
  const TutorialSheet({super.key});

  @override
  State<TutorialSheet> createState() => _TutorialSheetState();
}

class _TutorialSheetState extends State<TutorialSheet> {
  final buttonSize = 36.0;
  final controller = PageController();
  int page = 0;

  final form = FormGroup({
    'showAgain': FormControl<bool>(),
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> tutorialPages = [
      _pageContents(
        context: context,
        title: LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.for_you),
        text: LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.for_you_tutorial),
        iconAsset: 'assets/icons/for_you.svg',
        imageAsset: 'assets/images/tutorial_for_you.png',
      ),
      _pageContents(
        context: context,
        title: LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.profile),
        text: LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.profile_tutorial),
        iconAsset: 'assets/icons/profile.svg',
        imageAsset: 'assets/images/tutorial_profile.png',
      ),
      _pageContents(
        context: context,
        title: LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.explore),
        text: LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.explore_tutorial),
        iconAsset: 'assets/icons/explore.svg',
        imageAsset: 'assets/images/tutorial_explore.png',
      ),
      _pageContents(
        context: context,
        title: LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.community),
        text: LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.community_tutorial),
        iconAsset: 'assets/icons/community.svg',
        imageAsset: 'assets/images/tutorial_community.png',
      ),
    ];

    return BlocProvider(
      create: (_) => getIt<OnboardingSheetCubit>(),
      child: BlocBuilder<OnboardingSheetCubit, OnboardingSheetState>(
        builder: (context, state) => Container(
          decoration: BoxDecoration(gradient: AppTheme.greyGradient),
          height: MediaQuery.of(context).size.height * .85,
          child: SafeArea(
            child: ReactiveForm(
              formGroup: form,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(Dimens.spacingL, 0, Dimens.spacingL, Dimens.spacingM),
                    child: Row(
                      children: [
                        const Spacer(),
                        StyledIconButton(
                          svgPath: 'assets/icons/cross_alt.svg',
                          onTap: () {
                            final skip = form.findControl('showAgain')?.value as bool?;
                            context.read<OnboardingSheetCubit>().setSkipTutorial(skip ?? false);
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: PageView(
                      controller: controller,
                      children: tutorialPages,
                      onPageChanged: (newPage) => setState(() {
                        page = newPage;
                      }),
                    ),
                  ),
                  const SizedBox(height: Dimens.spacingXL,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimens.spacingL),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: ReactiveCheckboxField(
                            formControlName: 'showAgain',
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                            LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.dont_show),
                            style: AppTextTheme.body(color: ColorManager().getColorTextPrimary())
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: Dimens.spacingXL,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(Dimens.spacingL, 0, Dimens.spacingL, Dimens.spacingM),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        page != 0 ? StyledIconButton(
                          svgPath: 'assets/icons/left_arrow.svg',
                          onTap: () {
                            controller.previousPage(
                                duration: const Duration(milliseconds: 250),
                                curve: Curves.easeOut
                            );
                          },
                        ) : const SizedBox(width: 36),
                        SmoothPageIndicator(
                          controller: controller,
                          count: tutorialPages.length,
                          effect: ExpandingDotsEffect(
                              dotColor: ColorManager().getColorSystemDisabled(),
                              activeDotColor: ColorManager().getColorSystemPrimary01(),
                              dotHeight: 8,
                              dotWidth: 8,
                              expansionFactor: 5
                          ),
                        ),
                        page != (tutorialPages.length - 1) ? StyledIconButton(
                          svgPath: 'assets/icons/right_arrow.svg',
                          onTap: () {
                            controller.nextPage(
                                duration: const Duration(milliseconds: 250),
                                curve: Curves.easeOut,
                            );
                          },
                        ) : StyledIconButton(
                          onTap: () {
                            final skip = form.findControl('showAgain')?.value as bool?;
                            context.read<OnboardingSheetCubit>().setSkipTutorial(skip ?? false);
                            Navigator.pop(context);
                          },
                          svgPath: 'assets/icons/checkbox_tick.svg',
                          backgroundColor: ColorManager().getColorBackgroundPrimaryCta(),
                          iconColor: ColorManager().getColorTextPrimaryAlternative(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _pageContents({
    required BuildContext context,
    required String title,
    required String text,
    required String iconAsset,
    required String imageAsset,
  }) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(Dimens.spacingL, 0, Dimens.spacingL, Dimens.spacingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox.square(
                dimension: 32,
                child: SvgPicture.asset(
                  iconAsset,
                  colorFilter: ColorFilter.mode(
                    ColorManager().getColorSystemPrimary01(),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(width: Dimens.spacingXS),
              Text(
                title,
                style: AppTextTheme.title(size: 20.0, color: ColorManager().getColorTextPrimary()),
              )
            ],
          ),
          const SizedBox(height: Dimens.spacingXS),
          Text(
            text,
            style: AppTextTheme.body(color: ColorManager().getColorTextPrimary()),
          ),
          const SizedBox(height: Dimens.spacingXL),
          Expanded(
            child: Center(
              child: ShaderMask(
                shaderCallback: (rect) {
                  return const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.transparent,
                      Color(0xFF38383D), //TODO: fix hardcoded color
                    ],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(Dimens.radius)),
                  child: Image.asset(
                    imageAsset,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }
}
