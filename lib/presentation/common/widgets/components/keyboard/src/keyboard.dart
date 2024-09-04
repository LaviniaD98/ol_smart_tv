import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  });
  @override
  _OnscreenKeyboardWidgetState createState() => _OnscreenKeyboardWidgetState();
}

class _OnscreenKeyboardWidgetState extends State<OnscreenKeyboardWidget> {
  String? text = '';

  FocusScopeNode focusNode = FocusScopeNode(debugLabel: '-KEYBOARD-');
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
          print('KEYBOARD----------LogicalKeyboardKey.arrowRight - $focus');
          if (focus == false) {
            widget.onFocusOutside?.call(TraversalDirection.right);
          }
        },
        const SingleActivator(LogicalKeyboardKey.arrowLeft): () {
          final focus = focusNode.focusInDirection(TraversalDirection.left);
          print('KEYBOARD----------LogicalKeyboardKey.arrowLeft - $focus');
          if (focus == false) {
            widget.onFocusOutside?.call(TraversalDirection.left);
          }
        },
        const SingleActivator(LogicalKeyboardKey.arrowUp): () {
          final focus = focusNode.focusInDirection(TraversalDirection.up);
          print('KEYBOARD----------LogicalKeyboardKey.arrowUp - $focus');
          if (focus == false) {
            widget.onFocusOutside?.call(TraversalDirection.up);
          }
        },
        const SingleActivator(LogicalKeyboardKey.arrowDown): () {
          final focus = focusNode.focusInDirection(TraversalDirection.down);
          print('KEYBOARD----------LogicalKeyboardKey.arrowDown - $focus');
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
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
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
                  Container(
                    color: widget.backgroundColor ?? Colors.transparent,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: Button(
                            autofocus: false,
                            focusColor: widget.focusColor ?? widget.focusColor,
                            borderColor:
                                widget.borderColor ?? widget.borderColor,
                            buttonColor:
                                widget.buttonColor ?? widget.buttonColor,
                            onPressed: () {
                              shift();
                            },
                            label: const Icon(Icons.arrow_upward),
                          ),
                        ),
                        Flexible(
                          child: Button(
                            autofocus: false,
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
                            label: const Text(
                              'CLEAR',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Button(
                            autofocus: true,
                            focusColor: widget.focusColor ?? widget.focusColor,
                            borderColor:
                                widget.borderColor ?? widget.borderColor,
                            buttonColor:
                                widget.buttonColor ?? widget.buttonColor,
                            onPressed: () {
                              text = text! + ' ';
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
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Button(
                    autofocus: false,
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
                                fontSize: 17, fontWeight: FontWeight.bold),
                          );
                        } else {
                          return const Text(
                            '&123',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(List<String> labels) {
    //
    return GridView.builder(
        shrinkWrap: true,
        itemCount: labels.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
        ),
        itemBuilder: (context, index) {
          return Button(
            autofocus: false,
            focusColor: widget.focusColor ?? widget.focusColor,
            borderColor: widget.borderColor ?? widget.borderColor,
            buttonColor: widget.buttonColor ?? widget.buttonColor,
            label: Text(
              labels[index],
              style: const TextStyle(fontSize: 25),
            ),
            onPressed: () {
              text = text! + labels[index];
              setState(() {});
              widget.onChanged!(text);
            },
          );
        });
  }
}
