import 'package:collection/collection.dart';
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

  static const String searchDebugLabel = 'searchSideItem';
  static const String forYouDebugLabel = 'forYouSideItem';
  static const String exploreDebugLabel = 'exploreSideItem';
  static const String favoritesDebugLabel = 'favoritesSideItem';
  static const String agendaDebugLabel = 'agendaSideItem';
  static const String profileDebugLabel = 'profileSideItem';

  int selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    context.read<MainStateCubit>().policy = _policy;

    Future.delayed(const Duration(milliseconds: 100), () {
      context.read<MainStateCubit>().state.children.toList()[1].requestFocus();
      widget.pageController.jumpToPage(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainStateCubit, FocusScopeNode>(
        builder: (context, focusNode) {
      return PopScope(
        canPop: !focusNode.hasFocus,
        onPopInvokedWithResult: (didPop, result) {
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
            const SingleActivator(LogicalKeyboardKey.arrowRight): () =>
                selectPage(ignoreNewIndex: true),
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
                        stops: [0, focusNode.hasFocus ? 1 : 0.01],
                        colors: [
                          Colors.white.withOpacity(0.7),
                          Colors.white.withOpacity(0)
                        ],
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
                              debugLabel: searchDebugLabel,
                              isSelected:
                                  !focusNode.hasFocus && selectedIndex == 0,
                            ),
                            const SizedBox(height: 120),
                            OLSideItem(
                              icon: 'assets/icons/for_you.svg',
                              title: 'Per te',
                              debugLabel: forYouDebugLabel,
                              isSelected:
                                  !focusNode.hasFocus && selectedIndex == 1,
                            ),
                            const SizedBox(height: 44),
                            OLSideItem(
                              icon: 'assets/icons/explore.svg',
                              title: 'Esplora',
                              debugLabel: exploreDebugLabel,
                              isSelected:
                                  !focusNode.hasFocus && selectedIndex == 2,
                            ),
                            const SizedBox(height: 44),
                            OLSideItem(
                              icon: 'assets/icons/favorites_icon.svg',
                              title: 'Preferiti',
                              debugLabel: favoritesDebugLabel,
                              isSelected:
                                  !focusNode.hasFocus && selectedIndex == 3,
                            ),
                            const SizedBox(height: 44),
                            OLSideItem(
                              icon: 'assets/icons/agenda_icon.svg',
                              title: 'Agenda',
                              debugLabel: agendaDebugLabel,
                              isSelected:
                                  !focusNode.hasFocus && selectedIndex == 4,
                            ),
                            const Spacer(),
                            const SizedBox(height: 44),
                            OLSideItem(
                              icon: 'assets/icons/agenda_icon.svg',
                              title: 'Profile',
                              debugLabel: profileDebugLabel,
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

  void selectPage({bool ignoreNewIndex = false}) {
    if (!ignoreNewIndex) {
      selectedIndex = getCurrentScreenIndex();
    } else {
      final focusKey = getKeyForSelectedIndex(selectedIndex);
      final focus = getFocusOnIndex(focusKey);
      if (focus != null) {
        focus.requestFocus();
      }
    }
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

  String getKeyForSelectedIndex(int index) {
    if (index == 0) {
      return searchDebugLabel;
    } else if (index == 1) {
      return forYouDebugLabel;
    } else if (index == 2) {
      return exploreDebugLabel;
    } else if (index == 3) {
      return favoritesDebugLabel;
    } else if (index == 4) {
      return agendaDebugLabel;
    } else if (index == 5) {
      return profileDebugLabel;
    }
    return '';
  }

  FocusNode? getFocusOnIndex(String key) {
    final f = context.read<MainStateCubit>().state;
    return f.children.toList().firstWhereOrNull((focus) {
      return focus.debugLabel == key;
    });
  }
}
