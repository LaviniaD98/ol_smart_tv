import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_button.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/text_field_input.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/ol_alert_dialog.dart';
import 'package:open_learning_smart_tv/presentation/login/widgets/logo_banner.dart';
import 'package:open_learning_smart_tv/presentation/pwd_recover/cubit/pwd_recover_page_cubit.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_learning_smart_tv/presentation/login/widgets/login_card.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PwdRecoverStartPage extends StatefulWidget {
  static String routeName = 'recuperapwd';
  const PwdRecoverStartPage({super.key});

  @override
  State<PwdRecoverStartPage> createState() => _PwdRecoverStartPageState();
}

class _PwdRecoverStartPageState extends State<PwdRecoverStartPage> {
  final _focusNode = FocusNode();

  bool isEmailSent = false;
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 300), () {
      _focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Builder(
                builder: (context) {
                  if (isEmailSent) {
                    return buildSuccessContent();
                  }
                  return SingleChildScrollView(
                    child: BlocConsumer<PwdRecoverCubit, PwdRecoverState>(
                      listener: (context, state) => state.whenOrNull(
                        mfaValidation: (remember, userId) async {
                          setState(() => isEmailSent = true);
                          return;
                        },
                        error: (errorMessage) async {
                          OlAlertDialog.show(
                            context,
                            title: LabelsManager().getRemoteStringFromLabelKeys(
                                RemoteLabelKeys.error),
                            message: errorMessage,
                            actionLabel: LabelsManager()
                                .getRemoteStringFromLabelKeys(
                                    RemoteLabelKeys.retry),
                          );
                          return;
                        },
                      ),
                      listenWhen: (previous, current) => current.maybeMap(
                        mfaValidation: (_) => true,
                        error: (_) => true,
                        orElse: () => false,
                      ),
                      buildWhen: (previous, current) => current.maybeMap(
                        mfaValidation: (_) => false,
                        error: (_) => false,
                        orElse: () => true,
                      ),
                      builder: (context, state) => state.maybeWhen(
                        loading: () => _loading,
                        init: (form) => _content(context, form),
                        orElse: () => const SizedBox(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _loading {
    return const Center(child: CircularProgressIndicator());
  }

  Widget buildSuccessContent() {
    return SingleChildScrollView(
      child: LoginCard(
        title: '',
        description: '',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset("assets/icons/success.svg"),
                const SizedBox(width: 32),
                Expanded(
                  child: Text(
                    // TODO(UmbertoGrimaldi): add remote string
                    'Controlla la posta!\nTi abbiamo inviato una mail con la procedura per la reimpostazione della password',
                    textAlign: TextAlign.start,
                    style: AppTextTheme.subtitle(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 64),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FocusTraversalOrder(
                  order: const NumericFocusOrder(2.0),
                  child: OLButton(
                    // TODO(UmbertoGrimaldi): add remote string
                    title: 'Torna alla Login',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100.0),
          ],
        ),
      ),
    );
  }

  Widget _content(BuildContext context, FormGroup form) {
    return ReactiveForm(
      formGroup: form,
      child: LoginCard(
        // TODO(UmbertoGrimaldi): add remote string
        title: 'Reimposta password',
        // TODO(UmbertoGrimaldi): add remote string
        description: 'Segui le istruzioni e crea una password sicura',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldInput(
              focusNode: _focusNode,
              headerTitle: LabelsManager()
                  .getRemoteStringFromLabelKeys(RemoteLabelKeys.email),
              form: form,
              controlName: 'username',
              order: 1,
            ),
            const SizedBox(height: 24.0),
            ReactiveFormConsumer(
              builder: (context, formGroup, child) {
                return Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      FocusTraversalOrder(
                        order: const NumericFocusOrder(1.0),
                        child: OLButton(
                          // TODO(UmbertoGrimaldi): add remote string
                          title: 'Reset Password',
                          onPressed: (formGroup.findControl('username')?.value
                                          as String?)
                                      ?.isNotEmpty ==
                                  true
                              ? () {
                                  final username = formGroup
                                      .findControl('username')
                                      ?.value as String;
                                  context
                                      .read<PwdRecoverCubit>()
                                      .forgotPassword(username, true);
                                }
                              : null,
                        ),
                      ),
                      const SizedBox(height: 24),
                      FocusTraversalOrder(
                        order: const NumericFocusOrder(2.0),
                        child: OLButton(
                          title: LabelsManager().getRemoteStringFromLabelKeys(
                              RemoteLabelKeys.cancel),
                          textOnly: true,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
