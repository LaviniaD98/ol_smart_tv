import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:open_learning_smart_tv/core/dependency_injection/dependency_injection.dart';
import 'package:open_learning_smart_tv/core/utils/nav.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/text_field_input.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/ol_alert_dialog.dart';
import 'package:open_learning_smart_tv/presentation/corporate_code/cubit/corporate_code_cubit.dart';
import 'package:open_learning_smart_tv/presentation/initiatives/initiatives_page.dart';
import 'package:open_learning_smart_tv/presentation/login/cubit/login_cubit.dart';
import 'package:open_learning_smart_tv/presentation/login/login_page.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_button.dart';
import 'package:open_learning_smart_tv/presentation/login/widgets/login_card.dart';
import 'package:open_learning_smart_tv/presentation/login/widgets/logo_banner.dart';
import 'package:open_learning_smart_tv/presentation/privacy/cubit/privacy_cubit.dart';
import 'package:open_learning_smart_tv/presentation/privacy/privacy_page.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../theme/app_theme.dart';

class CorporateCodePage extends StatefulWidget {
  const CorporateCodePage({super.key});
  static String routeName = 'corporate_code';

  @override
  State<CorporateCodePage> createState() => _CorporateCodePageState();
}

class _CorporateCodePageState extends State<CorporateCodePage> {
  final OrderedTraversalPolicy _focusNodeOrder = OrderedTraversalPolicy();

  final FocusNode _focusNode = FocusNode();

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
      body: FocusTraversalGroup(
        policy: _focusNodeOrder,
        child: Container(
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
                  child: BlocConsumer<CorporateCodeCubit, CorporateCodeState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        showInitiatives: (session, selfModel, sessionId) {
                          return unawaited(
                            Nav.pushReplacement(
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
                        error: () => OlAlertDialog.show(
                          context,
                          title: LabelsManager().getRemoteStringFromLabelKeys(
                              RemoteLabelKeys.error),
                          message: LabelsManager().getRemoteStringFromLabelKeys(
                              RemoteLabelKeys.corporate_code_error),
                          actionLabel: LabelsManager()
                              .getRemoteStringFromLabelKeys(
                                  RemoteLabelKeys.retry),
                        ),
                        success: () async {
                          await Nav.push(
                            context,
                            screen: BlocProvider(
                              create: (context) {
                                return getIt<LoginCubit>()..init();
                              },
                              child: const LoginPage(),
                            ),
                          );

                          await Future.delayed(
                              const Duration(milliseconds: 300), () {
                            _focusNode.requestFocus();
                          });
                          return null;
                        },
                        showSessionPopup: () {
                          return OlAlertDialog.show(
                            context,
                            title: LabelsManager().getRemoteStringFromLabelKeys(
                                RemoteLabelKeys.info),
                            message: LabelsManager()
                                .getRemoteStringFromLabelKeys(
                                    RemoteLabelKeys.session_expired),
                            actionLabel: LabelsManager()
                                .getRemoteStringFromLabelKeys(
                                    RemoteLabelKeys.session_expired_ok_button),
                          );
                        },
                      );
                    },
                    listenWhen: (previous, current) => current.maybeMap(
                      success: (_) => true,
                      error: (_) => true,
                      showInitiatives: (_) => true,
                      showPolicyPage: (_) => true,
                      showSessionPopup: (_) => true,
                      orElse: () => false,
                    ),
                    buildWhen: (previous, current) => current.maybeMap(
                      initial: (_) => true,
                      loading: (_) => true,
                      orElse: () => false,
                    ),
                    builder: (context, state) {
                      return state.maybeWhen(
                        loading: () => _loading,
                        initial: (form) {
                          // TODO(UmbertoGrimaldi): REMOVE THIS
                          if (kDebugMode) {
                            form.findControl('corporateCode')?.value =
                                'TESTAP03';
                          }

                          return _content(context, form);
                        },
                        orElse: () => const SizedBox(),
                      );
                    },
                  ),
                ),
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

  Widget _content(BuildContext context, FormGroup form) {
    return ReactiveForm(
      formGroup: form,
      child: LoginCard(
        title: LabelsManager()
            .getRemoteStringFromLabelKeys(RemoteLabelKeys.welcome),
        description: LabelsManager()
            .getRemoteStringFromLabelKeys(RemoteLabelKeys.access_text),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldInput(
              headerTitle: LabelsManager()
                  .getRemoteStringFromLabelKeys(RemoteLabelKeys.code),
              form: form,
              focusNode: _focusNode,
              controlName: 'corporateCode',
              order: 1,
            ),
            const SizedBox(height: Dimens.spacingXXL2),
            ReactiveFormConsumer(
              builder: (context, formGroup, child) {
                return Center(
                  child: OLButton(
                    title: LabelsManager().getRemoteStringFromLabelKeys(
                      RemoteLabelKeys.confirm,
                    ),
                    onPressed: formGroup.valid
                        ? () async {
                            final corporateCode = formGroup
                                .findControl('corporateCode')
                                ?.value as String;
                            context
                                .read<CorporateCodeCubit>()
                                .submitCode(corporateCode);
                          }
                        : null,
                  ),
                );
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
