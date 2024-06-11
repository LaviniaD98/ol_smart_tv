import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../color_management/color_manager.dart';
import '../../../theme/app_theme.dart';
import '../../common/widgets/forms/reactive_text_field_input.dart';

class ReactiveSearchInput extends StatelessWidget {
  final bool readOnly;
  final bool autoFocus;
  final bool showReset;
  final VoidCallback? onReset;
  final ReactiveFormSearchCallback? onTap;
  final ReactiveFormSearchCallback? onEditingComplete;
  final ReactiveFormSearchCallback? onSubmitted;
  final ReactiveFormSearchCallback? onChanged;
  final String formControlName;

  const ReactiveSearchInput({
    super.key,
    this.onReset,
    this.onTap,
    this.onEditingComplete,
    this.onSubmitted,
    this.onChanged,
    this.readOnly = false,
    this.autoFocus = false,
    this.showReset = false,
    required this.formControlName,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        height: 40.0,
        child: ReactiveTextFieldInput(
          formControlName: 'search',
          autofocus: autoFocus,
          readOnly: readOnly,
          cursorColor: ColorManager().getColorTextPrimaryAlternative(),
          style: AppTextTheme.body(
              color: ColorManager().getColorTextPrimaryAlternative()),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            isCollapsed: true,
            prefixIcon: UnconstrainedBox(
              child: SvgPicture.asset(
                "assets/icons/search.svg",
                width: 24,
                colorFilter: ColorFilter.mode(
                    ColorManager().getColorTextPrimaryCta(), BlendMode.srcIn),
              ),
            ),
            suffixIcon: showReset
                ? InkWell(
                    onTap: onReset,
                    child: UnconstrainedBox(
                      child: SvgPicture.asset(
                        "assets/icons/cross.svg",
                        width: 16,
                        colorFilter: ColorFilter.mode(
                            ColorManager().getColorTextPrimaryCta(),
                            BlendMode.srcIn),
                      ),
                    ),
                  )
                : null,
            fillColor: ColorManager().getColorBackgroundSecondary(),
            helperMaxLines: 1,
            hintMaxLines: 1,
            hintText: LabelsManager()
                .getRemoteStringFromLabelKeys(RemoteLabelKeys.search_hint_text),
            border: InputBorder.none,
            hintStyle:
                AppTextTheme.body(color: ColorManager().getColorTextDisabled()),
          ),
          showErrors: (_) => false,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          onSubmitted: onSubmitted,
        ),
      ),
    );
  }
}

typedef ReactiveFormSearchCallback = void Function(FormControl<String> control);
