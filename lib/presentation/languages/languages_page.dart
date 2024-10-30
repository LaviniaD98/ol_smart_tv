import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/domain/entities/language/language_model.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/generic_container.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_button.dart';
import 'package:open_learning_smart_tv/presentation/languages/cubit/languages_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_learning_smart_tv/presentation/login/widgets/logo_banner.dart';

import '../../color_management/color_manager.dart';
import '../../core/dependency_injection/dependency_injection.dart';
import '../../remote_theming/labels/labels_manager.dart';
import '../../remote_theming/labels/remote_labels.dart';
import '../../remote_theming/labels/remote_labels_keys.dart';
import '../../theme/app_theme.dart';
import '../common/widgets/dialog/ol_alert_dialog.dart';
import '../common/widgets/glow.dart';

class LanguagesPage extends StatefulWidget {
  static String routeName = 'languages';
  const LanguagesPage({super.key, required this.args});
  final LanguagesPageArgs args;
  @override
  State<LanguagesPage> createState() => _LanguagesPageState();
}

class _LanguagesPageState extends State<LanguagesPage> {
  LanguageModel current = getIt<RemoteLabels>().selectedLanguage;

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
              child: BlocConsumer<LanguagesCubit, LanguagesState>(
                listener: (context, state) => state.whenOrNull(
                  error: () async {
                    await OlAlertDialog.show(
                      context,
                      title: LabelsManager()
                          .getRemoteStringFromLabelKeys(RemoteLabelKeys.error),
                      message: LabelsManager().getRemoteStringFromLabelKeys(
                          RemoteLabelKeys.error_occurred_try_later),
                      actionLabel: LabelsManager()
                          .getRemoteStringFromLabelKeys(RemoteLabelKeys.close),
                    );
                    setState(() {
                      current = getIt<RemoteLabels>().selectedLanguage;
                    });
                    return null;
                  },
                ),
                buildWhen: (previous, current) => current.maybeWhen(
                  error: () => false,
                  orElse: () => true,
                ),
                builder: (context, state) => state.maybeMap(
                  loading: (_) =>
                      const Center(child: CircularProgressIndicator()),
                  initial: (value) => Align(
                    child: Container(
                      padding: const EdgeInsets.all(Dimens.hPadding),
                      width: 887,
                      constraints:
                          const BoxConstraints(minHeight: 700, maxHeight: 700),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: OLColors.backgroundPrimary.withOpacity(0.8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            LabelsManager().getRemoteStringFromLabelKeys(
                                RemoteLabelKeys.languages_title),
                            textAlign: TextAlign.start,
                            style: AppTextTheme.title(
                              color: ColorManager().getColorTextPrimaryCta(),
                            ),
                          ),
                          const SizedBox(height: 32.0),
                          Expanded(
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: Dimens.spacingM),
                              itemCount: value.supportedLanguages.length,
                              itemBuilder: (BuildContext context, int index) {
                                final child =
                                    _item(value.supportedLanguages[index]);

                                return child;
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                child: OLButton(
                                  title: LabelsManager()
                                      .getRemoteStringFromLabelKeys(
                                          RemoteLabelKeys.back),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Align(
                                child: OLButton(
                                  title: LabelsManager()
                                      .getRemoteStringFromLabelKeys(
                                          RemoteLabelKeys.continue_button),
                                  onPressed: current != value.selected
                                      ? () => context
                                          .read<LanguagesCubit>()
                                          .onLanguageChange(current)
                                      : null,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  orElse: () => const SizedBox.shrink(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _item(LanguageModel model) {
    final isSelected = current.id == model.id;
    return GenericContainer(
      decorationBuilder: (hasFocus) {
        return BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            width: hasFocus ? 5 : 1,
            color: isSelected
                ? ColorManager().getColorBorderAccent()
                : ColorManager().getColorTextPrimary(),
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
          borderRadius: BorderRadius.circular(Dimens.radius),
        );
      },
      onPressed: () {
        setState(() {
          current = model;
        });
      },
      child: Glow(
        glow: isSelected,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: Dimens.spacingXS,
            horizontal: Dimens.spacingL,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  model.label,
                  textAlign: TextAlign.start,
                  style: AppTextTheme.subtitle(
                    color: isSelected
                        ? ColorManager().getColorSystemSecondary01()
                        : ColorManager().getColorTextPrimary(),
                  ),
                ),
              ),
              const SizedBox(width: Dimens.spacingM),
              if (isSelected)
                SvgPicture.asset(
                  "assets/icons/ic_flagged.svg",
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    ColorManager().getColorSystemSecondary01(),
                    BlendMode.srcIn,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class LanguagesPageArgs {
  const LanguagesPageArgs({required this.onChanged});
  final VoidCallback onChanged;
}
