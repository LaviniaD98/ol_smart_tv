import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;

class OlTextField extends StatefulWidget {
  const OlTextField({
    required this.controller,
    super.key,
    this.keyboardType,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textDirection,
    this.textAlignVertical,
    this.contextMenuBuilder,
    this.showCursor,
    this.smartDashesType,
    this.smartQuotesType,
    this.maxLengthEnforcement,
    this.minLines,
    this.maxLength,
    this.inputFormatters,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.buildCounter,
    this.scrollPhysics,
    this.autofillHints,
    this.mouseCursor,
    this.onAppPrivateCommand,
    this.restorationId,
    this.scrollController,
    this.selectionControls,
    this.onTap,
    this.onEditingComplete,
    this.onSubmitted,
    this.onChanged,
    this.undoController,
    this.cursorOpacityAnimates,
    this.onTapOutside,
    this.contentInsertionConfiguration,
    this.spellCheckConfiguration,
    this.magnifierConfiguration,
    this.enabled = true,
    this.textCapitalization = TextCapitalization.none,
    this.decoration = const InputDecoration(),
    this.textAlign = TextAlign.start,
    this.autofocus = false,
    this.readOnly = false,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.expands = false,
    this.cursorWidth = 2.0,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableInteractiveSelection = true,
    this.clipBehavior = Clip.hardEdge,
    this.enableIMEPersonalizedLearning = true,
    this.scribbleEnabled = true,
    this.canRequestFocus = true,
    this.dragStartBehavior = DragStartBehavior.start,
    this.selectionHeightStyle = ui.BoxHeightStyle.tight,
    this.selectionWidthStyle = ui.BoxWidthStyle.tight,
    this.focusNode,
  });

  final TextEditingController? controller;
  final InputDecoration decoration;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus;
  final bool readOnly;
  final bool enabled;
  final EditableTextContextMenuBuilder? contextMenuBuilder;
  final bool? showCursor;
  final bool obscureText;
  final String obscuringCharacter;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool enableInteractiveSelection;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final MouseCursor? mouseCursor;
  final DragStartBehavior dragStartBehavior;
  final AppPrivateCommandCallback? onAppPrivateCommand;
  final String? restorationId;
  final ScrollController? scrollController;
  final TextSelectionControls? selectionControls;
  final ui.BoxHeightStyle selectionHeightStyle;
  final ui.BoxWidthStyle selectionWidthStyle;
  final Clip clipBehavior;
  final bool enableIMEPersonalizedLearning;
  final bool scribbleEnabled;
  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final UndoHistoryController? undoController;
  final bool? cursorOpacityAnimates;
  final TapRegionCallback? onTapOutside;
  final ContentInsertionConfiguration? contentInsertionConfiguration;
  final bool canRequestFocus;
  final SpellCheckConfiguration? spellCheckConfiguration;
  final TextMagnifierConfiguration? magnifierConfiguration;
  final FocusNode? focusNode;

  @override
  State<OlTextField> createState() => _OlTextFieldState();
}

class _OlTextFieldState extends State<OlTextField> {
  late FocusNode focusNode;
  final FocusNode tfFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    focusNode = widget.focusNode ?? FocusNode();

    focusNode.addListener(updateFocus);
    tfFocusNode.addListener(updateTfFocus);
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      focusNode.dispose();
    }
    tfFocusNode.dispose();
    super.dispose();
  }

  void updateTfFocus() {
    if (context.mounted) {
      setState(() {});
    }
  }

  void updateFocus() {
    if (context.mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return

        /*FocusableActionDetector(
      focusNode: focusNode,
      autofocus: widget.autofocus,

      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
        LogicalKeySet(LogicalKeyboardKey.enter): const ActivateIntent(),
      },
      actions: <Type, Action<Intent>>{
        ActivateIntent: CallbackAction<ActivateIntent>(
          onInvoke: (ActivateIntent intent) {
            print('ActivateIntent');
            tfFocusNode.requestFocus();
            return null;
          },
        ),
        DismissIntent: CallbackAction<DismissIntent>(
          onInvoke: (DismissIntent intent) {
            print('DismissIntent');
            //tfFocusNode.requestFocus();
            return null;
          },
        ),
      },
      onFocusChange: (value) {
        print('onFocusChange: $value');
      },
      //descendantsAreTraversable: false,
      // onKeyEvent: (node, event) {
      //   // print('event.logicalKey.keyLabel: ${event.logicalKey.keyLabel}');
      //   // if (event.logicalKey == LogicalKeyboardKey.enter ||
      //   //     event.logicalKey == LogicalKeyboardKey.select) {
      //   //   print('hey............');

      //   //   // tfFocusNode.unfocus();
      //   //   tfFocusNode.requestFocus();
      //   //   return KeyEventResult.handled;
      //   // }
      //   // tfFocusNode.unfocus();
      //   // focusNode.requestFocus();
      //   return KeyEventResult.ignored;
      // },
      child: Container(
        color: focusNode.hasFocus ? Colors.red : Colors.transparent,
        child:*/
        TextField(
      controller: widget.controller,
      focusNode: tfFocusNode,
      decoration: widget.decoration,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      style: widget.style,
      strutStyle: widget.strutStyle,
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical,
      textDirection: widget.textDirection,
      textCapitalization: widget.textCapitalization,
      autofocus: widget.autofocus,
      contextMenuBuilder: widget.contextMenuBuilder,
      readOnly: widget.readOnly,
      showCursor: widget.showCursor,
      obscureText: widget.obscureText,
      autocorrect: widget.autocorrect,
      smartDashesType: widget.smartDashesType,
      smartQuotesType: widget.smartQuotesType,
      enableSuggestions: widget.enableSuggestions,
      maxLengthEnforcement: widget.maxLengthEnforcement,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      expands: widget.expands,
      maxLength: widget.maxLength,
      inputFormatters: widget.inputFormatters,
      enabled: widget.enabled,
      cursorWidth: widget.cursorWidth,
      cursorHeight: widget.cursorHeight,
      cursorRadius: widget.cursorRadius,
      cursorColor: widget.cursorColor,
      scrollPadding: widget.scrollPadding,
      scrollPhysics: widget.scrollPhysics,
      keyboardAppearance: widget.keyboardAppearance,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      buildCounter: widget.buildCounter,
      autofillHints: widget.autofillHints,
      mouseCursor: widget.mouseCursor,
      obscuringCharacter: widget.obscuringCharacter,
      dragStartBehavior: widget.dragStartBehavior,
      onAppPrivateCommand: widget.onAppPrivateCommand,
      restorationId: widget.restorationId,
      scrollController: widget.scrollController,
      selectionControls: widget.selectionControls,
      selectionHeightStyle: widget.selectionHeightStyle,
      selectionWidthStyle: widget.selectionWidthStyle,
      clipBehavior: widget.clipBehavior,
      enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
      scribbleEnabled: widget.scribbleEnabled,
      onTap: widget.onTap,
      onSubmitted: (val) {
        tfFocusNode.unfocus();
        focusNode.requestFocus();

        widget.onSubmitted?.call(val);
      },
      onEditingComplete: widget.onEditingComplete,
      onChanged: widget.onChanged,
      undoController: widget.undoController,
      cursorOpacityAnimates: widget.cursorOpacityAnimates,
      onTapOutside: (_) {},
      contentInsertionConfiguration: widget.contentInsertionConfiguration,
      canRequestFocus: widget.canRequestFocus,
      spellCheckConfiguration: widget.spellCheckConfiguration,
      magnifierConfiguration: widget.magnifierConfiguration,
      //  ),
      //  ),
    );
  }
}
