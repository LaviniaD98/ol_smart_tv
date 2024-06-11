import 'package:open_learning_smart_tv/presentation/pwd_reset/cubit/pwd_reset_page_cubit.dart';
import 'package:open_learning_smart_tv/presentation/pwd_reset/pwd_modified_page.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/forms/reactive_text_field_input.dart';
import 'package:open_learning_smart_tv/presentation/login/widgets/login_card.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../remote_theming/labels/labels_manager.dart';
import '../../remote_theming/labels/remote_labels_keys.dart';
import '../app_state/cubit/app_cubit.dart';
import '../common/widgets/app_bar/styled_app_bar.dart';
import '../common/widgets/dialog/ol_alert_dialog.dart';

class PwdResetPageArgs {
  final String oldpwd;
  final bool? firstTimeReset;
  final CognitoUserNewPasswordRequiredException? exception;
  PwdResetPageArgs({required this.oldpwd, this.firstTimeReset, this.exception});
}

class PwdResetPage extends StatefulWidget {
  static String routeName = 'resetpwd';
  final PwdResetPageArgs args;
  const PwdResetPage({super.key, required this.args});

  @override
  State<PwdResetPage> createState() => _PwdResetPageState();
}

class _PwdResetPageState extends State<PwdResetPage> {
  bool a8 = false;
  bool aL = false;
  bool aN = false;
  bool aS = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: AppTheme.backgroundGradient),
          child: BlocConsumer<PwdResetCubit, PwdResetState>(
            listener: (context, state) => state.whenOrNull(
              success: () async {
                if (widget.args.firstTimeReset == true) {
                  await OlAlertDialog.show(context,
                      title: LabelsManager()
                          .getRemoteStringFromLabelKeys(RemoteLabelKeys.info),
                      message: LabelsManager().getRemoteStringFromLabelKeys(
                          RemoteLabelKeys.password_first_change_success),
                      actionLabel: LabelsManager().getRemoteStringFromLabelKeys(
                          RemoteLabelKeys.confirm),
                      barrierDismissible: false);
                  if (context.mounted) {
                    return context.read<AppCubit>().logout();
                  }
                } else {
                  return context.goNamed(PwdModifiedPage.routeName);
                }
                return;
              },
              error: (messageKey) async {
                await OlAlertDialog.show(context,
                    title: LabelsManager()
                        .getRemoteStringFromLabelKeys(RemoteLabelKeys.error),
                    message: LabelsManager()
                        .getRemoteStringFromLabelKeys(messageKey),
                    actionLabel: LabelsManager()
                        .getRemoteStringFromLabelKeys(RemoteLabelKeys.retry),
                    barrierDismissible: false);
                if (context.mounted) context.pop(true);
                return null;
              },
            ),
            builder: (context, state) => state.maybeWhen(
              loading: () => _loading,
              init: (form) => _content(context, form),
              orElse: () => const SizedBox(),
            ),
          ),
        ),
      ),
    );
  }

  Widget get _loading {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _content(BuildContext context, FormGroup form) {
    return Scaffold(
        appBar: const StyledAppBar(
          title: "",
        ),
        body: ReactiveForm(
          formGroup: form,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(
              20.0,
            ),
            child: LoginCard(
              gradient: AppTheme.greyGradient,
              title: LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.password_change),
              description: LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.safe_password_txt),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LabelsManager().getRemoteStringFromLabelKeys(
                        RemoteLabelKeys.new_password),
                    textAlign: TextAlign.start,
                    style: AppTextTheme.subtitle(
                      color: ColorManager().getColorTextPrimary(),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  ReactiveTextFieldInput(
                    formControlName: 'nuovapassword',
                    obscureText: true,
                    onChanged: (form) {
                      final pwd1 =
                          form.findControl('nuovapassword').value as String;
                      setPwdState(pwd1);
                    },
                    style: AppTextTheme.subtitle(
                      color: ColorManager().getColorTextPrimary(),
                    ),
                    showErrors: (_) => false,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    LabelsManager().getRemoteStringFromLabelKeys(
                        RemoteLabelKeys.confirm_password),
                    textAlign: TextAlign.start,
                    style: AppTextTheme.subtitle(
                      color: ColorManager().getColorTextPrimary(),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  ReactiveTextFieldInput(
                    formControlName: 'confermapassword',
                    obscureText: true,
                    onChanged: (form) {
                      final pwd2 =
                          form.findControl('confermapassword').value as String;
                      setPwdState(pwd2);
                    },
                    style: AppTextTheme.subtitle(
                      color: ColorManager().getColorTextPrimary(),
                    ),
                    showErrors: (_) => false,
                  ),
                  const SizedBox(height: 24.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LabelsManager().getRemoteStringFromLabelKeys(
                            RemoteLabelKeys.pw_criteria_text),
                      ),
                      Container(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        height: MediaQuery.of(context).size.width / 4.2,
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing:
                              MediaQuery.of(context).size.width * 0.1,
                          padding: EdgeInsets.zero,
                          mainAxisSpacing: 4.0,
                          childAspectRatio: 3 / 1,
                          children: <Widget>[
                            Row(children: [
                              SvgPicture.asset(
                                "assets/icons/border_check.svg",
                                width: 24,
                                height: 24,
                                colorFilter: a8
                                    ? ColorFilter.mode(
                                        ColorManager()
                                            .getColorSystemSecondary02(),
                                        BlendMode.srcIn,
                                      )
                                    : ColorFilter.mode(
                                        ColorManager()
                                            .getColorSystemPrimary01(),
                                        BlendMode.srcIn,
                                      ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                  LabelsManager().getRemoteStringFromLabelKeys(
                                      RemoteLabelKeys.pw_ch),
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: ColorManager()
                                          .getColorTextPrimary())),
                            ]),
                            Row(children: [
                              SvgPicture.asset(
                                "assets/icons/border_check.svg",
                                width: 24,
                                height: 24,
                                colorFilter: aL
                                    ? ColorFilter.mode(
                                        ColorManager()
                                            .getColorSystemSecondary02(),
                                        BlendMode.srcIn,
                                      )
                                    : ColorFilter.mode(
                                        ColorManager()
                                            .getColorSystemPrimary01(),
                                        BlendMode.srcIn,
                                      ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                  LabelsManager().getRemoteStringFromLabelKeys(
                                      RemoteLabelKeys.pw_let),
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: ColorManager()
                                          .getColorTextPrimary())),
                            ]),
                            Row(children: [
                              SvgPicture.asset(
                                "assets/icons/border_check.svg",
                                width: 24,
                                height: 24,
                                colorFilter: aN
                                    ? ColorFilter.mode(
                                        ColorManager()
                                            .getColorSystemSecondary02(),
                                        BlendMode.srcIn,
                                      )
                                    : ColorFilter.mode(
                                        ColorManager()
                                            .getColorSystemPrimary01(),
                                        BlendMode.srcIn,
                                      ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                  LabelsManager().getRemoteStringFromLabelKeys(
                                      RemoteLabelKeys.pw_num),
                                  style: TextStyle(
                                      fontSize: 12,
                                      color:
                                          ColorManager().getColorTextPrimary()))
                            ]),
                            Row(children: [
                              SvgPicture.asset(
                                "assets/icons/border_check.svg",
                                width: 24,
                                height: 24,
                                colorFilter: aS
                                    ? ColorFilter.mode(
                                        ColorManager()
                                            .getColorSystemSecondary02(),
                                        BlendMode.srcIn,
                                      )
                                    : ColorFilter.mode(
                                        ColorManager()
                                            .getColorSystemPrimary01(),
                                        BlendMode.srcIn,
                                      ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.25,
                                  child: Text(
                                      LabelsManager()
                                          .getRemoteStringFromLabelKeys(
                                              RemoteLabelKeys.pw_special_ch),
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: ColorManager()
                                              .getColorTextPrimary())))
                            ])
                          ],
                        ),
                        // Repeat for each pair
                        // ...
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  ReactiveFormConsumer(
                    builder: (context, formGroup, child) {
                      return Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          style: AppButtonStyle.red,
                          key: const Key('loginForm_continue_raisedButton'),
                          onPressed: formGroup.valid
                              ? () {
                                  final pwd1 = formGroup
                                      .findControl('nuovapassword')
                                      ?.value as String;
                                  final pwd2 = formGroup
                                      .findControl('confermapassword')
                                      ?.value as String;

                                  if (pwd1 == pwd2 && isValidPassword(pwd1)) {
                                    if (widget.args.firstTimeReset == true &&
                                        widget.args.exception != null) {
                                      context
                                          .read<PwdResetCubit>()
                                          .firstTimeResetPassword(
                                            widget.args.oldpwd,
                                            pwd1,
                                            widget.args.exception!,
                                          );
                                    } else {
                                      context
                                          .read<PwdResetCubit>()
                                          .changePassword(
                                            widget.args.oldpwd,
                                            pwd1,
                                          );
                                    }
                                  } else {
                                    OlAlertDialog.show(
                                      context,
                                      title: LabelsManager()
                                          .getRemoteStringFromLabelKeys(
                                              RemoteLabelKeys.error),
                                      message: LabelsManager()
                                          .getRemoteStringFromLabelKeys(
                                              RemoteLabelKeys.pw_no_match),
                                      actionLabel: LabelsManager()
                                          .getRemoteStringFromLabelKeys(
                                              RemoteLabelKeys.close),
                                    );
                                  }
                                }
                              : null,
                          child: Text(
                            LabelsManager().getRemoteStringFromLabelKeys(
                                RemoteLabelKeys.confirm_password),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  bool almeno8Caratteri(String pwd) {
    // Minimo 8 caratteri
    if (pwd.length < 8) {
      return false;
    }
    return true;
  }

  bool almenoUnCarattereSpeciale(String pwd) {
    // Almeno un carattere speciale
    RegExp hasSpecialCharacter = RegExp(r'[@$#!%&]');
    if (!hasSpecialCharacter.hasMatch(pwd)) {
      return false;
    }
    return true;
  }

  bool almenoUnaLettera(String pwd) {
    // Almeno una lettera
    RegExp hasLetter = RegExp(r'[a-zA-Z]');
    if (!hasLetter.hasMatch(pwd)) {
      return false;
    }
    return true;
  }

  bool almenoUnNumero(String pwd) {
    // Almeno un numero
    RegExp hasNumber = RegExp(r'\d');
    if (!hasNumber.hasMatch(pwd)) {
      return false;
    }
    return true;
  }

  void setPwdState(String pwd) {
    setState(() {
      a8 = almeno8Caratteri(pwd);
      aL = almenoUnaLettera(pwd);
      aN = almenoUnNumero(pwd);
      aS = almenoUnCarattereSpeciale(pwd);
    });
  }

  bool isValidPassword(String pwd) {
    return (almeno8Caratteri(pwd) &&
        almenoUnaLettera(pwd) &&
        almenoUnCarattereSpeciale(pwd) &&
        almenoUnNumero(pwd));
  }
}
