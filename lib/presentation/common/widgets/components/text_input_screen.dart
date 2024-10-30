import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/keyboard/onscreen_keyboard.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_button.dart';
import 'package:open_learning_smart_tv/presentation/login/widgets/logo_banner.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';

class TextInputScreen extends StatefulWidget {
  const TextInputScreen({
    super.key,
    this.onChanged,
    this.isObscured = false,
    this.initialValue,
  });

  final void Function(String)? onChanged;
  final bool isObscured;
  final String? initialValue;

  @override
  State<TextInputScreen> createState() => _TextInputScreenState();
}

class _TextInputScreenState extends State<TextInputScreen> {
  final textEditingController = TextEditingController();

  final FocusNode confirmButtonFocusNode = FocusNode();

  ValueNotifier<String> textNotifier = ValueNotifier<String>('');

  @override
  void initState() {
    super.initState();

    textNotifier.value = widget.initialValue ?? '';
  }

  @override
  void dispose() {
    confirmButtonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login_back.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const LogoBanner(),
            const SizedBox(height: 100),
            SizedBox(
              width: 800,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ValueListenableBuilder<String>(
                    valueListenable: textNotifier,
                    builder: (context, value, _) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 60),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // TODO(UmbertoGrimaldi): Localize this string
                            Text(
                              value.isEmpty
                                  ? 'Start Typing'
                                  : (widget.isObscured
                                      ? value.replaceAll(RegExp(r'.'), '*')
                                      : value),
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
                  const SizedBox(height: 32),
                  Container(
                    height: 526,
                    width: 720,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: OLColors.backgroundSideNav,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(14),
                        topRight: Radius.circular(14),
                      ),
                      border: Border.all(color: OLColors.divider),
                    ),
                    child: OnscreenKeyboard(
                      initialCase: InitialCase.LOWER_CASE,
                      hLetterSpacing: 12,
                      vLetterSpacing: 8,
                      textStyle: AppTextTheme.subtitle().copyWith(
                        color: OLColors.textPrimary,
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                      onFocusOutside: (side) {
                        if (side == TraversalDirection.down) {
                          confirmButtonFocusNode.requestFocus();
                        }
                      },
                      value: widget.initialValue,
                      backgroundColor: Colors.transparent,
                      buttonColor: Colors.black,
                      focusColor: Colors.grey.shade900,
                      onChanged: (txt) {
                        textNotifier.value = txt ?? '';
                        widget.onChanged?.call(txt ?? '');
                      },
                    ),
                  ),
                  const SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          OLButton(
                            textOnly: true,
                            title: LabelsManager().getRemoteStringFromLabelKeys(
                              RemoteLabelKeys.undo,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                      const Spacer(),
                      ValueListenableBuilder<String>(
                          valueListenable: textNotifier,
                          builder: (context, value, _) {
                            return OLButton(
                              focusNode: confirmButtonFocusNode,
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
          ],
        ),
      ),
    );
  }
}
