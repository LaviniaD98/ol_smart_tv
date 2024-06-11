import 'dart:async';

import 'package:open_learning_smart_tv/core/dependency_injection/dependency_injection.dart';
import 'package:open_learning_smart_tv/core/utils/nav.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_button.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_text_button.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/text_field_input.dart';
import 'package:open_learning_smart_tv/presentation/initiatives/cubit/initiatives_cubit.dart';
import 'package:open_learning_smart_tv/presentation/login/widgets/logo_banner.dart';
import 'package:open_learning_smart_tv/presentation/privacy/cubit/privacy_cubit.dart';
import 'package:open_learning_smart_tv/presentation/pwd_recover/cubit/pwd_confirm_page_cubit.dart';
import 'package:open_learning_smart_tv/presentation/pwd_recover/pwd_confirm_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_learning_smart_tv/presentation/login/mfa/cubit/mfa_cubit.dart';
import 'package:open_learning_smart_tv/presentation/login/widgets/login_card.dart';
import 'package:open_learning_smart_tv/presentation/privacy/privacy_page.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../remote_theming/labels/labels_manager.dart';
import '../../../remote_theming/labels/remote_labels_keys.dart';
import '../../common/widgets/dialog/ol_alert_dialog.dart';
import '../../initiatives/initiatives_page.dart';

class MfaValidationPage extends StatefulWidget {
  static String routeName = 'mfa';
  final MfaValidationPageArgs args;
  const MfaValidationPage({super.key, required this.args});

  @override
  State<MfaValidationPage> createState() => _MfaValidationPageState();
}

class _MfaValidationPageState extends State<MfaValidationPage> {
  FormGroup form = FormGroup(
    {
      'code': FormControl<String>(
        validators: [
          Validators.required,
          Validators.minLength(6),
          Validators.maxLength(6),
        ],
      )
    },
  );

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
          child: Column(
            children: [
              const LogoBanner(),
              const SizedBox(height: 100),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration:
                        BoxDecoration(gradient: AppColors.backgroundGradient),
                    child: BlocConsumer<MfaCubit, MfaState>(
                      listener: (context, state) => state.whenOrNull(
                        tryAgain: (tentative) {
                          if (tentative == 0) {
                            return OlAlertDialog.show(
                              context,
                              title: LabelsManager()
                                  .getRemoteStringFromLabelKeys(
                                      RemoteLabelKeys.code_sent),
                              message: LabelsManager()
                                  .getRemoteStringFromLabelKeys(
                                      RemoteLabelKeys.code_check_email),
                              actionLabel:
                                  LabelsManager().getRemoteStringFromLabelKeys(
                                RemoteLabelKeys.understand,
                              ),
                            );
                          } else {
                            form.findControl('code')?.value = '';
                            return OlAlertDialog.show(
                              context,
                              title: LabelsManager()
                                  .getRemoteStringFromLabelKeys(
                                      RemoteLabelKeys.error),
                              message: LabelsManager()
                                  .getRemoteStringFromLabelKeys(
                                      RemoteLabelKeys.error_occurred),
                              actionLabel: LabelsManager()
                                  .getRemoteStringFromLabelKeys(
                                      RemoteLabelKeys.retry),
                            );
                          }
                        },
                        recoverPassword: (code) {
                          return unawaited(
                            Nav.push(
                              context,
                              screen: BlocProvider(
                                create: (_) => getIt<PwdConfirmCubit>(),
                                child: PwdConfirmPage(
                                  args: PwdConfirmPageArgs(code: code),
                                ),
                              ),
                              root: true,
                            ),
                          );
                        },
                        showInitiatives: (user, selfModel, sessionId) {
                          return unawaited(
                            Nav.push(
                              context,
                              screen: InitiativesPage(
                                args: InitiativesPageArgs(
                                  session: user,
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
                        error: () => null,
                      ),
                      buildWhen: (previous, current) => current.maybeMap(
                        tryAgain: (_) => false,
                        showInitiatives: (_) => false,
                        error: (_) => false,
                        showPolicyPage: (_) => false,
                        orElse: () => true,
                      ),
                      builder: (context, state) => state.maybeMap(
                        initial: (value) => _content(context),
                        loading: (value) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        orElse: () => const SizedBox(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _content(BuildContext context) {
    return ReactiveForm(
      formGroup: form,
      child: LoginCard(
        title: LabelsManager()
            .getRemoteStringFromLabelKeys(RemoteLabelKeys.account_verify),
        // TODO(UmbertoGrimaldi): add remote string
        description:
            'Abbiamo inviato un codice all’indirizzo ${widget.args.userId}.\nControlla la tua casella di posta e inseriscilo qui di seguito.',

        // LabelsManager()
        //     .getRemoteStringFromLabelKeys(RemoteLabelKeys.send_code_text)
        //     .replaceFirst('{user}', widget.args.userId),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldInput(
              // TODO(UmbertoGrimaldi): add remote string
              headerTitle: 'Inserisci il codice',
              form: form,
              controlName: 'code',
              order: 1,
            ),
            const SizedBox(height: Dimens.spacingXL),
            Row(
              children: [
                Text(
                  "${LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.no_code_received)} ",
                  style: AppTextTheme.caption(),
                ),
                const SizedBox(width: 12),
                Transform.translate(
                  offset: const Offset(0, 6),
                  child: OLTextButton(
                    // TODO(UmbertoGrimaldi): add remote string
                    title: 'Ricevi Codice',
                    onPressed: () {
                      context.read<MfaCubit>().resendMfaCodeToUser();
                    },
                  ),
                )
              ],
            ),
            const SizedBox(height: 32.0),
            ReactiveFormConsumer(builder: (context, formGroup, child) {
              return Align(
                alignment: Alignment.center,
                child: OLButton(
                  title: LabelsManager()
                      .getRemoteStringFromLabelKeys(RemoteLabelKeys.confirm),
                  onPressed: formGroup.valid
                      ? () {
                          final code =
                              formGroup.findControl('code')?.value as String;
                          if (widget.args.recoverPassword) {
                            print('cslkdnclksndlkcnlksd------');
                            context.read<MfaCubit>().sendMFAForRecoverPwd(code);
                          } else {
                            print('cslkdnclksndlkcnlksd------2');
                            context.read<MfaCubit>().sendMFA(
                                  code,
                                  remember: widget.args.remember,
                                );
                          }
                        }
                      : null,
                ),
              );
            }),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class MfaValidationPageArgs {
  final bool remember;
  final bool recoverPassword;
  final String userId;

  MfaValidationPageArgs({
    required this.remember,
    this.recoverPassword = false,
    required this.userId,
  });
}
