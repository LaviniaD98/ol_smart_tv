import 'package:open_learning_smart_tv/core/utils/nav.dart';
import 'package:open_learning_smart_tv/presentation/pwd_reset/pwd_reset_page.dart';
import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/forms/reactive_text_field_input.dart';
import 'package:open_learning_smart_tv/presentation/login/widgets/login_card.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../remote_theming/labels/labels_manager.dart';
import '../../remote_theming/labels/remote_labels_keys.dart';
import '../common/widgets/dialog/ol_alert_dialog.dart';
import 'forms/pwd_set_old_form.dart';

class PwdSetOldPage extends StatefulWidget {
  static String routeName = 'setoldpwd';
  const PwdSetOldPage({super.key});

  @override
  State<PwdSetOldPage> createState() => _PwdSetOldPageState();
}

class _PwdSetOldPageState extends State<PwdSetOldPage> {
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
            child: _content(context)),
      ),
    );
  }

  Widget _content(BuildContext context) {
    final form = PwdSetOldForm.build();

    return Scaffold(
        body: ReactiveForm(
      formGroup: form,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(
          20.0,
        ),
        child: LoginCard(
          gradient: AppTheme.greyGradient,
          title: LabelsManager()
              .getRemoteStringFromLabelKeys(RemoteLabelKeys.password_change),
          description: LabelsManager()
              .getRemoteStringFromLabelKeys(RemoteLabelKeys.safe_password_txt),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LabelsManager()
                    .getRemoteStringFromLabelKeys(RemoteLabelKeys.password_old),
                textAlign: TextAlign.start,
                style: AppTextTheme.subtitle(
                  color: ColorManager().getColorTextPrimary(),
                ),
              ),
              const SizedBox(height: 8.0),
              ReactiveTextFieldInput(
                formControlName: 'vecchiapassword',
                obscureText: true,
                onChanged: (form) {
                  //final pwd1 = form.findControl('nuovapassword').value as String;
                },
                style: TextStyle(
                  color: ColorManager().getColorTextPrimary(),
                ),
                showErrors: (_) => false,
              ),
              const SizedBox(height: 16.0),
              ReactiveFormConsumer(
                builder: (context, formGroup, child) {
                  return Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: AppButtonStyle.red,
                      key: const Key('loginForm_continue_raisedButton'),
                      onPressed: () {
                        final value =
                            formGroup.findControl('vecchiapassword')?.value;
                        if (value != null) {
                          String pwd = value as String;
                          if (pwd.isNotEmpty) {
                            Nav.push(
                              context,
                              screen: PwdResetPage(
                                args: PwdResetPageArgs(
                                  oldpwd: pwd,
                                ),
                              ),
                            );
                          }
                        } else {
                          OlAlertDialog.show(
                            context,
                            title: LabelsManager().getRemoteStringFromLabelKeys(
                                RemoteLabelKeys.error),
                            message: LabelsManager()
                                .getRemoteStringFromLabelKeys(
                                    RemoteLabelKeys.insert_current_password),
                            actionLabel: LabelsManager()
                                .getRemoteStringFromLabelKeys(
                                    RemoteLabelKeys.close),
                          );
                        }
                      },
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
}
