import 'package:open_learning_smart_tv/presentation/initiatives/initiatives_page.dart';
import 'package:open_learning_smart_tv/presentation/languages/languages_page.dart';
import 'package:open_learning_smart_tv/presentation/settings/cubit/settings_cubit.dart';
import 'package:open_learning_smart_tv/presentation/pwd_reset/pwd_set_old_page.dart';
import 'package:open_learning_smart_tv/presentation/settings/fresh_desk/fresh_desk_page.dart';
import 'package:open_learning_smart_tv/presentation/settings/privacy_policy/privacy_policy_page.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../color_management/color_manager.dart';
import '../../core/dependency_injection/dependency_injection.dart';
import '../../domain/entities/smart_configurator/smart_configurator_model.dart';
import '../../remote_theming/labels/remote_labels.dart';
import '../../theme/app_theme.dart';
import '../app_state/cubit/app_cubit.dart';
import '../common/widgets/app_bar/styled_app_bar.dart';
import '../common/widgets/dialog/ol_alert_dialog.dart';
import '../common/widgets/dialog/ol_okcancel_dialog.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static String routeName = 'settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StyledAppBar(
        title: LabelsManager()
            .getRemoteStringFromLabelKeys(RemoteLabelKeys.settings),
      ),
      body: Container(
          decoration: BoxDecoration(gradient: AppTheme.backgroundGradient),
          child: BlocConsumer<SettingsCubit, SettingsState>(
            listener: (context, state) => state.whenOrNull(
                goToInitiatives: (session, model, sessionId) async {
              context.pushNamed(InitiativesPage.routeName,
                  extra: InitiativesPageArgs(
                    session: session,
                    selfModel: model!,
                    sessionId: sessionId,
                    isFromSettings: true,
                  ));
              return;
            }, error: () {
              return OlAlertDialog.show(
                context,
                title: LabelsManager()
                    .getRemoteStringFromLabelKeys(RemoteLabelKeys.error),
                message: LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.error_occurred),
                actionLabel: LabelsManager()
                    .getRemoteStringFromLabelKeys(RemoteLabelKeys.retry),
              );
            }),
            listenWhen: (previous, current) => current.maybeMap(
              goToInitiatives: (_) => true,
              error: (_) => true,
              orElse: () => false,
            ),
            buildWhen: (previous, current) => current.maybeMap(
              goToInitiatives: (_) => false,
              orElse: () => true,
            ),
            builder: (context, state) => state.maybeWhen(
              initial: (smartConfig, loggedInViaSSO) =>
                  _content(context, smartConfig, loggedInViaSSO),
              loading: () => _loading,
              orElse: () => const SizedBox(),
            ),
          )),
    );
  }

  Widget _content(BuildContext context, SmartConfiguratorModel? smartConfig,
      bool? loggedInViaSSO) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Dimens.spacingM,
        horizontal: Dimens.spacingL,
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            loggedInViaSSO != null && loggedInViaSSO == true
                ? const SizedBox()
                : Material(
                    color: ColorManager().getColorBackgroundList(),
                    borderRadius: BorderRadius.circular(Dimens.radiusImage),
                    child: InkWell(
                      onTap: () {
                        _changePasswordOnTap(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: Dimens.spacingS,
                          horizontal: Dimens.spacingM,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SvgPicture.asset("assets/icons/security.svg",
                                width: 24,
                                height: 24,
                                fit: BoxFit.none,
                                colorFilter: ColorFilter.mode(
                                    ColorManager().getColorTextPrimary(),
                                    BlendMode.srcIn)),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              LabelsManager().getRemoteStringFromLabelKeys(
                                  RemoteLabelKeys.change_password),
                              style: AppTextTheme.subtitle(
                                  color: ColorManager().getColorTextPrimary()),
                            ),
                            const Spacer(),
                            Transform.scale(
                                scale: 0.9999,
                                child: SvgPicture.asset(
                                    "assets/icons/right_arrow.svg",
                                    width: 24,
                                    height: 24,
                                    colorFilter: ColorFilter.mode(
                                        ColorManager().getColorTextPrimary(),
                                        BlendMode.srcIn))),
                          ],
                        ),
                      ),
                    ),
                  ),
            const SizedBox(
              height: 32,
            ),
            Material(
              color: ColorManager().getColorBackgroundList(),
              borderRadius: BorderRadius.circular(Dimens.radiusImage),
              child: InkWell(
                onTap: () async {
                  await context.read<SettingsCubit>().goToInitiatives();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Dimens.spacingS,
                    horizontal: Dimens.spacingM,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SvgPicture.asset("assets/icons/logout.svg",
                          width: 24,
                          height: 24,
                          fit: BoxFit.none,
                          colorFilter: ColorFilter.mode(
                              ColorManager().getColorTextPrimary(),
                              BlendMode.srcIn)),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        LabelsManager().getRemoteStringFromLabelKeys(
                            RemoteLabelKeys.switch_to),
                        style: AppTextTheme.subtitle(
                            color: ColorManager().getColorTextPrimary()),
                      ),
                      const Spacer(),
                      Transform.scale(
                          scale: 0.9999,
                          child: SvgPicture.asset(
                              "assets/icons/right_arrow.svg",
                              width: 24,
                              height: 24,
                              colorFilter: ColorFilter.mode(
                                  ColorManager().getColorTextPrimary(),
                                  BlendMode.srcIn))),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Material(
              color: ColorManager().getColorBackgroundList(),
              borderRadius: BorderRadius.circular(Dimens.radiusImage),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      context.pushNamed(PrivacyPolicyPage.routeName);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: Dimens.spacingS,
                        horizontal: Dimens.spacingM,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SvgPicture.asset("assets/icons/lock.svg",
                              width: 24,
                              height: 24,
                              fit: BoxFit.none,
                              colorFilter: ColorFilter.mode(
                                  ColorManager().getColorTextPrimary(),
                                  BlendMode.srcIn)),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            LabelsManager().getRemoteStringFromLabelKeys(
                                RemoteLabelKeys.privacy_policy),
                            style: AppTextTheme.subtitle(
                                color: ColorManager().getColorTextPrimary()),
                          ),
                          const Spacer(),
                          Transform.scale(
                              scale: 0.9999,
                              child: SvgPicture.asset(
                                  "assets/icons/right_arrow.svg",
                                  width: 24,
                                  height: 24,
                                  colorFilter: ColorFilter.mode(
                                      ColorManager().getColorTextPrimary(),
                                      BlendMode.srcIn))),
                        ],
                      ),
                    ),
                  ),
                  (smartConfig?.freshDesk == true)
                      ? Container(
                          height: 1,
                          width: double.infinity,
                          color: ColorManager().getColorBorder(),
                        )
                      : const SizedBox(),
                  (smartConfig?.freshDesk == true)
                      ? InkWell(
                          onTap: () => _helpOnTap(context),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: Dimens.spacingS,
                              horizontal: Dimens.spacingM,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SvgPicture.asset("assets/icons/help.svg",
                                    width: 24,
                                    height: 24,
                                    fit: BoxFit.none,
                                    colorFilter: ColorFilter.mode(
                                        ColorManager().getColorTextPrimary(),
                                        BlendMode.srcIn)),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  LabelsManager().getRemoteStringFromLabelKeys(
                                      RemoteLabelKeys.help),
                                  style: AppTextTheme.subtitle(
                                      color:
                                          ColorManager().getColorTextPrimary()),
                                ),
                                const Spacer(),
                                Transform.scale(
                                    scale: 0.9999,
                                    child: SvgPicture.asset(
                                        "assets/icons/right_arrow.svg",
                                        width: 24,
                                        height: 24,
                                        colorFilter: ColorFilter.mode(
                                            ColorManager()
                                                .getColorTextPrimary(),
                                            BlendMode.srcIn))),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            if (getIt<RemoteLabels>().enableMultiLanguages)
              Material(
                color: ColorManager().getColorBackgroundList(),
                borderRadius: BorderRadius.circular(Dimens.radiusImage),
                child: InkWell(
                  onTap: () {
                    final args = LanguagesPageArgs(
                        onChanged: () => getIt<AppCubit>().reload(context));
                    context.pushNamed(LanguagesPage.routeName, extra: args);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: Dimens.spacingS,
                      horizontal: Dimens.spacingM,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SvgPicture.asset("assets/icons/globo.svg",
                            width: 24,
                            height: 24,
                            fit: BoxFit.none,
                            colorFilter: ColorFilter.mode(
                                ColorManager().getColorTextPrimary(),
                                BlendMode.srcIn)),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          getIt<RemoteLabels>().selectedLanguage.label,
                          style: AppTextTheme.subtitle(
                              color: ColorManager().getColorTextPrimary()),
                        ),
                        const Spacer(),
                        Transform.scale(
                            scale: 0.9999,
                            child: SvgPicture.asset(
                                "assets/icons/right_arrow.svg",
                                width: 24,
                                height: 24,
                                colorFilter: ColorFilter.mode(
                                    ColorManager().getColorTextPrimary(),
                                    BlendMode.srcIn))),
                      ],
                    ),
                  ),
                ),
              ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: () => OlOkCancelDialog.show(
                context,
                title: LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.exit,
                ),
                message: LabelsManager()
                    .getRemoteStringFromLabelKeys(RemoteLabelKeys.exit_text),
                okActionLabel: LabelsManager()
                    .getRemoteStringFromLabelKeys(RemoteLabelKeys.exit),
                cancelActionLabel: LabelsManager()
                    .getRemoteStringFromLabelKeys(RemoteLabelKeys.cancel),
                okCallback: () {
                  context.read<AppCubit>().logout();
                },
              ),
              child: Text(
                LabelsManager()
                    .getRemoteStringFromLabelKeys(RemoteLabelKeys.exit),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "v${context.read<SettingsCubit>().packageInfo?.version ?? ""}",
                  style: AppTextTheme.body(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget get _loading {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  void _changePasswordOnTap(BuildContext context) {
    context.pushNamed(PwdSetOldPage.routeName);
  }

  void _helpOnTap(BuildContext context) {
    context.pushNamed(FreshDeskPage.routeName,
        extra: context.read<SettingsCubit>().getFreshDeskHtmlPageUrl());
  }
}
