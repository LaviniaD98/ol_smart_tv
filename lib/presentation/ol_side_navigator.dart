import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_side_item.dart';
import 'package:open_learning_smart_tv/presentation/main/main_state_cubit.dart';

class OLSideNavigator extends StatefulWidget {
  const OLSideNavigator({
    required this.pageController,
    super.key,
  });

  final PageController pageController;

  @override
  State<OLSideNavigator> createState() => _OLSideNavigatorState();
}

class _OLSideNavigatorState extends State<OLSideNavigator> {
  final OrderedTraversalPolicy _policy = OrderedTraversalPolicy();

  int selectedIndex = 2;

  @override
  void initState() {
    super.initState();
    context.read<MainStateCubit>().policy = _policy;

    Future.delayed(const Duration(milliseconds: 100), () {
      context.read<MainStateCubit>().state.children.toList()[2].requestFocus();
      widget.pageController.jumpToPage(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainStateCubit, FocusScopeNode>(
        builder: (context, focusNode) {
      return PopScope(
        canPop: !focusNode.hasFocus,
        onPopInvoked: (didPop) {
          if (focusNode.hasFocus) {
            FocusScope.of(context).focusInDirection(TraversalDirection.right);
          }
        },
        child: CallbackShortcuts(
          bindings: <ShortcutActivator, VoidCallback>{
            const SingleActivator(LogicalKeyboardKey.arrowUp): () {
              _policy.previous(focusNode);
            },
            const SingleActivator(LogicalKeyboardKey.arrowDown): () {
              _policy.next(focusNode);
            },
            const SingleActivator(LogicalKeyboardKey.arrowRight): () {
              FocusScope.of(context).nextFocus();
            },
            const SingleActivator(LogicalKeyboardKey.select): selectPage,
            const SingleActivator(LogicalKeyboardKey.enter): selectPage,
            const SingleActivator(LogicalKeyboardKey.goBack): () {
              FocusScope.of(context).nextFocus();
            },
          },
          child: FocusScope(
            node: focusNode,
            onFocusChange: (value) {
              setState(() {});
            },
            child: Stack(
              children: [
                Positioned.fill(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        stops: [0, focusNode.hasFocus ? 1 : 0.1],
                        colors: [Colors.white, Colors.white.withOpacity(0)],
                      ),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  color: OLColors.backgroundSideNav,
                  width: focusNode.hasFocus ? 250 : 175,
                  child: Row(
                    children: [
                      // TODO(UmbertoGrimaldi): add remote string

                      Expanded(
                        child: Column(
                          children: [
                            const SizedBox(height: 68),
                            SvgPicture.asset(
                              'assets/images/white_logo.svg',
                            ),
                            const SizedBox(height: 120),
                            OLSideItem(
                              icon: 'assets/icons/search.svg',
                              title: 'Cerca',
                              isSelected:
                                  !focusNode.hasFocus && selectedIndex == 0,
                            ),
                            const SizedBox(height: 120),
                            OLSideItem(
                              icon: 'assets/icons/for_you.svg',
                              title: 'Per te',
                              isSelected:
                                  !focusNode.hasFocus && selectedIndex == 1,
                            ),
                            const SizedBox(height: 44),
                            OLSideItem(
                              icon: 'assets/icons/explore.svg',
                              title: 'Esplora',
                              isSelected:
                                  !focusNode.hasFocus && selectedIndex == 2,
                            ),
                            const SizedBox(height: 44),
                            OLSideItem(
                              icon: 'assets/icons/favorites_icon.svg',
                              title: 'Preferiti',
                              isSelected:
                                  !focusNode.hasFocus && selectedIndex == 3,
                            ),
                            const SizedBox(height: 44),
                            OLSideItem(
                              icon: 'assets/icons/agenda_icon.svg',
                              title: 'Agenda',
                              isSelected:
                                  !focusNode.hasFocus && selectedIndex == 4,
                            ),
                            const Spacer(),
                            const SizedBox(height: 44),
                            OLSideItem(
                              icon: 'assets/icons/agenda_icon.svg',
                              title: 'Profile',
                              isSelected:
                                  !focusNode.hasFocus && selectedIndex == 5,
                            ),
                          ],
                        ),
                      ),
                      const VerticalDivider(
                        thickness: 2,
                        width: 2,
                        color: OLColors.divider,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  void selectPage() {
    selectedIndex = getCurrentScreenIndex();
    widget.pageController.jumpToPage(selectedIndex);
    Future.delayed(const Duration(milliseconds: 100), () {
      requestFocusOnIndex(selectedIndex);
    });

    setState(() {});
  }

  int getCurrentScreenIndex() {
    final f = context.read<MainStateCubit>().state;
    final i = f.children.toList().indexWhere((focus) {
      return focus.debugLabel == f.focusedChild?.debugLabel;
    });
    return i;
  }

  void requestFocusOnIndex(int index) {
    if (index == 0) {
      context.read<MainStateCubit>().searchFocusNode?.requestFocus();
    } else if (index == 1) {
      context.read<MainStateCubit>().forYouFocusNode?.requestFocus();
    } else if (index == 2) {
      context.read<MainStateCubit>().exploreFocusNode?.requestFocus();
    } else if (index == 3) {
      context.read<MainStateCubit>().favoritesFocusNode?.requestFocus();
    } else if (index == 4) {
      context.read<MainStateCubit>().agendaFocusNode?.requestFocus();
    } else if (index == 5) {
      context.read<MainStateCubit>().profileFocusNode?.requestFocus();
    }
  }
}
