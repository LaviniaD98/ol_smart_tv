import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:open_learning_smart_tv/theme/glow/widget/glow_container.dart';
import 'package:reactive_forms/reactive_forms.dart';

class OlCheckbox extends StatefulWidget {
  const OlCheckbox({
    required this.field,
    required this.order,
    this.onChanged,
    this.autofocus = false,
    super.key,
  });

  final ReactiveFormFieldState<bool, bool> field;
  final void Function()? onChanged;
  final int order;
  final bool autofocus;

  @override
  State<OlCheckbox> createState() => _OlCheckboxState();
}

class _OlCheckboxState extends State<OlCheckbox> {
  bool isActive = false;

  final FocusNode focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    isActive = widget.field.value == true;
  }

  @override
  void didUpdateWidget(covariant OlCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.field != oldWidget.field) {
      isActive = widget.field.value == true;
      setState(() {});
    }
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FocusTraversalOrder(
      order: NumericFocusOrder(widget.order.toDouble()),
      child: FocusableActionDetector(
        focusNode: focusNode,
        autofocus: widget.autofocus,
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
          LogicalKeySet(LogicalKeyboardKey.enter): const ActivateIntent(),
        },
        actions: <Type, Action<Intent>>{
          ActivateIntent: CallbackAction<ActivateIntent>(
            onInvoke: (ActivateIntent intent) async {
              if (widget.field.control.enabled) {
                widget.onChanged?.call();
                isActive = widget.field.value == true;
                setState(() {});
              }
              return null;
            },
          ),
        },
        onFocusChange: (value) {
          setState(() {});
        },
        child: Stack(
          children: [
            Positioned(
              bottom: 0.5,
              top: 0.5,
              left: 0,
              right: 0,
              child: GlowContainer(
                width: Dimens.checkBoxSize,
                height: Dimens.checkBoxSize,
                alignment: Alignment.center,
                color: isActive
                    ? ColorManager().getColorBackgroundPrimaryCta()
                    : ColorManager().getColorBackgroundPrimary(),
                border: Border.all(
                  color: ColorManager().getColorBorderTag(),
                  width: focusNode.hasFocus ? 3 : 1.0,
                  strokeAlign: BorderSide.strokeAlignInside,
                ),
                borderRadius: BorderRadius.circular(3.0),
              ),
            ),
            if (widget.field.value != null && widget.field.value!) ...[
              Container(
                width: Dimens.checkBoxSize,
                height: Dimens.checkBoxSize,
                decoration: BoxDecoration(
                  color: ColorManager().getColorBackgroundPrimaryCta(),
                  border: focusNode.hasFocus
                      ? Border.all(
                          color: ColorManager().getColorBorderTag(),
                          width: focusNode.hasFocus ? 3 : 0,
                          strokeAlign: BorderSide.strokeAlignInside,
                        )
                      : null,
                  borderRadius: BorderRadius.circular(3),
                ),
                padding: const EdgeInsets.all(2),
                child: SvgPicture.asset(
                  "assets/icons/checkbox_tick.svg",
                  width: 12.0,
                  colorFilter: ColorFilter.mode(
                    ColorManager().getColorTextPrimaryAlternative(),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
