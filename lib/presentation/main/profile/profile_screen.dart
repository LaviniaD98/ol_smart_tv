import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/core/dependency_injection/dependency_injection.dart';
import 'package:open_learning_smart_tv/core/user_info_manager.dart';
import 'package:open_learning_smart_tv/core/utils/nav.dart';
import 'package:open_learning_smart_tv/domain/entities/smart_configurator/smart_configurator_model.dart';
import 'package:open_learning_smart_tv/presentation/app_state/cubit/app_cubit.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/generic_container.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_button.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_image.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/ol_alert_dialog.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/user_avatar/user_avatar.dart';
import 'package:open_learning_smart_tv/presentation/corporate_code/corporate_code_page.dart';
import 'package:open_learning_smart_tv/presentation/initiatives/initiatives_page.dart';
import 'package:open_learning_smart_tv/presentation/languages/cubit/languages_cubit.dart';
import 'package:open_learning_smart_tv/presentation/languages/languages_page.dart';
import 'package:open_learning_smart_tv/presentation/main/main_state_cubit.dart';
import 'package:open_learning_smart_tv/presentation/main/widgets/user_widgets_list.dart';
import 'package:open_learning_smart_tv/presentation/settings/cubit/settings_cubit.dart';
import 'package:open_learning_smart_tv/presentation/settings/privacy_policy/privacy_policy_page.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final OrderedTraversalPolicy _focusNodeOrder = OrderedTraversalPolicy();

  final focusNode = OlFocusScopeNode(id: 'Profile');

  @override
  void initState() {
    super.initState();
    context.read<MainStateCubit>().profileFocusNode = focusNode;
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: <ShortcutActivator, VoidCallback>{
        const SingleActivator(LogicalKeyboardKey.arrowLeft): () {
          final focus = context.read<MainStateCubit>().state;
          focus.requestFocus();
        },
      },
      child: FocusTraversalGroup(
        policy: _focusNodeOrder,
        child: Focus(
          focusNode: focusNode,
          onFocusChange: (value) {
            if (value) {
              if (focusNode.focusedChild == null) {
                final f = _focusNodeOrder.findFirstFocus(focusNode);
                f?.requestFocus();
              }
            }
            setState(() {});
          },
          child: Scaffold(
            body: Container(
              decoration: BoxDecoration(gradient: AppTheme.backgroundGradient),
              child: BlocConsumer<SettingsCubit, SettingsState>(
                listener: (context, state) => state.whenOrNull(
                  goToInitiatives: (session, model, sessionId) async {
                    Nav.push(
                      context,
                      screen: InitiativesPage(
                        args: InitiativesPageArgs(
                          session: session,
                          selfModel: model!,
                          sessionId: sessionId,
                          isFromSettings: true,
                        ),
                      ),
                    );

                    return;
                  },
                  error: () {
                    return OlAlertDialog.show(
                      context,
                      title: LabelsManager()
                          .getRemoteStringFromLabelKeys(RemoteLabelKeys.error),
                      message: LabelsManager().getRemoteStringFromLabelKeys(
                          RemoteLabelKeys.error_occurred),
                      actionLabel: LabelsManager()
                          .getRemoteStringFromLabelKeys(RemoteLabelKeys.retry),
                    );
                  },
                ),
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
                  initial: (smartConfig, loggedInViaSSO) {
                    return _content(context, smartConfig, loggedInViaSSO);
                  },
                  loading: () => _loading,
                  orElse: () => const SizedBox(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _content(
    BuildContext context,
    SmartConfiguratorModel? smartConfig,
    bool? loggedInViaSSO,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimens.hViewPadding,
        right: Dimens.hViewPadding,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 60),
                buildYourDateSection(),
                /* if (loggedInViaSSO == null || loggedInViaSSO == false) ...[
                  const SizedBox(height: 32),
                  buildSettingsOption(
                    title: LabelsManager().getRemoteStringFromLabelKeys(
                        RemoteLabelKeys.change_password),
                    icon: "assets/icons/security.svg",
                    onTap: () {
                      _changePasswordOnTap(context);
                    },
                  ),
                ],*/
                const SizedBox(height: 32),
                buildSettingsOption(
                  title: LabelsManager()
                      .getRemoteStringFromLabelKeys(RemoteLabelKeys.switch_to),
                  icon: "assets/icons/grid.svg",
                  onTap: () async {
                    await context.read<SettingsCubit>().goToInitiatives();
                  },
                ),
                const SizedBox(height: 32),
                buildSettingsOption(
                  title: LabelsManager().getRemoteStringFromLabelKeys(
                      RemoteLabelKeys.privacy_policy),
                  icon: "assets/icons/lock.svg",
                  onTap: () async {
                    Nav.push(context, screen: const PrivacyPolicyPage());
                  },
                ),

                // if (smartConfig?.freshDesk == true) ...[
                //   const SizedBox(height: 32),
                //   buildSettingsOption(
                //     title: LabelsManager()
                //         .getRemoteStringFromLabelKeys(RemoteLabelKeys.help),
                //     icon: "assets/icons/help.svg",
                //     onTap: () {
                //       _helpOnTap(context);
                //     },
                //   ),
                // ],
                if (getIt<RemoteLabels>().enableMultiLanguages) ...[
                  const SizedBox(height: 32),
                  buildSettingsOption(
                    title: getIt<RemoteLabels>().selectedLanguage.label,
                    icon: "assets/icons/globo.svg",
                    onTap: () {
                      final args = LanguagesPageArgs(onChanged: () {});

                      Nav.push(
                        context,
                        screen: BlocProvider.value(
                          value: context.read<LanguagesCubit>(),
                          child: LanguagesPage(args: args),
                        ),
                      );
                    },
                  ),
                ],
                const SizedBox(height: 32),
                buildSettingsOption(
                  title: LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.exit,
                  ),
                  icon: "assets/icons/logout.svg",
                  onTap: () {
                    OlAlertDialog.show(
                      context,
                      title: LabelsManager().getRemoteStringFromLabelKeys(
                        RemoteLabelKeys.exit,
                      ),
                      message: LabelsManager().getRemoteStringFromLabelKeys(
                          RemoteLabelKeys.exit_text),
                      actionLabel: '',
                      actions: [
                        OLButton(
                          title: LabelsManager().getRemoteStringFromLabelKeys(
                              RemoteLabelKeys.cancel),
                          outline: true,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        OLButton(
                          title: LabelsManager().getRemoteStringFromLabelKeys(
                              RemoteLabelKeys.exit),
                          onPressed: () async {
                            Navigator.of(context).pop();
                            context.read<AppCubit>().logout();
                            Nav.pushAndRemoveUntil(
                              context,
                              screen: const CorporateCodePage(),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),

                /*Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "v${context.read<SettingsCubit>().packageInfo?.version ?? ""}",
                      style: AppTextTheme.body(),
                    )
                  ],
                )*/
              ],
            ),
          ),
          const SizedBox(width: 52),
          const UserWidgetsList(),
          const SizedBox(width: Dimens.hPadding),
        ],
      ),
    );
  }

  Widget buildSettingsOption({
    required String icon,
    required String title,
    required void Function()? onTap,
  }) {
    const iconColor = ColorFilter.mode(
      Colors.white,
      BlendMode.srcIn,
    );
    return GenericContainer(
      onPressed: onTap,
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            width: 32,
            height: 32,
            colorFilter: iconColor,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          SvgPicture.asset(
            "assets/icons/right_arrow.svg",
            width: 32,
            height: 32,
            colorFilter: iconColor,
          ),
        ],
      ),
    );
  }

  Widget buildYourDateSection() {
    final user = UserInfoManager().getUserInfoModel()?.user;

    return ExcludeFocus(
      child: GenericContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              LabelsManager().getRemoteStringFromLabelKeys(
                RemoteLabelKeys.your_data,
              ),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserAvatar(
                  size: 160,
                  radius: 8,
                  id: user?.idUser,
                ),
                const SizedBox(width: 32),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        '${user?.name ?? ""} ${user?.surname ?? ""}',
                        style: AppTextTheme.body(
                          color: ColorManager().getColorTextPrimary(),
                          weight: FontWeight.bold,
                          size: 32,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        user?.email ?? "",
                        style: AppTextTheme.body(
                          color: ColorManager().getColorTextPrimary(),
                          weight: FontWeight.w500,
                          size: 20,
                        ),
                      ),
                      if (user?.phoneNumber != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          user?.phoneNumber ?? "",
                          style: AppTextTheme.body(
                            color: ColorManager().getColorTextPrimary(),
                            weight: FontWeight.w500,
                            size: 20,
                          ),
                        ),
                      ],
                      if (user?.address != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          user?.address ?? "",
                          style: AppTextTheme.body(
                            color: ColorManager().getColorTextPrimary(),
                            weight: FontWeight.w500,
                            size: 20,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget avatarPlaceholder({String? imageUrl}) {
    return Container(
      width: 160,
      height: 160,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Builder(builder: (context) {
        if (imageUrl != null) {
          return OLImage(
            imageURL: imageUrl,
            cacheWidth: 400,
          );
        }
        return const Center(
          child: Icon(
            Icons.person,
            color: Colors.black,
            size: 32,
          ),
        );
      }),
    );
  }

  Widget get _loading {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  // void _changePasswordOnTap(BuildContext context) {
  //   Nav.push(
  //     context,
  //     screen: BlocProvider(
  //       create: (_) => getIt<PwdSetOldPageCubit>()..init(),
  //       child: const PwdSetOldPage(),
  //     ),
  //   );
  // }

  // void _helpOnTap(BuildContext context) {
  //   Nav.push(
  //     context,
  //     screen: FreshDeskPage(
  //       context.read<SettingsCubit>().getFreshDeskHtmlPageUrl(),
  //     ),
  //   );
  // }
}
