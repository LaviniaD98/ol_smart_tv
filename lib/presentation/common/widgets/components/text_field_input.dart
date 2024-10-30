import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/text_input_screen.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:reactive_forms/reactive_forms.dart';

class TextFieldInput extends StatefulWidget {
  const TextFieldInput({
    required this.form,
    required this.controlName,
    required this.order,
    required this.headerTitle,
    this.autofocus = false,
    this.isObscured = false,
    this.focusNode,
    this.onChanged,
    super.key,
  });

  final bool autofocus;
  final bool isObscured;
  final int order;
  final FormGroup form;
  final String controlName;
  final String headerTitle;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;

  @override
  State<TextFieldInput> createState() => _TextFieldInputState();
}

class _TextFieldInputState extends State<TextFieldInput>
    with AutomaticKeepAliveClientMixin {
  late FocusNode focusNode;

  StreamSubscription? _valueSubscription;

  @override
  void initState() {
    super.initState();

    focusNode = widget.focusNode ?? FocusNode();

    if (widget.autofocus) {
      Future.delayed(const Duration(milliseconds: 300), () {
        focusNode.requestFocus();
      });
    }

    _valueSubscription = widget.form
        .findControl(widget.controlName)
        ?.valueChanges
        .listen((event) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      focusNode.dispose();
    }
    _valueSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FocusableActionDetector(
      focusNode: focusNode,
      //autofocus: widget.autofocus,
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.goBack): const BackIntent(),
        LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
        LogicalKeySet(LogicalKeyboardKey.enter): const ActivateIntent(),
      },
      actions: <Type, Action<Intent>>{
        ActivateIntent: CallbackAction<ActivateIntent>(
          onInvoke: (ActivateIntent intent) async {
            final res = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TextInputScreen(
                  onChanged: widget.onChanged,
                  isObscured: widget.isObscured,
                  initialValue: widget.form.control(widget.controlName).value,
                ),
              ),
            ) as String?;

            if (res != null) {
              widget.form.control(widget.controlName).value = res;
            }
            return null;
          },
        ),
        BackIntent: BackAction(context: context),
      },
      onFocusChange: (value) {
        setState(() {});
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.headerTitle,
            textAlign: TextAlign.start,
            style: AppTextTheme.headerTitle(),
          ),
          const SizedBox(height: Dimens.spacingXXS),
          SizedBox(
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Builder(builder: (context) {
                            final text = widget.form
                                    .control(widget.controlName)
                                    .value as String? ??
                                '';
                            return Text(
                              widget.isObscured
                                  ? text.replaceAll(RegExp(r'.'), '*')
                                  : text,
                              style: AppTextTheme.body(),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class MyIntent extends Intent {
  const MyIntent();
}

class MyAction extends Action<MyIntent> {
  MyAction({required this.focusNode});
  final FocusNode focusNode;
  @override
  Object? invoke(MyIntent intent) {
    focusNode.unfocus();
    return null;
  }
}

class BackIntent extends Intent {
  const BackIntent();
}

class BackAction extends Action<BackIntent> {
  BackAction({required this.context});
  final BuildContext context;
  @override
  Object? invoke(BackIntent intent) {
    if (kDebugMode) {
      print('BackAction invoked');
    }

    //Navigator.of(context).pop();
    return null;
  }
}
