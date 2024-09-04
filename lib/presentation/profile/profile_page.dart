import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/app_bar/styled_app_bar.dart';
import 'package:open_learning_smart_tv/presentation/profile/download/download_strip_row.dart';
import 'package:open_learning_smart_tv/presentation/profile/widgets/progress_card.dart';
import 'package:open_learning_smart_tv/presentation/settings/settings_page.dart';
import 'package:open_learning_smart_tv/presentation/profile/cubit/profile_page_cubit.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../domain/entities/progress/learner_goals.dart';
import '../../domain/entities/progress/learner_progress.dart';
import '../../domain/entities/progress/progress_goals_config_model.dart';
import '../../domain/entities/session/user_model.dart';
import '../../remote_theming/labels/labels_manager.dart';
import '../../remote_theming/labels/remote_labels_keys.dart';
import 'widgets/goals_card.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = 'profile';

  ProfilePage({super.key});

  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StyledAppBar(
        title: LabelsManager()
            .getRemoteStringFromLabelKeys(RemoteLabelKeys.profile),
        actions: [
          InkWell(
            onTap: () {
              context.pushNamed(SettingsPage.routeName);
            },
            child: SizedBox(
              height: 24,
              width: 24,
              child: SvgPicture.asset("assets/icons/three_dots.svg",
                  fit: BoxFit.none,
                  colorFilter: ColorFilter.mode(
                      ColorManager().getColorTextPrimary(), BlendMode.srcIn),),
            ),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(gradient: AppTheme.backgroundGradient),
        child: BlocBuilder<ProfilePageCubit, ProfilePageState>(
          buildWhen: (previous, current) => current.maybeMap(
            success: (_) => true,
            orElse: () => true,
          ),
          builder: (context, state) => state.maybeWhen(
            loading: () => _loading,
            success: (userInfoModel, imageUrl, progressGoalsConfig, goals,
                    progress) =>
                _success(
              context,
              userInfoModel?.user,
              imageUrl,
              progressGoalsConfig,
              goals,
              progress,
            ),
            orElse: () => const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }

  Widget _success(
    BuildContext context,
    UserModel? user,
    String? imageUrl,
    ProgressGoalsConfigModel? progressGoalsConfig,
    LearnerGoalsModel? goals,
    LearnerProgressModel? progress,
  ) {
    final List<Widget> pagerItems = (progressGoalsConfig?.enabled == true)
        ? [
            if (progressGoalsConfig?.yourGoals?.enabled == true &&
                goals != null)
              GoalsCard(data: goals),
            if (progressGoalsConfig?.yourProgress?.enabled == true &&
                progress != null)
              ProgressCard(data: progress),
          ]
        : [];

    return ListView(
      children: [
        //User Data Card
        Padding(
          padding: const EdgeInsets.all(Dimens.spacingM),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(Dimens.radiusImage),
                child: imageUrl != null && imageUrl.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: imageUrl,
                        width: 96,
                        height: 96,
                        fit: BoxFit.cover,
                        errorWidget: (context, _, __) =>
                            _userImagePlaceholder(user?.name, user?.surname),
                      )
                    : _userImagePlaceholder(user?.name, user?.surname),
              ),
              const SizedBox(
                width: Dimens.spacingXL,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${user?.name} ${user?.surname}",
                      style: AppTextTheme.title(
                          size: 20.0,
                          color: ColorManager().getColorTextPrimary()),
                    ),
                    const SizedBox(
                      height: Dimens.spacingM,
                    ),
                    Text(
                      user?.email ?? "",
                      style: AppTextTheme.body(
                          color:
                              ColorManager().getColorTextDisabledAlternative()),
                    ),
                    const SizedBox(
                      height: Dimens.spacingM,
                    ),
                    Text(
                      user?.phoneNumber ?? "",
                      style: AppTextTheme.body(
                          color:
                              ColorManager().getColorTextDisabledAlternative()),
                    ),
                    const SizedBox(
                      height: Dimens.spacingM,
                    ),
                    Text(
                      user?.address ?? "",
                      style: AppTextTheme.body(
                          color:
                              ColorManager().getColorTextDisabledAlternative()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (pagerItems.isNotEmpty)
          SizedBox(
            height: 295,
            child: PageView(controller: controller, children: pagerItems),
          ),
        const SizedBox(
          height: Dimens.spacingM,
        ),
        Align(
          alignment: Alignment.center,
          child: SmoothPageIndicator(
            controller: controller,
            count: pagerItems.length,
            effect: ExpandingDotsEffect(
                dotColor: ColorManager().getColorSystemDisabled(),
                activeDotColor: ColorManager().getColorSystemPrimary01(),
                dotHeight: 8,
                dotWidth: 8,
                expansionFactor: 5),
          ),
        ),
        const SizedBox(
          height: Dimens.spacingM,
        ),
        const DownloadStripRow(),
      ],
    );
  }

  Widget get _loading {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _userImagePlaceholder(String? name, String? surname) {
    return Container(
      width: 96,
      height: 96,
      color: ColorManager().getColorTextPrimary(),
      child: Center(
        child: Text(
          "${name?[0]}${surname?[0]}".toUpperCase(),
          style: AppTextTheme.title(
              color: ColorManager().getColorTextPrimaryAlternative()),
        ),
      ),
    );
  }
}
