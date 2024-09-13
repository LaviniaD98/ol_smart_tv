
/*
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/calendar/cubit/ol_calendar_dialog_cubit.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/calendar/ol_calendar_dialog.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/cubit/ol_download_dialog_cubit.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/ol_download_dialog.dart';
import 'package:open_learning_smart_tv/presentation/community_webview/community_web_view_page.dart';
import 'package:open_learning_smart_tv/presentation/corporate_code/corporate_code_page.dart';
import 'package:open_learning_smart_tv/presentation/corporate_code/cubit/corporate_code_cubit.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/detail_page.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/cubit/detail_page_cubit.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/community_strip_wall.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/detail/post_detail_page_connector.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/post/add_link/cubit/add_link_cubit.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/post/cubit/post_cubit.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/post/post_page.dart';
import 'package:open_learning_smart_tv/presentation/login/sso/cubit/sso_cubit.dart';
import 'package:open_learning_smart_tv/presentation/login/sso/sso_page.dart';
import 'package:open_learning_smart_tv/presentation/profile/download/wall/download_wall_strip_page.dart';
import 'package:open_learning_smart_tv/presentation/profile/profile_page.dart';
import 'package:open_learning_smart_tv/presentation/profile/cubit/profile_page_cubit.dart';
import 'package:open_learning_smart_tv/presentation/pwd_reset/cubit/pwd_reset_page_cubit.dart';
import 'package:open_learning_smart_tv/presentation/pwd_reset/cubit/pwd_set_old_page_cubit.dart';
import 'package:open_learning_smart_tv/presentation/pwd_reset/pwd_modified_page.dart';
import 'package:open_learning_smart_tv/presentation/pwd_reset/pwd_reset_page.dart';
import 'package:open_learning_smart_tv/presentation/pwd_reset/pwd_set_old_page.dart';
import 'package:open_learning_smart_tv/presentation/settings/fresh_desk/fresh_desk_page.dart';
import 'package:open_learning_smart_tv/presentation/settings/privacy_policy/privacy_policy_page.dart';
import 'package:open_learning_smart_tv/presentation/pwd_recover/pwd_changed_page.dart';
import 'package:open_learning_smart_tv/presentation/pwd_recover/pwd_confirm_page.dart';
import 'package:open_learning_smart_tv/presentation/pwd_recover/pwd_recover_page.dart';
import 'package:open_learning_smart_tv/presentation/settings/settings_page.dart';
import 'package:open_learning_smart_tv/presentation/search/cubit/search_cubit.dart';
import 'package:open_learning_smart_tv/presentation/video_player/cubit/video_player_cubit.dart';
import 'package:open_learning_smart_tv/presentation/video_player/offline/cubit/video_player_offline_cubit.dart';
import 'package:open_learning_smart_tv/presentation/video_player/offline/video_player_offline_page.dart';
import 'package:open_learning_smart_tv/presentation/web_player/cubit/web_view_page_cubit.dart';
import 'package:open_learning_smart_tv/presentation/web_player/web_view_page.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../core/dependency_injection/dependency_injection.dart';
import '../core/utils/extension.dart';
import '../domain/entities/menu/route/menu_route.dart';
import '../presentation/common/widgets/dialog/dialog_page.dart';
import '../presentation/community_webview/cubit/community_web_view_page_cubit.dart';
import '../presentation/course_detail/ecm/registration/ecm_registration_page.dart';
import '../presentation/dynamic_content/cubit/dynamic_content_cubit.dart';
import '../presentation/dynamic_content/dynamic_content.dart';
import '../presentation/dynamic_content/pages/topic_search_page.dart';
import '../presentation/dynamic_content/strip/community/post/add_link/add_link_page.dart';
import '../presentation/dynamic_content/widgets/dynamic_explore_header.dart';
import '../presentation/dynamic_content/widgets/dynamic_for_you_header.dart';
import '../presentation/dynamic_content/widgets/dynamic_search_header.dart';
import '../presentation/languages/cubit/languages_cubit.dart';
import '../presentation/languages/languages_page.dart';
import '../presentation/login/cubit/login_cubit.dart';
import '../presentation/login/login_page.dart';
import '../presentation/login/mfa/cubit/mfa_cubit.dart';
import '../presentation/notification/notification_page.dart';
import '../presentation/privacy/cubit/privacy_cubit.dart';
import '../presentation/privacy/privacy_page.dart';
import '../presentation/pwd_recover/cubit/pwd_confirm_page_cubit.dart';
import '../presentation/pwd_recover/cubit/pwd_recover_page_cubit.dart';
import '../presentation/search/search_page.dart';
import '../presentation/settings/cubit/settings_cubit.dart';
import '../presentation/splashscreen/cubit/splash_screen_cubit.dart';

import '../presentation/common/widgets/bottom_navigation/bottom_navigation_shell.dart';
import '../presentation/initiatives/cubit/initiatives_cubit.dart';
import '../presentation/initiatives/initiatives_page.dart';
import '../presentation/login/mfa/mfa_validation_page.dart';
import '../presentation/splashscreen/splashscreen_page.dart';
import '../presentation/video_player/community/video_player_community_page.dart';
import '../presentation/video_player/video_player_page.dart';
import '../presentation/wall/wall_strip_content_page.dart';
import '../presentation/wall/wall_strip_content_simple_page.dart';
import '../wrappers/tracking/tracking_manager.dart';

class AppRouter {
  static final AppRouter I = AppRouter._();

  AppRouter._();

  List<MenuRoute>? get dynamicRoutes => _dynamicRoutes;

  GlobalKey<NavigatorState> get root => _parentNavigatorKey;

  String get fullPath =>
      AppRouter.I.router.routerDelegate.currentConfiguration.fullPath;

  static final _parentNavigatorKey = GlobalKey<NavigatorState>();
  static const _initialRoute = '/';
  late GoRouter router;
  List<MenuRoute>? _dynamicRoutes;

  void setRouter({
    String? initial,
    List<MenuRoute>? dynamicRoutes,
    bool showSessionPopup = false,
  }) {
    _dynamicRoutes = dynamicRoutes;
    router = GoRouter(
      initialLocation: initial ?? _initialRoute,
      navigatorKey: _parentNavigatorKey,
      redirect: (context, state) {
        if (state.fullPath != null)
          getIt<TrackingManager>().communityTrackingHandler(state.fullPath!);
        return null;
      },
      routes: [
        GoRoute(
          parentNavigatorKey: _parentNavigatorKey,
          name: SplashScreenPage.routeName,
          path: '/',
          builder: (context, state) => BlocProvider(
            create: (_) => getIt<SplashScreenCubit>(),
            child: const SplashScreenPage(),
          ),
        ),

        GoRoute(
          name: DialogPage.routeName,
          path: DialogPage.routeName.path,
          pageBuilder: (context, state) => state.extra as DialogPage,
        ),

        GoRoute(
          name: OlDownloadDialog.routeName,
          path: OlDownloadDialog.routeName.path,
          pageBuilder: (context, state) => DialogPage(
            builder: (context) => BlocProvider(
                create: (_) => getIt<OlDownloadDialogCubit>()
                  ..startDownloadEvents(state.extra as OlDownloadDialogArgs),
                child: const OlDownloadDialog()),
          ),
        ),

        GoRoute(
          name: OlCalendarDialog.routeName,
          path: OlCalendarDialog.routeName.path,
          pageBuilder: (context, state) => DialogPage(
            builder: (context) => BlocProvider(
              create: (_) => getIt<OlCalendarDialogCubit>()
                ..startDownloadEvents(state.extra as OlCalendarDialogArgs),
              child: const OlCalendarDialog(),
            ),
          ),
        ),

        /// Login Flow
        GoRoute(
            parentNavigatorKey: _parentNavigatorKey,
            name: CorporateCodePage.routeName,
            path: '/corporate_code',
            builder: (context, state) => BlocProvider(
                  create: (_) =>
                      getIt<CorporateCodeCubit>()..init(showSessionPopup),
                  child: const CorporateCodePage(),
                ),
            routes: [
              GoRoute(
                parentNavigatorKey: _parentNavigatorKey,
                name: LoginPage.routeName,
                path: 'login',
                builder: (context, state) => BlocProvider(
                  create: (_) => getIt<LoginCubit>()..init(),
                  child: const LoginPage(),
                ),
                routes: [
                  GoRoute(
                    name: MfaValidationPage.routeName,
                    path: 'mfa',
                    builder: (context, state) => BlocProvider(
                      create: (_) => getIt<MfaCubit>(),
                      child: MfaValidationPage(
                          args: state.extra! as MfaValidationPageArgs),
                    ),
                  ),
                  GoRoute(
                    name: PwdRecoverStartPage.routeName,
                    path: PwdRecoverStartPage.routeName,
                    builder: (context, state) => BlocProvider(
                      create: (_) => getIt<PwdRecoverCubit>()..init(),
                      child: const PwdRecoverStartPage(),
                    ),
                  ),
                  GoRoute(
                    name: PwdConfirmPage.routeName,
                    path: PwdConfirmPage.routeName,
                    builder: (context, state) => BlocProvider(
                      create: (_) => getIt<PwdConfirmCubit>()..init(),
                      child: PwdConfirmPage(
                        args: state.extra! as PwdConfirmPageArgs,
                      ),
                    ),
                  ),
                  GoRoute(
                    name: PwdChangedPage.routeName,
                    path: PwdChangedPage.routeName,
                    builder: (context, state) => const PwdChangedPage(),
                  ),
                  GoRoute(
                    parentNavigatorKey: _parentNavigatorKey,
                    name: DownloadWallStripPage.routeName,
                    path: 'downloadWall',
                    builder: (context, state) => const DownloadWallStripPage(),
                  ),
                ],
              ),
            ]),

        /// Privacy page
        GoRoute(
          name: PrivacyPage.routeName,
          path: '/privacy',
          builder: (context, state) => BlocProvider(
            create: (_) => getIt<PrivacyCubit>(),
            child: PrivacyPage(
              args: state.extra! as PrivacyPageArgs,
            ),
          ),
        ),

        /// Initiatives page
        GoRoute(
          parentNavigatorKey: _parentNavigatorKey,
          name: InitiativesPage.routeName,
          path: '/initiatives',
          builder: (context, state) {
            final initiativesPageArgs = state.extra! as InitiativesPageArgs;
            return BlocProvider(
              create: (_) => getIt<InitiativesCubit>()
                ..init(
                    initiativesPageArgs.selfModel,
                    initiativesPageArgs.session,
                    initiativesPageArgs.sessionId,
                    initiativesPageArgs.isFromSettings),
              child: InitiativesPage(args: initiativesPageArgs),
            );
          },
        ),
        GoRoute(
          parentNavigatorKey: _parentNavigatorKey,
          name: SsoPage.routeName,
          path: '/sso',
          builder: (context, state) => BlocProvider(
            create: (_) => getIt<SsoCubit>()..init(),
            child: const SsoPage(),
          ),
        ),
        GoRoute(
            parentNavigatorKey: _parentNavigatorKey,
            name: PwdSetOldPage.routeName,
            path: '/setoldpwd',
            builder: (context, state) => BlocProvider(
                  create: (_) => getIt<PwdSetOldPageCubit>()..init(),
                  child: const PwdSetOldPage(),
                )),
        GoRoute(
          parentNavigatorKey: _parentNavigatorKey,
          name: PwdResetPage.routeName,
          path: '/resetpwd',
          builder: (context, state) {
            final pwdargs = state.extra as PwdResetPageArgs;
            return BlocProvider(
              create: (_) => getIt<PwdResetCubit>()..init(),
              child: PwdResetPage(args: pwdargs),
            );
          },
        ),
        GoRoute(
          name: PwdModifiedPage.routeName,
          path: '/pwdmodified',
          builder: (context, state) => const PwdModifiedPage(),
        ),

        /// Languages Page
        GoRoute(
          parentNavigatorKey: _parentNavigatorKey,
          name: LanguagesPage.routeName,
          path: LanguagesPage.routeName.path,
          builder: (context, state) => BlocProvider(
            create: (_) => getIt<LanguagesCubit>()
              ..init((state.extra! as LanguagesPageArgs)),
            child: LanguagesPage(args: state.extra! as LanguagesPageArgs),
          ),
        ),
        GoRoute(
          parentNavigatorKey: _parentNavigatorKey,
          name: DetailPage.routeName,
          path: '/detail',
          builder: (context, state) => BlocProvider(
            create: (_) => getIt<DetailPageCubit>()
              ..init((state.extra! as DetailPageArgs)),
            child: DetailPage(args: state.extra! as DetailPageArgs),
          ),
        ),

        /// ECM Registration page
        GoRoute(
          name: EcmRegistrationPage.routeName,
          path: EcmRegistrationPage.routeName.path,
          builder: (context, state) =>
              EcmRegistrationPage(state.extra! as EcmRegistrationPageArgs),
        ),

        /// Video player page
        GoRoute(
          parentNavigatorKey: _parentNavigatorKey,
          name: VideoPlayerPage.routeName,
          path: VideoPlayerPage.routeName.path,
          builder: (context, state) {
            final args = state.extra! as VideoPlayerPageArgs;
            return BlocProvider(
              create: (_) =>
                  getIt<VideoPlayerCubit>()..init(args.brightcoveId, args),
              child: VideoPlayerPage(
                args: args,
              ),
            );
          },
        ),

        GoRoute(
          parentNavigatorKey: _parentNavigatorKey,
          name: VideoPlayerOfflinePage.routeName,
          path: VideoPlayerOfflinePage.routeName.path,
          builder: (context, state) {
            final args = state.extra! as VideoPlayerOfflinePageArgs;
            return BlocProvider(
              create: (_) => getIt<VideoPlayerOfflineCubit>()
                ..init(args.downloadedItemExtended),
              child: VideoPlayerOfflinePage(
                args: args,
              ),
            );
          },
        ),

        GoRoute(
          parentNavigatorKey: _parentNavigatorKey,
          name: VideoPlayerCommunityPage.routeName,
          path: VideoPlayerCommunityPage.routeName.path,
          builder: (context, state) {
            final args = state.extra! as VideoPlayerCommunityPageArgs;
            return VideoPlayerCommunityPage(
              args: args,
            );
          },
        ),

        GoRoute(
          parentNavigatorKey: _parentNavigatorKey,
          name: WebViewPage.routeName,
          path: '/webviewroute',
          builder: (context, state) => BlocProvider(
            create: (_) => getIt<WebViewPageCubit>()
              ..init((state.extra! as WebViewPageArgs)),
            child: WebViewPage(args: state.extra! as WebViewPageArgs),
          ),
        ),

        GoRoute(
          parentNavigatorKey: _parentNavigatorKey,
          name: CommunityWebViewPage.routeName,
          path: '/communitywebviewroute',
          builder: (context, state) => BlocProvider(
            create: (_) => getIt<CommunityWebViewPageCubit>()..init(),
            child: const CommunityWebViewPage(),
          ),
        ),

        GoRoute(
          parentNavigatorKey: _parentNavigatorKey,
          name: SearchPage.routeName,
          path: SearchPage.routeName.path,
          pageBuilder: (context, state) => CustomTransitionPage(
            fullscreenDialog: true,
            child: BlocProvider(
              create: (_) => getIt<SearchCubit>(),
              child: const SearchPage(),
            ),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          ),
        ),

        /// Wall page
        GoRoute(
          name: WallStripContentPage.routeName,
          path: WallStripContentPage.routeName.path,
          builder: (context, state) => WallStripContentPage(
            state.extra! as WallStripContentPageArgs,
          ),
        ),

        GoRoute(
          name: WallStripContentSimplePage.routeName,
          path: WallStripContentSimplePage.routeName.path,
          builder: (context, state) => WallStripContentSimplePage(
            state.extra! as WallStripContentSimplePageArgs,
          ),
        ),

        /// Bottom navigation dynamic routes
        if (dynamicRoutes != null && dynamicRoutes.isNotEmpty)
          StatefulShellRoute.indexedStack(
            parentNavigatorKey: _parentNavigatorKey,
            branches: dynamicRoutes.mapIndexed((i, e) {
              final branchKey =
                  GlobalKey<NavigatorState>(debugLabel: e.routeName);

              // TODO(UmbertoGrimaldi): Start logic from here by generating the pageview pages from the dynamicRoutes

              return StatefulShellBranch(
                navigatorKey: branchKey,
                routes: [
                  GoRoute(
                    name: e.id.toString(),
                    path: (i + 1).toString().path,
                    builder: (context, state) => BlocProvider(
                      create: (_) =>
                          getIt<DynamicContentCubit>()..init(e.apiPath),
                      child: e.map(
                        visForYou: (_) => DynamicContent(
                          args: DynamicContentArgs(
                            apiPath: e.apiPath,
                            header: const DynamicForYouHeader(),
                          ),
                        ),
                        visExplore: (_) => DynamicContent(
                          args: DynamicContentArgs(
                            apiPath: e.apiPath,
                            header: DynamicExploreHeader(title: _.label),
                          ),
                        ),
                        visSearch: (_) => DynamicContent(
                          args: DynamicContentArgs(
                            apiPath: e.apiPath,
                            header: DynamicSearchHeader(
                              title: _.label,
                              apiPath: dynamicRoutes
                                  .whereType<VisExplore>()
                                  .firstOrNull
                                  ?.apiPath,
                              routeId: e.id,
                            ),
                          ),
                        ),
                        visCommunity: (_) => CommunityStripWall(
                          title: _.label,
                          apiPath: e.apiPath,
                        ),
                      ),
                    ),
                    routes: [
                      ...e.maybeMap(
                        visForYou: (_) => _visForYouSubRoutes(branchKey, e),
                        visSearch: (_) => _visSearchSubRoutes(branchKey, e),
                        visCommunity: (_) => _visCommunitySubRoutes(
                            branchKey, e, _parentNavigatorKey),
                        orElse: () => [],
                      ),
                    ],
                  ),
                ],
              );
            }).toList(),
            builder: (context, state, navigationShell) {
              return BottomNavigationShell(
                navigationShell,
                routes: dynamicRoutes,
              );
            },
          ),
      ],
    );
  }
}

List<GoRoute> _visForYouSubRoutes(
        GlobalKey<NavigatorState> key, MenuRoute route) =>
    [
      /// Profile page
      GoRoute(
        parentNavigatorKey: key,
        name: ProfilePage.routeName,
        path: 'profile',
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<ProfilePageCubit>()..init(),
          child: ProfilePage(),
        ),
      ),

      GoRoute(
        parentNavigatorKey: key,
        name: SettingsPage.routeName,
        path: 'settings',
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<SettingsCubit>()..init(),
          child: const SettingsPage(),
        ),
      ),

      GoRoute(
        parentNavigatorKey: key,
        name: PrivacyPolicyPage.routeName,
        path: 'privacy_policy',
        builder: (context, state) => const PrivacyPolicyPage(),
      ),

      GoRoute(
        parentNavigatorKey: key,
        name: FreshDeskPage.routeName,
        path: 'freshdesk',
        builder: (context, state) => FreshDeskPage(state.extra! as String),
      ),
      GoRoute(
        parentNavigatorKey: key,
        name: NotificationPage.routeName,
        path: 'notification',
        builder: (context, state) => const NotificationPage(),
      ),
    ];

List<GoRoute> _visSearchSubRoutes(
  GlobalKey<NavigatorState> key,
  MenuRoute route,
) =>
    [
      GoRoute(
          name: TopicSearchPage.routeName,
          path: 'topic-search',
          builder: (context, state) {
            final args = state.extra! as TopicSearchPageArgs;
            return BlocProvider(
              create: (_) => getIt<DynamicContentCubit>()
                ..init(args.apiPath, [args.selectedFilter]),
              child: TopicSearchPage(args),
            );
          }),
    ];

List<GoRoute> _visCommunitySubRoutes(
  GlobalKey<NavigatorState> key,
  MenuRoute route,
  GlobalKey<NavigatorState> rootKey,
) =>
    [
      /// Post Detail Page
      GoRoute(
          parentNavigatorKey: rootKey,
          name: PostDetailPageConnector.routeName,
          path: PostDetailPageConnector.routeName,
          builder: (context, state) =>
              PostDetailPageConnector(state.extra as PostDetailPageArgs)),

      /// Add/Edit Post Page
      GoRoute(
        parentNavigatorKey: rootKey,
        name: PostPage.routeName,
        path: PostPage.routeName,
        pageBuilder: (context, state) => MaterialPage(
          fullscreenDialog: true,
          child: BlocProvider(
            create: (_) =>
                getIt<PostCubit>()..init(state.extra as PostPageArgs?),
            child: PostPage(args: state.extra as PostPageArgs?),
          ),
        ),
      ),

      /// Add Link - Post Page
      GoRoute(
        parentNavigatorKey: rootKey,
        name: PostLinkPage.routeName,
        path: PostLinkPage.routeName,
        pageBuilder: (context, state) => MaterialPage(
          fullscreenDialog: true,
          child: BlocProvider(
            create: (_) =>
                getIt<AddLinkCubit>()..init(state.extra as PostLinkPageArgs?),
            child: PostLinkPage(args: state.extra as PostLinkPageArgs?),
          ),
        ),
      ),
    ];
*/