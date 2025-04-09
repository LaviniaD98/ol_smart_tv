import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';

class OLButton extends StatefulWidget {
  const OLButton({
    required this.title,
    this.focusNode,
    this.onPressed,
    this.width = 264,
    this.textOnly = false,
    this.outline = false,
    this.isFlexible = false,
    this.id,
    this.onFocusChanded,
    this.backgroundColor,
    this.foregroundColor,
    this.icon,
    this.image,
    this.radius,
    this.autoFocus = false,
    super.key,
  });

  final String title;
  final void Function()? onPressed;
  final FocusNode? focusNode;
  final double? width;
  final bool textOnly;
  final bool autoFocus;
  final bool outline;
  final bool isFlexible;
  final String? id;
  final void Function(bool)? onFocusChanded;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconData? icon;
  final String? image;
  final double? radius;

  @override
  State<OLButton> createState() => _OLButtonState();
}

class _OLButtonState extends State<OLButton> {
  final _statesController = WidgetStatesController();

  late OlFocusNode _focusNode;

  @override
  void initState() {
    super.initState();

    _focusNode = OlFocusNode(
      id: widget.id ?? 'OLButton - ${widget.title}',
    );

    if (widget.autoFocus) {
      Future.delayed(const Duration(milliseconds: 300), () {
        _focusNode.requestFocus();
      });
    }
    _statesController.addListener(updateStates);
  }

  @override
  void dispose() {
    _statesController
      ..removeListener(updateStates)
      ..dispose();

    _focusNode.dispose();
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

    final borderWidth = WidgetStateProperty.resolveWith(
      (states) => getBorderWidth(context, states),
    );

    return SizedBox(
      height: 61,
      width: widget.isFlexible ? null : widget.width,
      child: widget.outline
          ? OutlinedButton(
              focusNode: widget.focusNode ?? _focusNode,
              autofocus: false,
              onFocusChange: widget.onFocusChanded,
              statesController: _statesController,
              style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                    backgroundColor: WidgetStateProperty.all(
                      widget.backgroundColor ?? Colors.transparent,
                    ),
                    foregroundColor: WidgetStateProperty.all(
                      widget.foregroundColor ?? OLColors.textPrimary,
                    ),
                    side: WidgetStateProperty.all(
                      BorderSide(
                        width: borderWidth.resolve(_statesController.value),
                        strokeAlign: BorderSide.strokeAlignOutside,
                        color: color.resolve(_statesController.value),
                      ),
                    ),
                  ),
              onPressed: widget.onPressed,
              child: buildButtonBody(context),
            )
          : ElevatedButton(
              focusNode: widget.focusNode ?? _focusNode,
              autofocus: false,
              onFocusChange: widget.onFocusChanded,
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
                        backgroundColor:
                            WidgetStateProperty.all(Colors.transparent),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(widget.radius ?? 3),
                          ),
                        ),
                        foregroundColor:
                            WidgetStateProperty.resolveWith((states) {
                          if (states.contains(WidgetState.disabled)) {
                            return ColorManager()
                                .getColorTextDisabledAlternative();
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
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(widget.radius ?? 3),
                          ),
                        ),
                      ),
              onPressed: widget.onPressed,
              child: buildButtonBody(context),
            ),
    );
  }

  Widget buildButtonBody(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.title.isNotEmpty) ...[
          Expanded(
            child: AutoSizeText(
              widget.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .elevatedButtonTheme
                  .style
                  ?.textStyle
                  ?.resolve({}),
              textAlign: TextAlign.center,
              minFontSize: 9,
            ),
          ),
        ],
        if (widget.image != null && widget.image?.isNotEmpty == true) ...[
          SvgPicture.asset(widget.image!),
        ],
        if (widget.icon != null) ...[
          Icon(widget.icon, size: 30),
        ],
      ],
    );
  }

  Color getBorderColor(BuildContext context, Set<WidgetState> states) {
    //  print('states: ${states}');

    const focusedStates = <WidgetState>{
      WidgetState.focused,
    };

    if (states.any(focusedStates.contains)) {
      if (widget.outline) {
        return Colors.white;
      }
      return Colors.white;
    }
    if (widget.outline) {
      return widget.backgroundColor ?? Colors.white;
    }
    return Colors.transparent;
  }

  double getBorderWidth(BuildContext context, Set<WidgetState> states) {
    //  print('states: ${states}');

    const focusedStates = <WidgetState>{
      WidgetState.focused,
    };

    if (states.any(focusedStates.contains)) {
      return 5;
    }
    return 2;
  }
}
