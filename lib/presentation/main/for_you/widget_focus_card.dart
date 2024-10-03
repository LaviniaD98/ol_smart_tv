import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';

class WidgetFocusCard extends StatefulWidget {
  final void Function(bool)? onFocusChange;
  final int index;
  final Widget? Function(bool hasFocus)? child;
  final EdgeInsets? margin;
  final BoxDecoration? decoration;

  const WidgetFocusCard({
    super.key,
    required this.index,
    this.child,
    this.onFocusChange,
    this.margin,
    this.decoration,
  });

  @override
  State<WidgetFocusCard> createState() => _WidgetFocusCardState();
}

class _WidgetFocusCardState extends State<WidgetFocusCard> {
  late FocusScopeNode focusNode;

  @override
  void initState() {
    super.initState();

    focusNode = OlFocusScopeNode(id: 'WidgetFocusCard:${widget.index}:2');
  }

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      node: focusNode,
      onFocusChange: (value) {
        widget.onFocusChange?.call(value);
        setState(() {});
      },
      child: Container(
        decoration: (widget.decoration ?? const BoxDecoration()).copyWith(
          border: Border.all(
            color: focusNode.hasFocus ? Colors.white : Colors.transparent,
            width: 5,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        margin: widget.margin,
        child: widget.child?.call(focusNode.hasFocus),
      ),
    );
  }
}
