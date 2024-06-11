import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
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
              return null;
            },
          ),
        },
        onFocusChange: (value) {
          setState(() {});
        },
        child: InkWell(
          //   focusNode: focusNode,
          onTap: widget.field.control.enabled
              ? () {
                  widget.onChanged?.call();
                  isActive = widget.field.value == true;
                  setState(() {});
                }
              : null,
          focusColor: Colors.white,
          child: AnimatedContainer(
            width: Dimens.checkBoxSize,
            height: Dimens.checkBoxSize,
            duration: const Duration(milliseconds: 120),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isActive
                  ? ColorManager().getColorBackgroundPrimaryCta()
                  : Colors.transparent,
              border: Border.all(
                color: ColorManager().getColorBorderTag(),
                width: focusNode.hasFocus ? 3 : 1.0,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(2.0)),
            ),
            child: widget.field.value != null && widget.field.value!
                ? SvgPicture.asset(
                    "assets/icons/checkbox_tick.svg",
                    width: 12.0,
                    colorFilter: ColorFilter.mode(
                      ColorManager().getColorTextPrimaryAlternative(),
                      BlendMode.srcIn,
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
