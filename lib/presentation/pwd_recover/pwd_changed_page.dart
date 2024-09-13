import 'package:open_learning_smart_tv/core/utils/nav.dart';
import 'package:open_learning_smart_tv/presentation/login/login_page.dart';
import 'package:open_learning_smart_tv/presentation/login/utils/login_form_group.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/presentation/login/widgets/login_card.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PwdChangedPage extends StatelessWidget {
  static String routeName = 'pwdchanged';
  const PwdChangedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: AppColors.backgroundGradient),
          child: _content(context),
        ),
      ),
    );
  }

  Widget _content(BuildContext context) {
    return ReactiveForm(
      formGroup: LoginFormGroup.build(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          20.0,
          kToolbarHeight + 32,
          20.0,
          20.0,
        ),
        child: LoginCard(
          title: LabelsManager()
              .getRemoteStringFromLabelKeys(RemoteLabelKeys.password_changed),
          description: "",
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              ReactiveFormConsumer(
                builder: (context, formGroup, child) {
                  return Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: AppButtonStyle.red,
                      key: const Key('loginForm_continue_raisedButton'),
                      onPressed: () {
                        Nav.push(context, screen: const LoginPage());
                      },
                      child: Text(
                        LabelsManager().getRemoteStringFromLabelKeys(
                            RemoteLabelKeys.login),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
