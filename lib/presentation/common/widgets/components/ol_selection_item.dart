import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/custom_checkbox.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';

class OlSelectionItem extends StatefulWidget {
  const OlSelectionItem({
    required this.order,
    required this.title,
    this.autofocus = false,
    this.focusNode,
    this.onSelectionChanged,
    this.isSelected = false,
    this.keepSelection = false,
    super.key,
  });

  final bool autofocus;
  final bool isSelected;
  final bool keepSelection;
  final int order;
  final String title;
  final FocusNode? focusNode;
  final void Function(bool)? onSelectionChanged;

  @override
  State<OlSelectionItem> createState() => _OlSelectionItemState();
}

class _OlSelectionItemState extends State<OlSelectionItem>
    with AutomaticKeepAliveClientMixin {
  late FocusNode focusNode;

  bool isSelected = false;

  @override
  void initState() {
    super.initState();

    isSelected = widget.isSelected;

    focusNode = widget.focusNode ?? FocusNode();

    if (widget.autofocus) {
      Future.delayed(const Duration(milliseconds: 300), () {
        focusNode.requestFocus();
      });
    }
  }

  @override
  void didUpdateWidget(covariant OlSelectionItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected != oldWidget.isSelected) {
      isSelected = widget.isSelected;
      setState(() {});
    }
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return FocusTraversalOrder(
      order: NumericFocusOrder(widget.order.toDouble()),
      child: FocusableActionDetector(
        focusNode: focusNode,
        //autofocus: widget.autofocus,
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.enter): const ActivateIntent(),
        },
        actions: <Type, Action<Intent>>{
          ActivateIntent: CallbackAction<ActivateIntent>(
            onInvoke: (ActivateIntent intent) async {
              if (widget.keepSelection && isSelected) {
                return null;
              }
              isSelected = !isSelected;
              widget.onSelectionChanged?.call(isSelected);
              setState(() {});
              return null;
            },
          ),
        },
        onFocusChange: (value) {
          setState(() {});
        },
        child: SizedBox(
          height: 57,
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: focusNode.hasFocus ? 3 : 1,
                      strokeAlign: BorderSide.strokeAlignInside,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ExcludeFocus(
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: CustomCheckbox(
                            order: 1,
                            isRounded: true,
                            keepSelection: widget.keepSelection,
                            isSelected: isSelected,
                            onChanged: (_) {},
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          widget.title,
                          style: AppTextTheme.body(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
