import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';

class OLIconButton extends StatefulWidget {
  const OLIconButton({
    required this.image,
    this.focusNode,
    this.onPressed,
    this.width = 264,
    this.iconSize = 30,
    this.radius,
    this.size,
    this.textOnly = false,
    this.outline = false,
    this.isFlexible = false,
    this.id,
    this.onFocusChanded,
    this.iconColor,
    super.key,
  });

  final String image;
  final void Function()? onPressed;
  final FocusNode? focusNode;
  final double? width;
  final double? size;
  final double? radius;
  final double iconSize;
  final bool textOnly;
  final bool outline;
  final bool isFlexible;
  final String? id;
  final void Function(bool)? onFocusChanded;
  final Color? iconColor;

  @override
  State<OLIconButton> createState() => _OLIconButtonState();
}

class _OLIconButtonState extends State<OLIconButton> {
  final _statesController = WidgetStatesController();

  late OlFocusNode _focusNode;

  @override
  void initState() {
    super.initState();

    _focusNode = OlFocusNode(
      id: widget.id ?? 'OLIconButton - ${widget.image}',
    );
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
  void didUpdateWidget(covariant OLIconButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.image != oldWidget.image) {
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
      height: widget.size ?? 61,
      width: widget.size ?? 61,
      child: widget.outline
          ? OutlinedButton(
              focusNode: widget.focusNode ?? _focusNode,
              autofocus: false,
              onFocusChange: widget.onFocusChanded,
              statesController: _statesController,
              style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                    backgroundColor: WidgetStateProperty.all(
                        Colors.black.withValues(alpha: 0.1)),
                    foregroundColor: WidgetStateProperty.all(
                        widget.iconColor ?? OLColors.textPrimary),
                    side: WidgetStateProperty.all(
                      BorderSide(
                        width: borderWidth.resolve(_statesController.value),
                        strokeAlign: BorderSide.strokeAlignOutside,
                        color: color.resolve(_statesController.value),
                      ),
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(widget.radius ?? 3),
                      ),
                    ),
                    padding: WidgetStateProperty.all(EdgeInsets.zero),
                  ),
              onPressed: widget.onPressed,
              child: Center(
                child: SvgPicture.asset(
                  widget.image,
                  height: widget.iconSize,
                  width: widget.iconSize,
                  colorFilter: ColorFilter.mode(
                    widget.iconColor ??
                        ColorManager().getColorBackgroundPrimaryCta(),
                    BlendMode.srcIn,
                  ),
                ),
              ),
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
                        backgroundColor: WidgetStateProperty.all(
                            Colors.black.withValues(alpha: 0.2)),
                        foregroundColor:
                            WidgetStateProperty.resolveWith((states) {
                          if (widget.iconColor != null) {
                            return widget.iconColor!;
                          }
                          if (states.contains(WidgetState.disabled)) {
                            return ColorManager()
                                .getColorTextDisabledAlternative();
                          }
                          return ColorManager().getColorBackgroundPrimaryCta();
                        }),
                        padding: WidgetStateProperty.all(EdgeInsets.zero),
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
                        backgroundColor: WidgetStateProperty.all(
                            Colors.black.withValues(alpha: 0.3)),
                        padding: WidgetStateProperty.all(EdgeInsets.zero),
                      ),
              onPressed: widget.onPressed,
              child: Center(
                child: SvgPicture.asset(
                  widget.image,
                  height: widget.iconSize,
                  width: widget.iconSize,
                  colorFilter: ColorFilter.mode(
                    widget.iconColor ??
                        ColorManager().getColorBackgroundPrimaryCta(),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
    );
  }

  Color getBorderColor(BuildContext context, Set<WidgetState> states) {
    //  print('states: ${states}');

    const focusedStates = <WidgetState>{
      WidgetState.focused,
    };

    if (widget.outline) {
      if (states.any(focusedStates.contains)) {
        return Colors.white;
      } else {
        return Colors.grey;
      }
    }

    if (states.any(focusedStates.contains)) {
      return Colors.white;
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
