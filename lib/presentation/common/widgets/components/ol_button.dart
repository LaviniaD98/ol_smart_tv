import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';

class OLButton extends StatefulWidget {
  const OLButton({
    required this.title,
    this.focusNode,
    this.onPressed,
    this.width = 264,
    this.textOnly = false,
    super.key,
  });

  final String title;
  final void Function()? onPressed;
  final FocusNode? focusNode;
  final double? width;
  final bool textOnly;

  @override
  State<OLButton> createState() => _OLButtonState();
}

class _OLButtonState extends State<OLButton> {
  final _statesController = WidgetStatesController();

  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _statesController.addListener(updateStates);

    _focusNode.addListener(() {
      // print(' widget.focusNode: ${widget.focusNode?.hasFocus}');
    });
  }

  @override
  void dispose() {
    _statesController
      ..removeListener(updateStates)
      ..dispose();
    super.dispose();
  }

  Future<void> updateStates() async {
    await Future.delayed(const Duration(milliseconds: 10), () {});
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void didUpdateWidget(covariant OLButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.title != oldWidget.title) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = WidgetStateProperty.resolveWith(
      (states) => getBorderColor(context, states),
    );

    return SizedBox(
      height: 61,
      width: widget.width,
      child: ElevatedButton(
        focusNode: widget.focusNode ?? _focusNode,
        autofocus: false,
        statesController: _statesController,
        style: widget.textOnly
            ? Theme.of(context).elevatedButtonTheme.style?.copyWith(
                  side: WidgetStateProperty.all(
                    BorderSide(
                      width: 5,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      color: color.resolve(_statesController.value),
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.all(Colors.transparent),
                  foregroundColor: WidgetStateProperty.resolveWith((states) {
                    if (states.contains(WidgetState.disabled)) {
                      return ColorManager().getColorTextDisabledAlternative();
                    }
                    return ColorManager().getColorBackgroundPrimaryCta();
                  }),
                )
            : Theme.of(context).elevatedButtonTheme.style?.copyWith(
                  side: WidgetStateProperty.all(
                    BorderSide(
                      width: 5,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      color: color.resolve(_statesController.value),
                    ),
                  ),
                ),
        onPressed: widget.onPressed,
        child: Text(widget.title),
      ),
    );
  }

  Color getBorderColor(BuildContext context, Set<WidgetState> states) {
    //  print('states: ${states}');

    const focusedStates = <WidgetState>{
      WidgetState.focused,
    };

    if (states.any(focusedStates.contains)) {
      return Colors.white;
    }
    return Colors.transparent;
  }

  // ButtonStyle _buttonStyle(BuildContext context) {
  //   return ButtonStyle(
  //     animationDuration: const Duration(milliseconds: 400),
  //     elevation: WidgetStateProperty.all(0),
  //     backgroundColor: WidgetStateProperty.resolveWith((states) {
  //       return getColor(context, states);
  //     }),
  //     padding: WidgetStateProperty.all<EdgeInsets>(
  //       widget.padding ??
  //           (isIconButton ? EdgeInsets.zero : widget.size.padding),
  //     ),
  //     shape: WidgetStateProperty.all<RoundedRectangleBorder>(
  //       RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(
  //           widget.borderRadius ??
  //               (isIconButton
  //                   ? widget.size.iconButtonRadius
  //                   : widget.size.radius),
  //         ),
  //       ),
  //     ),
  //     side: (widget.hasBorder ?? (widget.borderWidth ?? 0) > 0
  //         ? WidgetStateProperty.all(_borderSide(context))
  //         : null),
  //     //foregroundColor: WidgetStateProperty.all<Color>(textColor),
  //     overlayColor: WidgetStateProperty.all<Color>(Colors.transparent),
  //   );
  // }
}
