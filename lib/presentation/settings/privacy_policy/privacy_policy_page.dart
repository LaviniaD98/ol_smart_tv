import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../color_management/color_manager.dart';
import '../../../theme/app_theme.dart';
import '../../common/widgets/app_bar/styled_app_bar.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  static String routeName = 'privacyPolicy';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const StyledAppBar(
          title: "",
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(gradient: AppTheme.backgroundGradient),
              padding: const EdgeInsets.fromLTRB(Dimens.spacingL,
                  Dimens.spacingS, Dimens.spacingL, Dimens.spacingXXL),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimens.radius),
                    gradient: AppTheme.greyGradient),
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
                        })
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
