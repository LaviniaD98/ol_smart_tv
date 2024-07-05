import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:open_learning_smart_tv/theme/glow/widget/glow_container.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({
    required this.order,
    this.onChanged,
    this.autofocus = false,
    this.isSelected = false,
    this.keepSelection = false,
    this.enabled = true,
    this.isRounded = false,
    super.key,
  });

  final void Function(bool)? onChanged;
  final int order;
  final bool autofocus;
  final bool isSelected;
  final bool keepSelection;
  final bool enabled;
  final bool isRounded;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isSelected = false;

  final FocusNode focusNode = FocusNode();
  @override
  void initState() {
    super.initState();

    isSelected = widget.isSelected;
  }

  @override
  void didUpdateWidget(covariant CustomCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isSelected != oldWidget.isSelected) {
      isSelected = widget.isSelected;
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
    return Align(
      child: SizedBox(
        width: Dimens.checkBoxSize,
        height: Dimens.checkBoxSize,
        child: FocusTraversalOrder(
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
              onTap: () {
                if (widget.keepSelection && isSelected) {
                  return;
                }
                isSelected = !isSelected;
                widget.onChanged?.call(isSelected);
                setState(() {});
              },
              focusColor: Colors.white,
              child: GlowContainer(
                border: Border.all(
                  color: widget.enabled
                      ? ColorManager().getColorBackgroundPrimaryCta()
                      : Colors.transparent,
                  width: focusNode.hasFocus ? 3 : 2.0,
                ),
                spreadRadius: 1.2,
                blurRadius: 12,
                offset: const Offset(0, 0),
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.isRounded ? 30.0 : 2),
                ),
                width: Dimens.checkBoxSize,
                height: Dimens.checkBoxSize,
                child: widget.enabled && isSelected
                    ? Align(
                        child: Container(
                          height: 9,
                          width: 9,
                          decoration: BoxDecoration(
                            color:
                                ColorManager().getColorBackgroundPrimaryCta(),
                            borderRadius: BorderRadius.all(
                              Radius.circular(widget.isRounded ? 30.0 : 2),
                            ),
                          ),
                        ),
                      )
                    : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
