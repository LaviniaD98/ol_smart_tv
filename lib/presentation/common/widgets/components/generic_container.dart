import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';

class GenericContainer extends StatefulWidget {
  const GenericContainer({
    required this.child,
    this.onPressed,
    this.decoration,
    this.padding,
    super.key,
  });

  final Widget child;
  final void Function()? onPressed;
  final BoxDecoration? decoration;
  final EdgeInsets? padding;

  @override
  State<GenericContainer> createState() => _GenericContainerState();
}

class _GenericContainerState extends State<GenericContainer> {
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      focusNode: focusNode,
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
        LogicalKeySet(LogicalKeyboardKey.enter): const ActivateIntent(),
      },
      actions: <Type, Action<Intent>>{
        ActivateIntent: CallbackAction<ActivateIntent>(
          onInvoke: (ActivateIntent intent) async {
            widget.onPressed?.call();
            return null;
          },
        ),
      },
      onFocusChange: (value) {
        setState(() {});
      },
      child: Container(
        decoration: widget.decoration?.copyWith(
              border: Border.all(
                color: focusNode.hasFocus
                    ? ColorManager().getColorBorderTag()
                    : Colors.transparent,
                width: 3,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
            ) ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF19191F), Color(0xFF3E3E43)],
              ),
              border: focusNode.hasFocus
                  ? Border.all(
                      color: focusNode.hasFocus
                          ? ColorManager().getColorBorderTag()
                          : Colors.transparent,
                      width: 3,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    )
                  : null,
            ),
        padding: widget.padding ?? const EdgeInsets.all(24),
        child: widget.child,
      ),
    );
  }
}
