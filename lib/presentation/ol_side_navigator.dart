import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/core/dependency_injection/dependency_injection.dart';
import 'package:open_learning_smart_tv/core/user_info_manager.dart';
import 'package:open_learning_smart_tv/domain/entities/menu/menu_model.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_side_item.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/user_avatar/user_avatar.dart';
import 'package:open_learning_smart_tv/presentation/main/main_state_cubit.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:open_learning_smart_tv/theme/glow/widget/glow_container.dart';

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

  static const String searchFocusId = 'searchSideItem';
  static const String forYouFocusId = 'forYouSideItem';
  static const String exploreFocusId = 'exploreSideItem';
  static const String favoritesFocusId = 'favoritesSideItem';
  static const String agendaFocusId = 'agendaSideItem';
  static const String profileFocusId = 'profileSideItem';

  List<String> tabs = [
    MenuServiceType.visSearch.routeName,
  ];

  @override
  void initState() {
    super.initState();
    context.read<MainStateCubit>().policy = _policy;

    Future.delayed(const Duration(milliseconds: 100), () {
      if (context.mounted) {
        // ignore: use_build_context_synchronously
        // context
        //     .read<MainStateCubit>()
        //     .state
        //     .children
        //     .toList()[1]
        //     .requestFocus();
        widget.pageController.jumpToPage(1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: getIt<RemoteLabels>(),
        builder: (context, child) {
          return BlocBuilder<MainStateCubit, OlFocusScopeNode>(
            builder: (context, focusNode) {
              final selectedIndexState =
                  context.read<MainStateCubit>().selectedIndex;

              return PopScope(
                canPop: !focusNode.hasFocus,
                onPopInvokedWithResult: (didPop, result) {
                  if (focusNode.hasFocus) {
                    FocusScope.of(context)
                        .focusInDirection(TraversalDirection.right);
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
                    const SingleActivator(LogicalKeyboardKey.select):
                        selectPage,
                    const SingleActivator(LogicalKeyboardKey.enter): selectPage,
                    const SingleActivator(LogicalKeyboardKey.goBack): () {
                      FocusScope.of(context).nextFocus();
                    },
                  },
                  child: FocusScope(
                    node: focusNode,
                    onFocusChange: (value) {
                      setState(() {});
                      if (value) {
                        if (focusNode.focusedChild == null) {
                          context
                              .read<MainStateCubit>()
                              .state
                              .children
                              .toList()[1]
                              .requestFocus();
                        }
                      }
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
                                      title: LabelsManager()
                                          .getRemoteStringFromLabelKeys(
                                              RemoteLabelKeys.visSearch),
                                      id: searchFocusId,
                                      isSelected: !focusNode.hasFocus &&
                                          selectedIndexState == 0,
                                    ),
                                    const SizedBox(height: 120),
                                    OLSideItem(
                                      icon: 'assets/icons/for_you.svg',
                                      title: LabelsManager()
                                          .getRemoteStringFromLabelKeys(
                                              RemoteLabelKeys.visForyouMenu),
                                      id: forYouFocusId,
                                      isSelected: !focusNode.hasFocus &&
                                          selectedIndexState == 1,
                                    ),
                                    const SizedBox(height: 44),
                                    OLSideItem(
                                      icon: 'assets/icons/explore.svg',
                                      title: LabelsManager()
                                          .getRemoteStringFromLabelKeys(
                                              RemoteLabelKeys.visExplore),
                                      id: exploreFocusId,
                                      isSelected: !focusNode.hasFocus &&
                                          selectedIndexState == 2,
                                    ),
                                    const SizedBox(height: 44),
                                    OLSideItem(
                                      icon: 'assets/icons/favorites_icon.svg',
                                      title: LabelsManager()
                                          .getRemoteStringFromLabelKeys(
                                              RemoteLabelKeys.favourites),
                                      id: favoritesFocusId,
                                      isSelected: !focusNode.hasFocus &&
                                          selectedIndexState == 3,
                                    ),
                                    const SizedBox(height: 44),
                                    OLSideItem(
                                      icon: 'assets/icons/agenda_icon.svg',
                                      title: LabelsManager()
                                          .getRemoteStringFromLabelKeys(
                                              RemoteLabelKeys.agenda),
                                      id: agendaFocusId,
                                      isSelected: !focusNode.hasFocus &&
                                          selectedIndexState == 4,
                                    ),
                                    const Spacer(),
                                    const SizedBox(height: 44),
                                    OLSideItem(
                                      icon: 'assets/icons/agenda_icon.svg',
                                      title: 'Profile',
                                      id: profileFocusId,
                                      child: (hasFocus) {
                                        final isSelected =
                                            !focusNode.hasFocus &&
                                                selectedIndexState == 5;

                                        final user = UserInfoManager()
                                            .getUserInfoModel()
                                            ?.user;

                                        return Column(
                                          children: [
                                            UserAvatar(
                                              size: 60,
                                              radius: 40,
                                              hasFocus: hasFocus,
                                              bgColor:
                                                  Colors.white.withOpacity(0.2),
                                              isSelected: isSelected,
                                              id: user?.idUser,
                                            ),
                                            const SizedBox(height: 16),
                                            GlowContainer(
                                              width: 75,
                                              height: 2.5,
                                              blurRadius: 8,
                                              spreadRadius: 1,
                                              glowColor: hasFocus || isSelected
                                                  ? OLColors.accentVariantA
                                                      .withOpacity(0.5)
                                                  : Colors.transparent,
                                              color: hasFocus || isSelected
                                                  ? OLColors.accentVariantA
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            )
                                          ],
                                        );
                                      },
                                      isSelected: !focusNode.hasFocus &&
                                          selectedIndexState == 5,
                                    ),
                                    const SizedBox(height: 50),
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
            },
          );
        });
  }

  void selectPage({bool ignoreNewIndex = false}) {
    if (!ignoreNewIndex) {
      context.read<MainStateCubit>().selectedIndex = getCurrentScreenIndex();
    } else {
      final selectedIndex = context.read<MainStateCubit>().selectedIndex;
      final focusKey = getKeyForSelectedIndex(selectedIndex);
      final focus = getFocusOnIndex(focusKey);
      if (focus != null) {
        focus.requestFocus();
      }
    }
    final selectedIndex = context.read<MainStateCubit>().selectedIndex;
    widget.pageController.jumpToPage(selectedIndex);
    Future.delayed(const Duration(milliseconds: 100), () {
      requestFocusOnIndex(selectedIndex);
    });

    setState(() {});
  }

  int getCurrentScreenIndex() {
    final f = context.read<MainStateCubit>().state;
    final i = f.children.toList().indexWhere((focus) {
      return focus.id == f.focusedChild?.id;
    });
    return i;
  }

  void requestFocusOnIndex(int index) {
    if (index == 0) {
      if (context.read<MainStateCubit>().latestSearchFocusNode != null) {
        context.read<MainStateCubit>().latestSearchFocusNode?.requestFocus();
        Future.delayed(const Duration(milliseconds: 100), () {
          context.read<MainStateCubit>().latestSearchFocusNode = null;
        });
        return;
      }
      context.read<MainStateCubit>().searchFocusNode?.requestFocus();
    } else if (index == 1) {
      if (context.read<MainStateCubit>().latestForYouFocusNode != null) {
        context.read<MainStateCubit>().latestForYouFocusNode?.requestFocus();
        Future.delayed(const Duration(milliseconds: 100), () {
          context.read<MainStateCubit>().latestForYouFocusNode = null;
        });
        return;
      }
      context.read<MainStateCubit>().forYouFocusNode?.requestFocus();
    } else if (index == 2) {
      if (context.read<MainStateCubit>().latestExploreFocusNode != null) {
        context.read<MainStateCubit>().latestExploreFocusNode?.requestFocus();
        Future.delayed(const Duration(milliseconds: 100), () {
          context.read<MainStateCubit>().latestExploreFocusNode = null;
        });
        return;
      }
      context.read<MainStateCubit>().exploreFocusNode?.requestFocus();
    } else if (index == 3) {
      if (context.read<MainStateCubit>().latestFavoritesFocusNode != null) {
        context.read<MainStateCubit>().latestFavoritesFocusNode?.requestFocus();
        Future.delayed(const Duration(milliseconds: 100), () {
          context.read<MainStateCubit>().latestFavoritesFocusNode = null;
        });
        return;
      }
      context.read<MainStateCubit>().favoritesFocusNode?.requestFocus();
    } else if (index == 4) {
      if (context.read<MainStateCubit>().latestAgendaFocusNode != null) {
        context.read<MainStateCubit>().latestAgendaFocusNode?.requestFocus();
        Future.delayed(const Duration(milliseconds: 100), () {
          context.read<MainStateCubit>().latestAgendaFocusNode = null;
        });
        return;
      }
      context.read<MainStateCubit>().agendaFocusNode?.requestFocus();
    } else if (index == 5) {
      if (context.read<MainStateCubit>().latestProfileFocusNode != null) {
        context.read<MainStateCubit>().latestProfileFocusNode?.requestFocus();
        Future.delayed(const Duration(milliseconds: 100), () {
          context.read<MainStateCubit>().latestProfileFocusNode = null;
        });
        return;
      }
      context.read<MainStateCubit>().profileFocusNode?.requestFocus();
    }
  }

  void resetNestedFocusNodes() {
    context.read<MainStateCubit>().latestSearchFocusNode = null;
    context.read<MainStateCubit>().latestForYouFocusNode = null;
    context.read<MainStateCubit>().latestExploreFocusNode = null;
    context.read<MainStateCubit>().latestFavoritesFocusNode = null;
    context.read<MainStateCubit>().latestAgendaFocusNode = null;
    context.read<MainStateCubit>().latestProfileFocusNode = null;
  }

  void handleNestedFocus(OlFocusScopeNode? focus) {
    if (focus != null) {
      focus.requestFocus();
      Future.delayed(const Duration(milliseconds: 100), () {
        focus = null;
      });
      return;
    }
  }

  String getKeyForSelectedIndex(int index) {
    if (index == 0) {
      return searchFocusId;
    } else if (index == 1) {
      return forYouFocusId;
    } else if (index == 2) {
      return exploreFocusId;
    } else if (index == 3) {
      return favoritesFocusId;
    } else if (index == 4) {
      return agendaFocusId;
    } else if (index == 5) {
      return profileFocusId;
    }
    return '';
  }

  FocusNode? getFocusOnIndex(String key) {
    final f = context.read<MainStateCubit>().state;
    return f.children.toList().firstWhereOrNull((focus) {
      return focus.id == key;
    });
  }
}
