import 'package:flutter/material.dart';

class WidgetFocusCard extends StatefulWidget {
  final void Function(bool)? onFocusChange;
  final int index;

  const WidgetFocusCard({
    super.key,
    required this.index,
    this.onFocusChange,
  });

  @override
  State<WidgetFocusCard> createState() => _WidgetFocusCardState();
}

class _WidgetFocusCardState extends State<WidgetFocusCard> {
  late FocusScopeNode focusNode;

  @override
  void initState() {
    super.initState();

    focusNode = FocusScopeNode(debugLabel: '${widget.index}:2');
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
        height: 100,
        color: focusNode.hasFocus ? Colors.red : Colors.blue,
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
      ),
    );
  }
}
