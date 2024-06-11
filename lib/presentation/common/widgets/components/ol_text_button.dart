import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';

class OLTextButton extends StatefulWidget {
  const OLTextButton({
    required this.title,
    this.focusNode,
    this.onPressed,
    this.width = 264,
    super.key,
  });

  final String title;
  final void Function()? onPressed;
  final FocusNode? focusNode;
  final double? width;

  @override
  State<OLTextButton> createState() => _OLTextButtonState();
}

class _OLTextButtonState extends State<OLTextButton> {
  final _statesController = WidgetStatesController();

  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();

    _focusNode = widget.focusNode ?? FocusNode();

    _statesController.addListener(updateStates);
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
  void didUpdateWidget(covariant OLTextButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.title != oldWidget.title) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusNode: widget.focusNode ?? _focusNode,
      onFocusChange: (value) {
        setState(() {});
      },
      onTap: widget.onPressed,
      child: Text(
        widget.title,
        textAlign: TextAlign.center,
        style: AppTextTheme.caption(
          color: ColorManager().getColorTextPrimaryCta(),
        ).copyWith(
          height: 2,
          shadows: [
            Shadow(
              color: ColorManager().getColorTextPrimaryCta(),
              offset: const Offset(0, -5),
            )
          ],
          decorationColor: ColorManager().getColorTextPrimaryCta(),
          decorationThickness: 2,
          color: Colors.transparent,
          decoration: _focusNode.hasFocus
              ? TextDecoration.underline
              : TextDecoration.none,
        ),
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
