import 'package:flutter/services.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../color_management/color_manager.dart';
import '../../../theme/app_theme.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  static String routeName = 'privacyPolicy';

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  final scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: <ShortcutActivator, VoidCallback>{
        const SingleActivator(LogicalKeyboardKey.arrowUp): () {
          if (scrollController.offset > 0) {
            scrollController.animateTo(
              scrollController.offset - 100,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut,
            );
          }
        },
        const SingleActivator(LogicalKeyboardKey.arrowDown): () {
          if (scrollController.offset <
              scrollController.position.maxScrollExtent) {
            scrollController.animateTo(
              scrollController.offset + 100,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut,
            );
          }
        },
      },
      child: Focus(
        child: Scaffold(
          body: SingleChildScrollView(
            controller: scrollController,
            child: Container(
              decoration: BoxDecoration(gradient: AppTheme.backgroundGradient),
              padding: const EdgeInsets.fromLTRB(
                Dimens.spacingL,
                Dimens.spacingXXL,
                Dimens.spacingL,
                Dimens.spacingXXL,
              ),
              child: Container(
                padding: const EdgeInsets.all(Dimens.spacingM),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      "assets/images/app_logo.svg",
                    ),
                    const SizedBox(height: Dimens.spacingXXL2),
                    Html(
                      data: LabelsManager().getRemoteStringFromLabelKeys(
                          RemoteLabelKeys.privacy_policy_text),
                      onLinkTap: (url, _, __) async {
                        await launchUrl(Uri.parse(url ?? ''));
                      },
                      style: {
                        "body": Style.fromTextStyle(AppTextTheme.caption(
                            color: ColorManager().getColorTextPrimary())),
                        "h1": Style.fromTextStyle(AppTextTheme.subtitle(
                            weight: FontWeight.bold,
                            color: ColorManager().getColorTextPrimary())),
                        "h2": Style(
                            fontWeight: FontWeight.bold,
                            fontSize: FontSize(14.0),
                            margin: Margins.zero,
                            color: ColorManager().getColorTextPrimary()),
                        "a": Style(
                          color: ColorManager().getColorTextPrimaryCta(),
                          fontSize: FontSize(12.0),
                        ),
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
