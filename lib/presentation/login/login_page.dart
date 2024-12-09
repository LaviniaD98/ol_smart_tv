import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:open_learning_smart_tv/core/dependency_injection/dependency_injection.dart';
import 'package:open_learning_smart_tv/core/utils/nav.dart';
import 'package:open_learning_smart_tv/data/models/responses/corporate_code/corporate_code_dto.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_text_button.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/text_field_input.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/ol_alert_dialog.dart';
import 'package:open_learning_smart_tv/presentation/login/mfa/cubit/mfa_cubit.dart';
import 'package:open_learning_smart_tv/presentation/login/widgets/logo_banner.dart';
import 'package:open_learning_smart_tv/presentation/privacy/cubit/privacy_cubit.dart';
import 'package:open_learning_smart_tv/presentation/privacy/privacy_page.dart';
import 'package:open_learning_smart_tv/presentation/pwd_recover/cubit/pwd_recover_page_cubit.dart';
import 'package:open_learning_smart_tv/presentation/pwd_recover/pwd_recover_page.dart';
import 'package:open_learning_smart_tv/presentation/pwd_reset/cubit/pwd_reset_page_cubit.dart';
import 'package:open_learning_smart_tv/presentation/pwd_reset/pwd_reset_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/forms/reactive_checkbox_field.dart';
import 'package:open_learning_smart_tv/presentation/login/cubit/login_cubit.dart';
import 'package:open_learning_smart_tv/presentation/login/mfa/mfa_validation_page.dart';
import 'package:open_learning_smart_tv/presentation/login/widgets/login_card.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../remote_theming/labels/labels_manager.dart';
import '../../remote_theming/labels/remote_labels_keys.dart';
import '../common/widgets/components/ol_button.dart';
import '../initiatives/initiatives_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String routeName = 'login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //final OrderedTraversalPolicy _focusNodeOrder = OrderedTraversalPolicy();

  final FocusNode _focusNode = FocusNode();

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      _focusNode.requestFocus();
    });

    context.read<LoginCubit>().getQrCode();

    _timer = Timer.periodic(
      (const Duration(seconds: 2)),
      (timer) {
        context.read<LoginCubit>().validateQrCode(timer, false);
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FocusTraversalGroup(
      policy: OrderedTraversalPolicy(),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/login_back.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: Container(color: Colors.black.withOpacity(0.4)),
              ),
              Column(
                children: [
                  const LogoBanner(),
                  const SizedBox(height: 100),
                  Expanded(
                    child: SingleChildScrollView(
                      child: BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) => state.whenOrNull(
                          showInitiatives: (session, selfModel, sessionId) {
                            return unawaited(
                              Nav.push(
                                context,
                                screen: InitiativesPage(
                                  args: InitiativesPageArgs(
                                    session: session,
                                    selfModel: selfModel,
                                    sessionId: sessionId,
                                  ),
                                ),
                                root: true,
                              ),
                            );
                          },
                          showPolicyPage: (session, selfModel, sessionId) {
                            return unawaited(
                              Nav.push(
                                context,
                                screen: BlocProvider(
                                  create: (_) => getIt<PrivacyCubit>(),
                                  child: PrivacyPage(
                                    args: PrivacyPageArgs(
                                      session: session,
                                      selfModel: selfModel,
                                      sessionId: sessionId,
                                    ),
                                  ),
                                ),
                                root: true,
                              ),
                            );
                          },
                          mfaValidation: (remember, userId) async {
                            final res = await Nav.push(
                              context,
                              screen: BlocProvider(
                                create: (_) => getIt<MfaCubit>(),
                                child: MfaValidationPage(
                                  args: MfaValidationPageArgs(
                                    remember: remember,
                                    userId: userId,
                                  ),
                                ),
                              ),
                              root: true,
                            ) as bool?;

                            // final res = await context.pushNamed<bool?>(
                            //   MfaValidationPage.routeName,
                            //   extra: MfaValidationPageArgs(
                            //       remember: remember, userId: userId),
                            // );
                            if (res == true && context.mounted) {
                              OlAlertDialog.show(
                                context,
                                title: LabelsManager()
                                    .getRemoteStringFromLabelKeys(
                                  RemoteLabelKeys.error,
                                ),
                                message: LabelsManager()
                                    .getRemoteStringFromLabelKeys(
                                  RemoteLabelKeys.authentication_not_successful,
                                ),
                                actionLabel: LabelsManager()
                                    .getRemoteStringFromLabelKeys(
                                  RemoteLabelKeys.retry,
                                ),
                              );
                            }
                            return;
                          },
                          firstLoginPasswordChange: (oldPwd, exception) async {
                            return await Nav.push(
                              context,
                              screen: BlocProvider(
                                create: (_) => getIt<PwdResetCubit>()..init(),
                                child: PwdResetPage(
                                  args: PwdResetPageArgs(
                                    oldpwd: oldPwd,
                                    firstTimeReset: true,
                                    exception: exception,
                                  ),
                                ),
                              ),
                            );
                          },
                          error: () => OlAlertDialog.show(
                            context,
                            title: LabelsManager().getRemoteStringFromLabelKeys(
                                RemoteLabelKeys.error),
                            message: LabelsManager()
                                .getRemoteStringFromLabelKeys(RemoteLabelKeys
                                    .username_password_incorrect),
                            actionLabel: LabelsManager()
                                .getRemoteStringFromLabelKeys(
                                    RemoteLabelKeys.retry),
                          ),
                        ),
                        listenWhen: (previous, current) => current.maybeMap(
                          mfaValidation: (_) => true,
                          error: (_) => true,
                          showInitiatives: (_) => true,
                          showPolicyPage: (_) => true,
                          firstLoginPasswordChange: (_) => true,
                          orElse: () => false,
                        ),
                        buildWhen: (previous, current) => current.maybeMap(
                          mfaValidation: (_) => false,
                          error: (_) => false,
                          showInitiatives: (_) => false,
                          showPolicyPage: (_) => false,
                          firstLoginPasswordChange: (_) => false,
                          orElse: () => true,
                        ),
                        builder: (context, state) => state.maybeWhen(
                          loading: () => _loading,
                          initial: (form, loginType) {
                            if (kDebugMode) {
                              form.findControl('username')?.value =
                                  'test.iglu02';
                              // form.findControl('username')?.value =
                              //     'iglu.tester02';
                              form.findControl('password')?.value = 'Test1234!';
                            }

                            return _content(context, form, loginType);
                          },
                          orElse: () => const SizedBox(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _loading {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _content(BuildContext context, FormGroup form, LoginType loginType) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 110),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ReactiveForm(
                formGroup: form,
                child: LoginCard(
                  backgroundColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  title: LabelsManager()
                      .getRemoteStringFromLabelKeys(RemoteLabelKeys.welcome),
                  description: LabelsManager()
                      .getRemoteStringFromLabelKeys(RemoteLabelKeys.login_body),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ..._usernamePasswordButtons(form: form),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 60),
            Column(
              children: [
                const Expanded(
                  child: VerticalDivider(
                    color: Colors.white,
                    thickness: 1,
                    width: 1,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Oppure',
                  textAlign: TextAlign.start,
                  style: AppTextTheme.subtitle(
                    color: ColorManager().getColorTextPrimary(),
                    weight: FontWeight.w500,
                    size: 22,
                  ),
                ),
                const SizedBox(height: 24),
                const Expanded(
                  child: VerticalDivider(
                    color: Colors.white,
                    thickness: 1,
                    width: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 60),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: context.read<LoginCubit>().loginQrUrl,
                builder: (context, value, _) {
                  return buildQrCodeSection(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildQrCodeSection(String? url) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Accedi tramite QR-Code',
            textAlign: TextAlign.start,
            style: AppTextTheme.title(
              color: ColorManager().getColorTextPrimaryCta(),
            ),
          ),
          const SizedBox(height: 24),
          IntrinsicHeight(
            child: Row(
              children: [
                SizedBox(
                  height: 254,
                  width: 254,
                  child: Builder(builder: (context) {
                    if (url == null) {
                      return const Align(child: CircularProgressIndicator());
                    }
                    return QrImageView(
                      data: url,
                      version: QrVersions.auto,
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.zero,
                      dataModuleStyle: const QrDataModuleStyle(
                        dataModuleShape: QrDataModuleShape.square,
                        color: Colors.white,
                      ),
                      eyeStyle: const QrEyeStyle(
                        eyeShape: QrEyeShape.square,
                        color: Colors.white,
                      ),
                      size: 254.0,
                    );
                  }),
                ),
                const SizedBox(width: 36),
                // TODO(UmbertoGrimaldi): Add to localized Strings
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Step 1',
                        textAlign: TextAlign.start,
                        style: AppTextTheme.subtitle(
                          color: ColorManager().getColorTextPrimary(),
                          weight: FontWeight.w500,
                          size: 30,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Scansiona il QR-Code tramite il tuo dispositivo mobile',
                        textAlign: TextAlign.start,
                        style: AppTextTheme.subtitle(
                          color: ColorManager().getColorTextPrimary(),
                          weight: FontWeight.w500,
                          size: 22,
                        ).copyWith(height: 1.3),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Step 2',
                        textAlign: TextAlign.start,
                        style: AppTextTheme.subtitle(
                          color: ColorManager().getColorTextPrimary(),
                          weight: FontWeight.w500,
                          size: 30,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Accedi dal dispositivo mobile tramite credenziali o SSO',
                        textAlign: TextAlign.start,
                        style: AppTextTheme.subtitle(
                          color: ColorManager().getColorTextPrimary(),
                          weight: FontWeight.w500,
                          size: 22,
                        ).copyWith(height: 1.3),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 100,
                child: Divider(
                  color: Colors.white,
                  thickness: 1,
                  height: 1,
                ),
              ),
              const SizedBox(width: 24),
              Text(
                'Oppure',
                textAlign: TextAlign.start,
                style: AppTextTheme.subtitle(
                  color: ColorManager().getColorTextPrimary(),
                  weight: FontWeight.w500,
                  size: 22,
                ),
              ),
              const SizedBox(width: 24),
              const SizedBox(
                width: 100,
                child: Divider(
                  color: Colors.white,
                  thickness: 1,
                  height: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Text(
            'Accedi al seguente link:',
            textAlign: TextAlign.start,
            style: AppTextTheme.subtitle(
              color: ColorManager().getColorTextPrimary(),
              weight: FontWeight.w500,
              size: 30,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            url ?? '',
            textAlign: TextAlign.start,
            style: AppTextTheme.subtitle(
              color: ColorManager().getColorTextPrimary(),
              weight: FontWeight.w600,
              size: 40,
            ).copyWith(decoration: TextDecoration.underline),
          ),
          const SizedBox(height: 24),
          Text(
            'Ed accedi tramite le tue credenziali o tramite SSO',
            textAlign: TextAlign.start,
            style: AppTextTheme.subtitle(
              color: ColorManager().getColorTextPrimary(),
              weight: FontWeight.w500,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _usernamePasswordButtons({required FormGroup form}) {
    return [
      TextFieldInput(
        headerTitle: LabelsManager()
            .getRemoteStringFromLabelKeys(RemoteLabelKeys.username),
        form: form,
        focusNode: _focusNode,
        controlName: 'username',
        order: 1,
      ),
      const SizedBox(height: 32.0),
      TextFieldInput(
        headerTitle: LabelsManager()
            .getRemoteStringFromLabelKeys(RemoteLabelKeys.password),
        isObscured: true,
        form: form,
        autofocus: false,
        controlName: 'password',
        order: 2,
      ),
      const SizedBox(height: 32.0),
      Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: ReactiveCheckboxField(
              formControlName: 'remember',
              order: 3,
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              LabelsManager()
                  .getRemoteStringFromLabelKeys(RemoteLabelKeys.remember_me),
              textAlign: TextAlign.start,
              style: AppTextTheme.caption().copyWith(fontSize: 16),
            ),
          ),
          const SizedBox(width: 8.0),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: FocusTraversalOrder(
              order: const NumericFocusOrder(4),
              child: OLTextButton(
                title: LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.password_recovery),
                onPressed: () async {
                  //final lastFocus = FocusManager.instance.primaryFocus;

                  await Nav.push(
                    context,
                    screen: BlocProvider(
                      create: (_) => getIt<PwdRecoverCubit>()..init(),
                      child: const PwdRecoverStartPage(),
                    ),
                  );

                  _focusNode.requestFocus();
                },
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 24.0),
      ReactiveFormConsumer(
        builder: (context, formGroup, child) {
          return Align(
            alignment: Alignment.center,
            child: FocusTraversalOrder(
              order: const NumericFocusOrder(5.0),
              child: OLButton(
                key: const Key('loginForm_continue_raisedButton'),
                title: LabelsManager()
                    .getRemoteStringFromLabelKeys(RemoteLabelKeys.login),
                onPressed: formGroup.valid
                    ? () {
                        final username =
                            formGroup.findControl('username')?.value as String;
                        final password =
                            formGroup.findControl('password')?.value as String;
                        final remember =
                            formGroup.findControl('remember')?.value as bool? ??
                                false;
                        context.read<LoginCubit>().login(
                              username,
                              password,
                              remember,
                            );
                      }
                    : null,
              ),
            ),
          );
        },
      ),
    ];
  }

  // List<Widget> _ssoButtons(BuildContext context) {
  //   return [
  //     Align(
  //       alignment: Alignment.center,
  //       child: FocusTraversalOrder(
  //         order: const NumericFocusOrder(1.0),
  //         child: OLButton(
  //           title: LabelsManager()
  //               .getRemoteStringFromLabelKeys(RemoteLabelKeys.sso),
  //           onPressed: () async {
  //             final lastFocus = FocusManager.instance.primaryFocus;
  //             await Nav.push(
  //               context,
  //               screen: BlocProvider(
  //                 create: (_) => getIt<SsoCubit>()..init(),
  //                 child: const SsoPage(),
  //               ),
  //             );
  //             lastFocus?.requestFocus();
  //           },
  //         ),
  //       ),
  //     )
  //   ];
  // }
}
