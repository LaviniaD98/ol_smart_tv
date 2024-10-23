import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_learning_smart_tv/app_manager.dart';
import 'package:open_learning_smart_tv/core/dependency_injection/dependency_injection.dart';
import 'package:open_learning_smart_tv/domain/entities/menu/route/menu_route.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/cubit/dynamic_all_content_cubit.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/cubit/explore/explore_content_cubit.dart';
import 'package:open_learning_smart_tv/presentation/main/agenda/agenda_screen.dart';
import 'package:open_learning_smart_tv/presentation/main/explore/explore_screen.dart';
import 'package:open_learning_smart_tv/presentation/main/favorites/favorites_screen.dart';
import 'package:open_learning_smart_tv/presentation/main/for_you/for_you_screen.dart';
import 'package:open_learning_smart_tv/presentation/main/profile/profile_screen.dart';
import 'package:open_learning_smart_tv/presentation/main/search/search_screen.dart';
import 'package:open_learning_smart_tv/presentation/ol_side_navigator.dart';
import 'package:open_learning_smart_tv/presentation/profile/cubit/profile_page_cubit.dart';
import 'package:open_learning_smart_tv/presentation/search/cubit/search_cubit.dart';
import 'package:open_learning_smart_tv/presentation/settings/cubit/settings_cubit.dart';

class OLHomeScreen extends StatefulWidget {
  const OLHomeScreen({
    required this.dynamicRoutes,
    super.key,
  });

  final List<MenuRoute> dynamicRoutes;

  @override
  State<OLHomeScreen> createState() => _OLHomeScreenState();
}

class _OLHomeScreenState extends State<OLHomeScreen> {
  final int initialPage = 1;

  final focusNode = FocusScopeNode(debugLabel: 'Home');
  final pagesFocusNode = FocusScopeNode(debugLabel: 'Home - Pages');
  late PageController pageController;

  GlobalKey<NavigatorState> searchTabKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> forYouTabKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> exploreTabKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> favoritesTabKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> agendaTabKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> profileTabKey = GlobalKey<NavigatorState>();

  late List<GlobalKey<NavigatorState>> tabKeys;

  @override
  void initState() {
    super.initState();

    pageController = PageController(initialPage: initialPage);

    tabKeys = [
      searchTabKey,
      forYouTabKey,
      exploreTabKey,
      favoritesTabKey,
      agendaTabKey,
      profileTabKey,
    ];

    manager.currentTabNavKey = tabKeys[initialPage];
  }

  @override
  Widget build(BuildContext context) {
    //print('widget.dynamicRoutes: ${widget.dynamicRoutes}');
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (manager.currentTabNavKey?.currentState?.canPop() ?? false) {
          manager.currentTabNavKey?.currentState?.pop();
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              left: 175,
              top: 0,
              right: 0,
              bottom: 0,
              child: FocusScope(
                node: pagesFocusNode,
                skipTraversal: true,
                onFocusChange: (value) {},
                child: PageView.builder(
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return MultiBlocProvider(
                        providers: [
                          BlocProvider(
                            create: (_) => getIt<SearchCubit>(),
                          ),
                        ],
                        child: IGTabNavigator(
                          navigatorKey: searchTabKey,
                          tabRoute: 'routeKeySearch',
                          tabScreen: const SearchScreen(),
                        ),
                      );
                    } else if (index == 1) {
                      return BlocProvider(
                        create: (_) => getIt<ProfilePageCubit>()..init(),
                        child: IGTabNavigator(
                          navigatorKey: forYouTabKey,
                          tabRoute: 'routeKeyForYou',
                          tabScreen: ForYouScreen(
                            dynamicRoutes: widget.dynamicRoutes,
                          ),
                        ),
                      );
                    } else if (index == 2) {
                      final currentMenuRoute =
                          widget.dynamicRoutes.firstWhereOrNull(
                        (element) => element.routeName == 'visExplore',
                      );
                      return MultiBlocProvider(
                        providers: [
                          BlocProvider(
                            create: (_) => getIt<DynamicAllContentCubit>()
                              ..init(currentMenuRoute?.apiPath ?? ''),
                          ),
                          BlocProvider(
                            create: (_) => getIt<ExploreContentCubit>()
                              ..init(currentMenuRoute?.apiPath ?? ''),
                          ),
                        ],
                        child: IGTabNavigator(
                          navigatorKey: exploreTabKey,
                          tabRoute: 'routeKeyExplore',
                          tabScreen: ExploreScreen(
                            dynamicRoutes: widget.dynamicRoutes,
                          ),
                        ),
                      );
                    } else if (index == 3) {
                      return IGTabNavigator(
                        navigatorKey: favoritesTabKey,
                        tabRoute: 'routeKeyFavorites',
                        tabScreen: FavoritesScreen(
                          dynamicRoutes: widget.dynamicRoutes,
                        ),
                      );
                    } else if (index == 4) {
                      return IGTabNavigator(
                        navigatorKey: agendaTabKey,
                        tabRoute: 'routeKeyAgenda',
                        tabScreen: AgendaScreen(
                          dynamicRoutes: widget.dynamicRoutes,
                        ),
                      );
                    } else if (index == 5) {
                      return MultiBlocProvider(
                        providers: [
                          BlocProvider(
                            create: (_) => getIt<ProfilePageCubit>()..init(),
                          ),
                          BlocProvider(
                            create: (_) => getIt<SettingsCubit>()..init(),
                          ),
                        ],
                        child: IGTabNavigator(
                          navigatorKey: profileTabKey,
                          tabRoute: 'routeKeyProfile',
                          tabScreen: const ProfileScreen(),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                  controller: pageController,
                  itemCount: 6,
                  onPageChanged: (index) {
                    manager.currentTabNavKey = tabKeys[index];
                  },
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ),
            ),
            Positioned.fill(
              left: 0,
              top: 0,
              bottom: 0,
              child: OLSideNavigator(pageController: pageController),
            ),
          ],
        ),
      ),
    );
  }
}

class IGTabNavigator extends StatelessWidget {
  const IGTabNavigator({
    super.key,
    this.navigatorKey,
    this.tabRoute,
    this.tabScreen,
  });

  final GlobalKey<NavigatorState>? navigatorKey;
  final String? tabRoute;
  final Widget? tabScreen;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: tabRoute,
      onGenerateRoute: (settings) {
        return MaterialPageRoute<dynamic>(
          builder: (context) => tabScreen ?? const SizedBox.shrink(),
        );
      },
    );
  }
}
