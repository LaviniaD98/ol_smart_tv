import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/domain/entities/self/self_model.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/forms/reactive_checkbox_field.dart';
import 'package:open_learning_smart_tv/presentation/login/widgets/login_card.dart';
import 'package:open_learning_smart_tv/presentation/privacy/cubit/privacy_cubit.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

import '../corporate_code/corporate_code_page.dart';
import '../initiatives/initiatives_page.dart';

class PrivacyPage extends StatefulWidget {
  static String routeName = 'privacy';
  final PrivacyPageArgs args;
  const PrivacyPage({super.key, required this.args});

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  final _form = FormGroup(
    {
      'check1': FormControl<bool>(
        validators: [
          Validators.requiredTrue,
        ],
      ),
      'check2': FormControl<bool>(
        validators: [
          Validators.requiredTrue,
        ],
      ),
      'check3': FormControl<bool>(
        validators: [
          Validators.requiredTrue,
        ],
      )
    },
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: AppColors.backgroundGradient),
          child: BlocConsumer<PrivacyCubit, PrivacyState>(
            listener: (context, state) => state.whenOrNull(
              showInitiatives: (session, selfModel, sessionId) {
                return context.pushNamed(
                  InitiativesPage.routeName,
                  extra: InitiativesPageArgs(
                      session: session,
                      selfModel: selfModel,
                      sessionId: sessionId),
                );
              },
              error: () => context.goNamed(CorporateCodePage.routeName),
            ),
            buildWhen: (previous, current) => current.maybeMap(
              error: (value) => false,
              showInitiatives: (value) => false,
              loading: (value) => true,
              orElse: () => true,
            ),
            builder: (context, state) => state.maybeWhen(
              loading: () => _loading,
              initial: () => _content,
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

  Widget get _content {
    return ReactiveForm(
      formGroup: _form,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          20.0,
          kToolbarHeight + 32,
          20.0,
          20.0,
        ),
        child: LoginCard(
            padding: const EdgeInsets.all(16.0),
            showBack: false,
            title: LabelsManager()
                .getRemoteStringFromLabelKeys(RemoteLabelKeys.before_starting),
            description: LabelsManager()
                .getRemoteStringFromLabelKeys(RemoteLabelKeys.terms_conditions),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, right: 16),
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: ReactiveCheckboxField(
                          formControlName: 'check1',
                        ),
                      ),
                    ),
                    Expanded(
                        child: Html(
                      data: LabelsManager().getRemoteStringFromLabelKeys(
                          RemoteLabelKeys.privacy_policy_page_flag1),
                      shrinkWrap: true,
                      style: {
                        "body": Style(
                          color: ColorManager().getColorTextPrimary(),
                          fontSize: FontSize.medium,
                          verticalAlign: VerticalAlign.top,
                        ),
                        'a': Style(
                          color: ColorManager().getColorTextPrimaryCta(),
                          verticalAlign: VerticalAlign.top,
                          fontSize: FontSize.large,
                        )
                      },
                      onLinkTap: (url, _, __) {
                        if (url?.isNotEmpty == true) {
                          launchUrl(Uri.parse(url!),
                              mode: LaunchMode.externalApplication);
                        }
                      },
                    )),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, right: 16),
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: ReactiveCheckboxField(
                          formControlName: 'check2',
                        ),
                      ),
                    ),
                    Expanded(
                        child: Html(
                      data: LabelsManager().getRemoteStringFromLabelKeys(
                          RemoteLabelKeys.privacy_policy_page_flag2),
                      shrinkWrap: true,
                      style: {
                        "body": Style(
                          color: ColorManager().getColorTextPrimary(),
                          fontSize: FontSize.medium,
                          verticalAlign: VerticalAlign.top,
                        ),
                        'a': Style(
                          color: ColorManager().getColorTextPrimaryCta(),
                          fontSize: FontSize.large,
                          verticalAlign: VerticalAlign.top,
                        )
                      },
                      onLinkTap: (url, _, __) {
                        if (url?.isNotEmpty == true) {
                          launchUrl(Uri.parse(url!),
                              mode: LaunchMode.externalApplication);
                        }
                      },
                    )),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, right: 16),
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: ReactiveCheckboxField(
                          formControlName: 'check3',
                        ),
                      ),
                    ),
                    Expanded(
                        child: Html(
                      data: LabelsManager().getRemoteStringFromLabelKeys(
                          RemoteLabelKeys.privacy_policy_page_flag3),
                      shrinkWrap: true,
                      style: {
                        "body": Style(
                          color: ColorManager().getColorTextPrimary(),
                          fontSize: FontSize.medium,
                          verticalAlign: VerticalAlign.top,
                        ),
                        'a': Style(
                          color: ColorManager().getColorTextPrimaryCta(),
                          fontSize: FontSize.large,
                          verticalAlign: VerticalAlign.top,
                        )
                      },
                      onLinkTap: (url, _, __) {
                        if (url?.isNotEmpty == true) {
                          launchUrl(Uri.parse(url!),
                              mode: LaunchMode.externalApplication);
                        }
                      },
                    )),
                  ],
                ),
                const SizedBox(height: 10.0),
                Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Html(
                      data: LabelsManager().getRemoteStringFromLabelKeys(
                          RemoteLabelKeys.privacy_policy_page_bottom_info),
                      shrinkWrap: true,
                      style: {
                        "body": Style(
                          color: ColorManager().getColorTextPrimary(),
                          fontSize: FontSize.medium,
                          verticalAlign: VerticalAlign.top,
                        ),
                        'a': Style(
                          color: ColorManager().getColorTextPrimaryCta(),
                          fontSize: FontSize.large,
                          verticalAlign: VerticalAlign.top,
                        )
                      },
                      onLinkTap: (url, _, __) {
                        if (url?.isNotEmpty == true) {
                          launchUrl(Uri.parse(url!),
                              mode: LaunchMode.externalApplication);
                        }
                      },
                    )),
                const SizedBox(height: 10.0),
                Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      LabelsManager().getRemoteStringFromLabelKeys(
                          RemoteLabelKeys.mandatory_fields),
                      textAlign: TextAlign.start,
                      style: AppTextTheme.subtitle(
                          color: ColorManager().getColorTextPrimary()),
                    )),
                const SizedBox(height: 32.0),
                ReactiveFormConsumer(
                  builder: (context, formGroup, child) {
                    return Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        style: AppButtonStyle.red,
                        key: const Key('loginForm_continue_raisedButton'),
                        onPressed: formGroup.valid
                            ? () {
                                context
                                    .read<PrivacyCubit>()
                                    .confirmPrivacyPolicy(
                                      session: widget.args.session,
                                      selfModel: widget.args.selfModel,
                                      sessionId: widget.args.sessionId,
                                    );
                              }
                            : null,
                        child: Text(
                          LabelsManager().getRemoteStringFromLabelKeys(
                              RemoteLabelKeys.continue_button),
                        ),
                      ),
                    );
                  },
                )
              ],
            )),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void dispose() {
    _form.dispose();
    super.dispose();
  }
}

class PrivacyPageArgs {
  final CognitoUserSession? session;
  final SelfModel selfModel;
  final String? sessionId;
  PrivacyPageArgs({this.session, required this.selfModel, this.sessionId});
}
