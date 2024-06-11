import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;

import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_text_field.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveTextFieldInput<T> extends ReactiveFormField<T, String> {
  static Widget _defaultContextMenuBuilder(
      BuildContext context, EditableTextState editableTextState) {
    return AdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState,
    );
  }

  final TextEditingController? _textController;
  ReactiveTextFieldInput({
    super.key,
    super.formControlName,
    super.formControl,
    super.validationMessages,
    super.valueAccessor,
    super.showErrors,
    super.focusNode,
    InputDecoration decoration = const InputDecoration(),
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    TextAlign textAlign = TextAlign.start,
    TextAlignVertical? textAlignVertical,
    bool autofocus = false,
    bool readOnly = false,
    EditableTextContextMenuBuilder? contextMenuBuilder =
        _defaultContextMenuBuilder,
    bool? showCursor,
    bool obscureText = false,
    String obscuringCharacter = '•',
    bool autocorrect = true,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    bool enableSuggestions = true,
    MaxLengthEnforcement? maxLengthEnforcement,
    int? maxLines = 1,
    int? minLines,
    bool expands = false,
    int? maxLength,
    List<TextInputFormatter>? inputFormatters,
    double cursorWidth = 2.0,
    double? cursorHeight,
    Radius? cursorRadius,
    Color? cursorColor,
    Brightness? keyboardAppearance,
    EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
    bool enableInteractiveSelection = true,
    InputCounterWidgetBuilder? buildCounter,
    ScrollPhysics? scrollPhysics,
    Iterable<String>? autofillHints,
    MouseCursor? mouseCursor,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    AppPrivateCommandCallback? onAppPrivateCommand,
    String? restorationId,
    ScrollController? scrollController,
    TextSelectionControls? selectionControls,
    ui.BoxHeightStyle selectionHeightStyle = ui.BoxHeightStyle.tight,
    ui.BoxWidthStyle selectionWidthStyle = ui.BoxWidthStyle.tight,
    TextEditingController? controller,
    Clip clipBehavior = Clip.hardEdge,
    bool enableIMEPersonalizedLearning = true,
    bool scribbleEnabled = true,
    ReactiveFormFieldCallback<T>? onTap,
    ReactiveFormFieldCallback<T>? onEditingComplete,
    ReactiveFormFieldCallback<T>? onSubmitted,
    ReactiveFormFieldCallback<T>? onChanged,
    UndoHistoryController? undoController,
    bool? cursorOpacityAnimates,
    TapRegionCallback? onTapOutside,
    ContentInsertionConfiguration? contentInsertionConfiguration,
    bool canRequestFocus = true,
    SpellCheckConfiguration? spellCheckConfiguration,
    TextMagnifierConfiguration? magnifierConfiguration,
  })  : _textController = controller,
        super(
          builder: (ReactiveFormFieldState<T, String> field) {
            final state = field as _ReactiveTextFieldState<T>;
            final effectiveDecoration = decoration
                .applyDefaults(Theme.of(state.context).inputDecorationTheme);

            state.obscureText ??= obscureText;

            return OlTextField(
              controller: state._textController,
              focusNode: focusNode,
              decoration: effectiveDecoration.copyWith(
                errorText: state.errorText,
                suffixIcon: _buildSuffixIcon(state, obscureText),
              ),
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              style: style,
              strutStyle: strutStyle,
              textAlign: textAlign,
              textAlignVertical: textAlignVertical,
              textDirection: textDirection,
              textCapitalization: textCapitalization,
              autofocus: autofocus,
              contextMenuBuilder: contextMenuBuilder,
              readOnly: readOnly,
              showCursor: showCursor,
              obscureText: state.obscureText ?? obscureText,
              autocorrect: autocorrect,
              smartDashesType: smartDashesType ??
                  (obscureText
                      ? SmartDashesType.enabled
                      : SmartDashesType.disabled),
              smartQuotesType: smartQuotesType ??
                  (obscureText
                      ? SmartQuotesType.enabled
                      : SmartQuotesType.disabled),
              enableSuggestions: enableSuggestions,
              maxLengthEnforcement: maxLengthEnforcement,
              maxLines: maxLines,
              minLines: minLines,
              expands: expands,
              maxLength: maxLength,
              inputFormatters: inputFormatters,
              enabled: field.control.enabled,
              cursorWidth: cursorWidth,
              cursorHeight: cursorHeight,
              cursorRadius: cursorRadius,
              cursorColor: cursorColor ?? ColorManager().getColorTextPrimary(),
              scrollPadding: scrollPadding,
              scrollPhysics: scrollPhysics,
              keyboardAppearance: keyboardAppearance,
              enableInteractiveSelection: enableInteractiveSelection,
              buildCounter: buildCounter,
              autofillHints: autofillHints,
              mouseCursor: mouseCursor,
              obscuringCharacter: obscuringCharacter,
              dragStartBehavior: dragStartBehavior,
              onAppPrivateCommand: onAppPrivateCommand,
              restorationId: restorationId,
              scrollController: scrollController,
              selectionControls: selectionControls,
              selectionHeightStyle: selectionHeightStyle,
              selectionWidthStyle: selectionWidthStyle,
              clipBehavior: clipBehavior,
              enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
              scribbleEnabled: scribbleEnabled,
              onTap: onTap != null ? () => onTap(field.control) : null,
              onSubmitted: onSubmitted != null
                  ? (_) => onSubmitted(field.control)
                  : null,
              onEditingComplete: onEditingComplete != null
                  ? () => onEditingComplete.call(field.control)
                  : null,
              onChanged: (value) {
                field.didChange(value);
                onChanged?.call(field.control);
              },
              undoController: undoController,
              cursorOpacityAnimates: cursorOpacityAnimates,
              onTapOutside: onTapOutside,
              contentInsertionConfiguration: contentInsertionConfiguration,
              canRequestFocus: canRequestFocus,
              spellCheckConfiguration: spellCheckConfiguration,
              magnifierConfiguration: magnifierConfiguration,
            );
          },
        );

  static Widget? _buildSuffixIcon(
      _ReactiveTextFieldState state, bool obscureText) {
    if (obscureText) {
      final iconName = state.obscureText != false ? 'eye_off' : 'eye';
      return IconButton(
        icon: SvgPicture.asset('assets/icons/$iconName.svg',
            colorFilter: ColorFilter.mode(
              ColorManager().getColorBackgroundPrimaryCta(),
              BlendMode.srcIn,
            )),
        onPressed: () => state.toggleObscureText(),
      );
    }
    return null;
  }

  @override
  ReactiveFormFieldState<T, String> createState() =>
      _ReactiveTextFieldState<T>();
}

class _ReactiveTextFieldState<T>
    extends ReactiveFocusableFormFieldState<T, String> {
  late TextEditingController _textController;

  bool get hasError => control.errors.isNotEmpty && control.touched;

  bool? obscureText;

  @override
  void initState() {
    super.initState();
    _initializeTextController();
  }

  void toggleObscureText() {
    if (obscureText != null) {
      setState(() {
        obscureText = !obscureText!;
      });
    }
  }

  @override
  void onControlValueChanged(dynamic value) {
    final effectiveValue = (value == null) ? '' : value.toString();
    _textController.value = _textController.value.copyWith(
      text: effectiveValue,
      selection: TextSelection.collapsed(offset: effectiveValue.length),
      composing: TextRange.empty,
    );

    super.onControlValueChanged(value);
  }

  @override
  ControlValueAccessor<T, String> selectValueAccessor() {
    if (control is FormControl<int>) {
      return IntValueAccessor() as ControlValueAccessor<T, String>;
    } else if (control is FormControl<double>) {
      return DoubleValueAccessor() as ControlValueAccessor<T, String>;
    } else if (control is FormControl<DateTime>) {
      return DateTimeValueAccessor() as ControlValueAccessor<T, String>;
    } else if (control is FormControl<TimeOfDay>) {
      return TimeOfDayValueAccessor() as ControlValueAccessor<T, String>;
    }

    return super.selectValueAccessor();
  }

  void _initializeTextController() {
    final initialValue = value;
    final currentWidget = widget as ReactiveTextFieldInput<T>;
    _textController = (currentWidget._textController != null)
        ? currentWidget._textController!
        : TextEditingController();
    _textController.text = initialValue == null ? '' : initialValue.toString();
  }
}
