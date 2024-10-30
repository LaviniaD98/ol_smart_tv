import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/keyboard/bloc/keyboard_shift/keyboard_shift_bloc.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/keyboard/data/loading.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/keyboard/src/button.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/keyboard/src/utils.dart';

///
///
class OnscreenKeyboard extends StatelessWidget {
  final ValueChanged<String?>? onChanged;
  final String? value;
  final InitialCase initialCase;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? buttonColor;
  final Color? focusColor;
  final void Function(TraversalDirection side)? onFocusOutside;
  final double? vLetterSpacing;
  final double? hLetterSpacing;
  final TextStyle? textStyle;
  final bool isSearch;
  final bool isClearHidden;

  const OnscreenKeyboard({
    super.key,
    this.onChanged,
    this.backgroundColor,
    this.focusColor,
    this.borderColor,
    this.buttonColor,
    this.value,
    this.onFocusOutside,
    required this.initialCase,
    this.vLetterSpacing,
    this.hLetterSpacing,
    this.textStyle,
    this.isSearch = false,
    this.isClearHidden = false,
  });
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<KeyboardShiftBloc>(
          create: (context) => KeyboardShiftBloc(initialCase: initialCase),
        ),
      ],
      child: OnscreenKeyboardWidget(
        onChanged: onChanged,
        initialCase: initialCase,
        value: value,
        borderColor: borderColor,
        backgroundColor: backgroundColor,
        buttonColor: buttonColor,
        focusColor: focusColor,
        onFocusOutside: onFocusOutside,
        vLetterSpacing: vLetterSpacing,
        hLetterSpacing: hLetterSpacing,
        textStyle: textStyle,
        isSearch: isSearch,
        isClearHidden: isClearHidden,
      ),
    );
  }
}

class OnscreenKeyboardWidget extends StatefulWidget {
  final ValueChanged<String?>? onChanged;
  final InitialCase? initialCase;
  final String? value;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? buttonColor;
  final Color? focusColor;
  final void Function(TraversalDirection side)? onFocusOutside;
  final double? vLetterSpacing;
  final double? hLetterSpacing;
  final TextStyle? textStyle;
  final bool isSearch;
  final bool isClearHidden;

  const OnscreenKeyboardWidget({
    super.key,
    this.onChanged,
    this.backgroundColor,
    this.focusColor,
    this.borderColor,
    this.buttonColor,
    this.value,
    this.initialCase,
    this.onFocusOutside,
    this.vLetterSpacing,
    this.hLetterSpacing,
    this.textStyle,
    this.isSearch = false,
    this.isClearHidden = false,
  });
  @override
  _OnscreenKeyboardWidgetState createState() => _OnscreenKeyboardWidgetState();
}

class _OnscreenKeyboardWidgetState extends State<OnscreenKeyboardWidget> {
  String? text = '';

  final focusNode = OlFocusScopeNode(id: '-KEYBOARD-');
  @override
  void initState() {
    super.initState();
    if (widget.value != null) {
      text = widget.value;
    }
  }

  void specialCharacters() {
    final bloc = BlocProvider.of<KeyboardShiftBloc>(context);
    //
    KeyboardShiftState state = bloc.state;
    if (state is KeyboardShiftSymbols) {
      if (bloc.isLastStateUppercase) {
        BlocProvider.of<KeyboardShiftBloc>(context)
            .add(const KeyboardShiftUpperCaseEvent());
      } else {
        BlocProvider.of<KeyboardShiftBloc>(context)
            .add(const KeyboardShiftLowerCaseEvent());
      }
    } else {
      BlocProvider.of<KeyboardShiftBloc>(context)
          .add(const KeyboardShiftSymbolsEvent());
    }
  }

  void shift() {
    KeyboardShiftState state =
        BlocProvider.of<KeyboardShiftBloc>(context).state;
    if (state is KeyboardShiftUpperCase) {
      BlocProvider.of<KeyboardShiftBloc>(context)
          .add(const KeyboardShiftLowerCaseEvent());
    } else if (state is KeyboardShiftLowerCase) {
      BlocProvider.of<KeyboardShiftBloc>(context)
          .add(const KeyboardShiftUpperCaseEvent());
    }
  }

  @override
  void didUpdateWidget(covariant OnscreenKeyboardWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value) {
      text = widget.value;
      setState(() {});
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    switch (widget.initialCase) {
      case InitialCase.UPER_CASE:
        BlocProvider.of<KeyboardShiftBloc>(context)
            .add(const KeyboardShiftUpperCaseEvent());
        break;
      case InitialCase.LOWER_CASE:
        BlocProvider.of<KeyboardShiftBloc>(context)
            .add(const KeyboardShiftLowerCaseEvent());
        break;
      case InitialCase.SENTENSE_CASE:
        BlocProvider.of<KeyboardShiftBloc>(context)
            .add(const KeyboardShiftUpperCaseEvent());
        break;
      case InitialCase.NUMERIC:
        BlocProvider.of<KeyboardShiftBloc>(context)
            .add(const KeyboardShiftSymbolsEvent());
        break;

      default:
        BlocProvider.of<KeyboardShiftBloc>(context)
            .add(const KeyboardShiftUpperCaseEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: <ShortcutActivator, VoidCallback>{
        const SingleActivator(LogicalKeyboardKey.arrowRight): () {
          final focus = focusNode.focusInDirection(TraversalDirection.right);
          if (focus == false) {
            widget.onFocusOutside?.call(TraversalDirection.right);
          }
        },
        const SingleActivator(LogicalKeyboardKey.arrowLeft): () {
          final focus = focusNode.focusInDirection(TraversalDirection.left);
          if (focus == false) {
            widget.onFocusOutside?.call(TraversalDirection.left);
          }
        },
        const SingleActivator(LogicalKeyboardKey.arrowUp): () {
          final focus = focusNode.focusInDirection(TraversalDirection.up);
          if (focus == false) {
            widget.onFocusOutside?.call(TraversalDirection.up);
          }
        },
        const SingleActivator(LogicalKeyboardKey.arrowDown): () {
          final focus = focusNode.focusInDirection(TraversalDirection.down);
          if (focus == false) {
            widget.onFocusOutside?.call(TraversalDirection.down);
          }
        },
      },
      child: FocusScope(
        node: focusNode,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!widget.isSearch) ...[
              SizedBox(
                width: 100,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 76),
                    Button(
                      autofocus: false,
                      height: 60,
                      focusColor: widget.focusColor ?? widget.focusColor,
                      borderColor: widget.borderColor ?? widget.borderColor,
                      buttonColor: widget.buttonColor ?? widget.buttonColor,
                      onPressed: () {
                        shift();
                      },
                      label: const Icon(Icons.arrow_upward),
                    ),
                    const SizedBox(height: 4),
                    Button(
                      autofocus: false,
                      focusColor: widget.focusColor ?? widget.focusColor,
                      borderColor: widget.borderColor ?? widget.borderColor,
                      buttonColor: widget.buttonColor ?? widget.buttonColor,
                      onPressed: () {
                        specialCharacters();
                      },
                      label: BlocBuilder<KeyboardShiftBloc, KeyboardShiftState>(
                        builder: (context, state) {
                          if (state is KeyboardShiftSymbols) {
                            return const Text(
                              'ABC',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            );
                          } else {
                            return const Text(
                              '&123',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (!widget.isSearch) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Button(
                          autofocus: false,
                          height: 60,
                          focusColor: widget.focusColor ?? widget.focusColor,
                          borderColor: widget.borderColor ?? widget.borderColor,
                          buttonColor: widget.buttonColor ?? widget.buttonColor,
                          onPressed: () {
                            if (text!.isNotEmpty) {
                              text = text!.substring(0, text!.length - 1);
                            }
                            setState(() {});
                            widget.onChanged!(text);
                          },
                          label: const Icon(
                            Icons.backspace,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        if (!widget.isClearHidden) ...[
                          Button(
                            autofocus: false,
                            height: 60,
                            focusColor: widget.focusColor ?? widget.focusColor,
                            borderColor:
                                widget.borderColor ?? widget.borderColor,
                            buttonColor:
                                widget.buttonColor ?? widget.buttonColor,
                            onPressed: () {
                              text = '';
                              setState(() {});
                              widget.onChanged!(text);
                            },
                            label: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              child: Text(
                                'CLEAR',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 12),
                  ],
                  Flexible(
                    child: Container(
                      color: widget.backgroundColor ?? Colors.transparent,
                      child: BlocBuilder<KeyboardShiftBloc, KeyboardShiftState>(
                          builder: (context, state) {
                        //
                        if (state is KeyboardShiftLowerCase) {
                          return _buildBody(state.lowerCase);
                        } else if (state is KeyboardShiftUpperCase) {
                          return _buildBody(state.upperCase);
                        } else if (state is KeyboardShiftLoading) {
                          return _buildBody(state.loading);
                        } else if (state is KeyboardShiftSymbols) {
                          return _buildBody(state.symbols);
                        } else {
                          return _buildBody(loading);
                        }
                      }),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    color: widget.backgroundColor ?? Colors.transparent,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 3,
                          child: Button(
                            autofocus: true,
                            focusColor: widget.focusColor ?? widget.focusColor,
                            borderColor:
                                widget.borderColor ?? widget.borderColor,
                            buttonColor:
                                widget.buttonColor ?? widget.buttonColor,
                            onPressed: () {
                              text = '${text!} ';
                              setState(() {});
                              widget.onChanged!(text);
                            },
                            label: const Icon(
                              Icons.space_bar,
                              size: 35,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            if (widget.isSearch) ...[
              const SizedBox(width: 8),
              SizedBox(
                width: 120,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Button(
                      autofocus: false,
                      height: 60,
                      focusColor: widget.focusColor ?? widget.focusColor,
                      borderColor: widget.borderColor ?? widget.borderColor,
                      buttonColor: widget.buttonColor ?? widget.buttonColor,
                      onPressed: () {
                        if (text!.isNotEmpty) {
                          text = text!.substring(0, text!.length - 1);
                        }
                        setState(() {});
                        widget.onChanged!(text);
                      },
                      label: const Icon(
                        Icons.backspace,
                        size: 20,
                      ),
                    ),
                    if (!widget.isClearHidden) ...[
                      const SizedBox(height: 4),
                      Button(
                        autofocus: false,
                        height: 60,
                        focusColor: widget.focusColor ?? widget.focusColor,
                        borderColor: widget.borderColor ?? widget.borderColor,
                        buttonColor: widget.buttonColor ?? widget.buttonColor,
                        onPressed: () {
                          text = '';
                          setState(() {});
                          widget.onChanged!(text);
                        },
                        label: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'CLEAR',
                            style: TextStyle(
                                fontSize: 21, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: 4),
                    Button(
                      autofocus: false,
                      height: 60,
                      focusColor: widget.focusColor ?? widget.focusColor,
                      borderColor: widget.borderColor ?? widget.borderColor,
                      buttonColor: widget.buttonColor ?? widget.buttonColor,
                      onPressed: () {
                        shift();
                      },
                      label: const Icon(Icons.arrow_upward),
                    ),
                    const SizedBox(height: 4),
                    Button(
                      height: 60,
                      autofocus: false,
                      focusColor: widget.focusColor ?? widget.focusColor,
                      borderColor: widget.borderColor ?? widget.borderColor,
                      buttonColor: widget.buttonColor ?? widget.buttonColor,
                      onPressed: () {
                        specialCharacters();
                      },
                      label: BlocBuilder<KeyboardShiftBloc, KeyboardShiftState>(
                        builder: (context, state) {
                          if (state is KeyboardShiftSymbols) {
                            return const Text(
                              'ABC',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            );
                          } else {
                            return const Text(
                              '&123',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildBody(List<String> labels) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: labels.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 8,
        childAspectRatio: 0.9,
        crossAxisSpacing: widget.hLetterSpacing ?? 0,
        mainAxisSpacing: widget.vLetterSpacing ?? 0,
      ),
      itemBuilder: (context, index) {
        return Button(
          autofocus: false,
          focusColor: widget.focusColor ?? widget.focusColor,
          borderColor: widget.borderColor ?? widget.borderColor,
          buttonColor: widget.buttonColor ?? widget.buttonColor,
          label: Text(
            labels[index],
            style: widget.textStyle ?? const TextStyle(fontSize: 25),
          ),
          onPressed: () {
            text = text! + labels[index];
            setState(() {});
            widget.onChanged!(text);
          },
        );
      },
    );
  }
}
