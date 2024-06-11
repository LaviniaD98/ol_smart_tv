import 'package:flutter/material.dart';
import 'package:onscreen_keyboard/onscreen_keyboard.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_button.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';

class TextInputScreen extends StatefulWidget {
  const TextInputScreen({super.key, this.onChanged});

  final void Function(String)? onChanged;

  @override
  State<TextInputScreen> createState() => _TextInputScreenState();
}

class _TextInputScreenState extends State<TextInputScreen> {
  final textEditingController = TextEditingController();

  final FocusNode focusNode = FocusNode();

  //final OrderedTraversalPolicy _focusNodeOrder = OrderedTraversalPolicy();

  ValueNotifier<String> textNotifier = ValueNotifier<String>('');

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
        /*CallbackShortcuts(
      bindings: <ShortcutActivator, VoidCallback>{
        const SingleActivator(LogicalKeyboardKey.goBack): () {
          print('dclskndlcknslkdnclksndlkcsnlkdcns');
          if (focusNode.hasFocus) {
            focusNode.unfocus();
          } else {
            Navigator.of(context).pop();
          }
        },
      },
      child:*/
        /*FocusableActionDetector(
      focusNode: focusNode,
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.goBack): const MyIntent(),
      },
      actions: <Type, Action<Intent>>{
        MyIntent: MyAction(focusNode: focusNode),
      },
      onFocusChange: (value) {
        print('TextInputScreen onFocusChange: $value');
      },
      child:*/
        Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Row(
              children: [
                OLButton(
                  title: LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.back,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            const SizedBox(height: 100),
            ValueListenableBuilder<String>(
              valueListenable: textNotifier,
              builder: (context, value, _) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        value.isEmpty ? 'Start Typing' : value,
                        textAlign: TextAlign.start,
                        style: AppTextTheme.subtitle().copyWith(
                          color: value.isEmpty
                              ? OLColors.textDisabledAlternative
                              : null,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(
                        color: Colors.white,
                        thickness: 1,
                        height: 1,
                      ),
                    ],
                  ),
                );
              },
            ),
            const Spacer(),
            SizedBox(
              width: 600,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 360,
                    width: 600,
                    child: OnscreenKeyboard(
                      initialCase: InitialCase.LOWER_CASE,
                      value: '',
                      backgroundColor: Colors.white.withOpacity(0.1),
                      buttonColor: Colors.black,
                      focusColor: Colors.grey.shade900,
                      onChanged: (txt) {
                        textNotifier.value = txt ?? '';
                        widget.onChanged?.call(txt ?? '');
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ValueListenableBuilder<String>(
                          valueListenable: textNotifier,
                          builder: (context, value, _) {
                            return OLButton(
                              title:
                                  LabelsManager().getRemoteStringFromLabelKeys(
                                RemoteLabelKeys.confirm,
                              ),
                              onPressed: value.isEmpty
                                  ? null
                                  : () => Navigator.of(context).pop(value),
                            );
                          }),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
            // OlTextField(
            //   focusNode: focusNode,
            //   onChanged: (value) {},
            //   controller: textEditingController,
            // ),
          ],
        ),
        //),
      ),
    );
  }
}
