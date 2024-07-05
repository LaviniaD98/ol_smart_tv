import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/presentation/main/main_state_cubit.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen>
    with AutomaticKeepAliveClientMixin {
  final OrderedTraversalPolicy _focusNodeOrder = OrderedTraversalPolicy();

  final FocusScopeNode focusNode = FocusScopeNode(debugLabel: 'Favorites');

  @override
  void initState() {
    super.initState();
    context.read<MainStateCubit>().favoritesFocusNode = focusNode;
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CallbackShortcuts(
      bindings: <ShortcutActivator, VoidCallback>{
        const SingleActivator(LogicalKeyboardKey.arrowLeft): () {
          final focus = context.read<MainStateCubit>().state;
          focus.requestFocus();
        },
      },
      child: FocusTraversalGroup(
        policy: _focusNodeOrder,
        child: Focus(
          focusNode: focusNode,
          onFocusChange: (value) {
            setState(() {});
          },
          child: Scaffold(
            backgroundColor: OLColors.backgroundPrimary,
            body: Column(
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
                  'Favorites',
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

  @override
  bool get wantKeepAlive => true;
}
