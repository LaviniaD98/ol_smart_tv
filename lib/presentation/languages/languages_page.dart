import 'package:open_learning_smart_tv/domain/entities/language/language_model.dart';
import 'package:open_learning_smart_tv/presentation/languages/cubit/languages_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

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
      backgroundColor: ColorManager().getColorBackgroundPrimaryLighter(),
      body: Container(
        decoration: BoxDecoration(gradient: AppTheme.backgroundGradient),
        child: Padding(
          padding: const EdgeInsets.all(Dimens.spacingL),
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(Dimens.spacingM),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimens.radius),
                gradient: AppTheme.greyGradient,
              ),
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
                  initial: (value) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: ListView.separated(
                          physics: const ClampingScrollPhysics(),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: Dimens.spacingM),
                          itemCount: value.supportedLanguages.length,
                          itemBuilder: (BuildContext context, int index) {
                            final child =
                                _item(value.supportedLanguages[index]);
                            if (index == 0) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _header,
                                  const SizedBox(height: Dimens.spacingXXL2),
                                  child,
                                ],
                              );
                            }
                            return child;
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(
                            Dimens.spacingM,
                            Dimens.spacingM,
                            Dimens.spacingM,
                            0,
                          ),
                          child: ElevatedButton(
                            style: AppButtonStyle.red,
                            onPressed: current != value.selected
                                ? () => context
                                    .read<LanguagesCubit>()
                                    .onLanguageChange(current)
                                : null,
                            child: Text(
                              LabelsManager().getRemoteStringFromLabelKeys(
                                  RemoteLabelKeys.continue_button),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  orElse: () => const SizedBox.shrink(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget get _header {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          "assets/images/app_logo.svg",
          width: 160,
          height: 24,
        ),
        _backButton,
        Text(
          LabelsManager()
              .getRemoteStringFromLabelKeys(RemoteLabelKeys.languages_title),
          textAlign: TextAlign.start,
          style: AppTextTheme.title(
            color: ColorManager().getColorTextPrimaryCta(),
          ),
        ),
      ],
    );
  }

  Widget get _backButton {
    if (Navigator.of(context).canPop()) {
      return Padding(
        padding: const EdgeInsets.only(
            top: Dimens.spacingM, bottom: Dimens.spacingXL),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: Navigator.of(context).pop,
              behavior: HitTestBehavior.translucent,
              child: SvgPicture.asset("assets/icons/back_arrow.svg"),
            ),
            const SizedBox(width: Dimens.spacingXS),
            Expanded(
              child: Text(
                LabelsManager()
                    .getRemoteStringFromLabelKeys(RemoteLabelKeys.back),
                textAlign: TextAlign.start,
                style: AppTextTheme.caption(
                  color: ColorManager().getColorTextPrimary(),
                ),
              ),
            ),
          ],
        ),
      );
    }
    return const SizedBox(height: 64.0);
  }

  Widget _item(LanguageModel model) {
    final isSelected = current.id == model.id;
    return GestureDetector(
      onTap: () {
        setState(() {
          current = model;
        });
      },
      child: Glow(
        glow: isSelected,
        child: Container(
          height: 56.0,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              width: 1,
              color: isSelected
                  ? ColorManager().getColorBorderAccent()
                  : ColorManager().getColorTextPrimary(),
            ),
            borderRadius: BorderRadius.circular(Dimens.radius),
          ),
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
