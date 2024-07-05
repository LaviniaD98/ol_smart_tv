import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/presentation/main/main_state_cubit.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final OrderedTraversalPolicy _focusNodeOrder = OrderedTraversalPolicy();

  final FocusScopeNode focusNode = FocusScopeNode(debugLabel: 'Profile');

  @override
  void initState() {
    super.initState();
    context.read<MainStateCubit>().profileFocusNode = focusNode;
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FocusTraversalGroup(
      policy: _focusNodeOrder,
      child: Focus(
        focusNode: focusNode,
        onFocusChange: (value) {
          setState(() {});
        },
        child: Scaffold(
          backgroundColor: OLColors.backgroundPrimary,
          body: CallbackShortcuts(
            bindings: <ShortcutActivator, VoidCallback>{
              const SingleActivator(LogicalKeyboardKey.arrowLeft): () {
                final focus = context.read<MainStateCubit>().state;
                focus.requestFocus();
              },
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SvgPicture.asset(
                  'assets/images/white_logo.svg',
                  height: 100,
                  width: 100,
                ),
                const SizedBox(height: 32),
                Text(
                  'Profile',
                  style: AppTextTheme.body(
                    size: 50,
                    weight: FontWeight.w600,
                    color: OLColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
