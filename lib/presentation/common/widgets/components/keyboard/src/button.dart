import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/keyboard/src/button_widget.dart';

class Button extends StatefulWidget {
  const Button({
    super.key,
    required this.label,
    this.onPressed,
    this.autofocus,
    this.borderColor,
    this.focusColor,
    this.buttonColor,
    this.width,
    this.height,
  });

  final Function? onPressed;
  final Widget label;
  final Color? borderColor;
  final Color? buttonColor;
  final Color? focusColor;
  final bool? autofocus;
  final double? width;
  final double? height;

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  FocusNode? _node;

  @override
  void initState() {
    _node = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      margin: const EdgeInsets.all(2),
      child: RawMaterialButton(
        highlightElevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        autofocus: widget.autofocus ?? widget.autofocus!,
        fillColor: widget.buttonColor ?? widget.buttonColor,
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 0,
        focusColor: widget.focusColor ?? widget.focusColor,
        focusNode: _node,
        onPressed: () {
          widget.onPressed!();
        },
        child: ButtonWidget(
          label: widget.label,
        ),
      ),
    );
  }
}
