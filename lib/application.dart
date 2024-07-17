import 'package:flutter/services.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/text_field_input.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/ol_alert_dialog.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/ol_syncing_dialog.dart';
import 'package:open_learning_smart_tv/presentation/main/main_state_cubit.dart';
import 'package:open_learning_smart_tv/presentation/offline_state/offline_cubit.dart';
import 'package:open_learning_smart_tv/presentation/profile/download/cubit/download_strip_cubit.dart';
import 'package:open_learning_smart_tv/presentation/splashscreen/cubit/splash_screen_cubit.dart';
import 'package:open_learning_smart_tv/presentation/splashscreen/splashscreen_page.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_learning_smart_tv/core/dependency_injection/dependency_injection.dart';
import 'package:open_learning_smart_tv/router/app_router.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:open_learning_smart_tv/theme/glow/theme/glow_theme.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'presentation/app_state/cubit/app_cubit.dart';
import 'presentation/corporate_code/cubit/corporate_code_cubit.dart';
import 'presentation/dynamic_content/strip/community/cubit/community_wall_cubit.dart';
import 'presentation/dynamic_content/strip/continue_learning/cubit/continue_learning_strip_cubit.dart';
import 'presentation/dynamic_content/strip/favourites/cubit/favourites_strip_cubit.dart';
import 'presentation/notification/cubit/notification_cubit.dart';

class Application extends StatelessWidget {
  const Application({super.key});
  @override
  Widget build(BuildContext context) {
    //print('context.screenSize: ${context.screenSize}');

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
          lazy: false,
          create: (_) => getIt<AppCubit>(),
        ),
        BlocProvider<OfflineCubit>(
          create: (_) => getIt<OfflineCubit>()..init(),
        ),
        BlocProvider<NotificationCubit>(
          create: (_) => getIt<NotificationCubit>()..fetch(),
        ),
        BlocProvider<FavouritesStripCubit>(
          create: (_) => getIt<FavouritesStripCubit>(),
        ),
        BlocProvider<DownloadStripCubit>(
          create: (_) => getIt<DownloadStripCubit>(),
        ),
        BlocProvider<ContinueLearningStripCubit>(
          create: (_) => getIt<ContinueLearningStripCubit>(),
        ),
        BlocProvider<CommunityWallCubit>(
            create: (_) => getIt<CommunityWallCubit>()),
        BlocProvider<SplashScreenCubit>(
            create: (_) => getIt<SplashScreenCubit>()),
        BlocProvider(
          create: (_) => getIt<CorporateCodeCubit>()..init(false),
        ),
        BlocProvider(
          create: (_) => MainStateCubit(),
        ),
      ],
      child: ListenableBuilder(
          listenable: getIt<RemoteLabels>(),
          builder: (context, child) {
            return BlocBuilder<AppCubit, AppState>(
              builder: (_, state) => state.map(
                initial: (value) {
                  return BlocListener<OfflineCubit, OfflineState>(
                    listener: (_, state) {
                      final context = AppRouter.I.root.currentContext ?? _;
                      state.mapOrNull(
                        done: (_) => context.pop(),
                        syncing: (_) => OlSyncingDialog.show(context),
                        networkChanged: (value) async {
                          if (context.read<OfflineCubit>().isOfflineMode()) {
                            return null;
                          } else {
                            final res = await OlAlertDialog.show(context,
                                title: LabelsManager()
                                    .getRemoteStringFromLabelKeys(
                                        RemoteLabelKeys
                                            .back_online_dialog_title),
                                message: LabelsManager()
                                    .getRemoteStringFromLabelKeys(
                                        RemoteLabelKeys
                                            .back_online_dialog_body),
                                actionLabel: LabelsManager()
                                    .getRemoteStringFromLabelKeys(
                                        RemoteLabelKeys
                                            .back_online_dialog_ok_button),
                                barrierDismissible: false);
                            if (res != null && res && context.mounted) {
                              context
                                  .read<OfflineCubit>()
                                  .checkOfflineStatements();
                            }
                          }
                          return null;
                        },
                        showTutorial: (value) => null,
                        shownOnboarding: (value) => null,
                        // shownOnboarding: (value) {
                        //   context.read<OfflineCubit>().setOnboardingShown();
                        //   showModalBottomSheet(
                        //       context:
                        //           AppRouter.I.root.currentContext ?? context,
                        //       isScrollControlled: true,
                        //       showDragHandle: true,
                        //       shape: RoundedRectangleBorder(
                        //           borderRadius:
                        //               BorderRadius.circular(Dimens.radius)),
                        //       barrierColor: ColorManager()
                        //           .getColorBackgroundDrawerWidget()
                        //           .withAlpha(127),
                        //       backgroundColor:
                        //           AppTheme.greyGradient.colors[0],
                        //       builder: (context) =>
                        //           OnboardingSheet(value.showTutorial));
                        //   return null;
                        // },
                        // showTutorial: (value) {
                        //   context.read<OfflineCubit>().setTutorialShown();
                        //   showModalBottomSheet(
                        //     context:
                        //         AppRouter.I.root.currentContext ?? context,
                        //     isScrollControlled: true,
                        //     showDragHandle: true,
                        //     shape: RoundedRectangleBorder(
                        //         borderRadius:
                        //             BorderRadius.circular(Dimens.radius)),
                        //     barrierColor: ColorManager()
                        //         .getColorBackgroundDrawerWidget()
                        //         .withAlpha(127),
                        //     backgroundColor: AppTheme.greyGradient.colors[0],
                        //     builder: (context) => const TutorialSheet(),
                        //   );
                        //   return null;
                        // });
                      );
                    },
                    child: Shortcuts(
                      shortcuts: <LogicalKeySet, Intent>{
                        LogicalKeySet(LogicalKeyboardKey.select):
                            const ActivateIntent(),
                        LogicalKeySet(LogicalKeyboardKey.enter):
                            const ActivateIntent(),
                        LogicalKeySet(LogicalKeyboardKey.goBack):
                            const BackIntent(),
                      },
                      // child: MaterialApp.router(
                      //   builder: (context, child) {
                      //     return MediaQuery(
                      //       data: MediaQuery.of(context).copyWith(
                      //           navigationMode: NavigationMode.directional),
                      //       child: ResponsiveBreakpoints.builder(
                      //         child: child!,
                      //         useShortestSide: true,
                      //         debugLog: true,
                      //         breakpoints: [
                      //           const Breakpoint(
                      //               start: 801, end: 1920, name: DESKTOP),
                      //           const Breakpoint(
                      //             start: 1921,
                      //             end: double.infinity,
                      //             name: '4K',
                      //           ),
                      //         ],
                      //       ),
                      //     );
                      //   },
                      //   localizationsDelegates: const [
                      //     GlobalMaterialLocalizations.delegate,
                      //     GlobalWidgetsLocalizations.delegate,
                      //     GlobalCupertinoLocalizations.delegate,
                      //     DefaultWidgetsLocalizations.delegate,
                      //   ],
                      //   supportedLocales:
                      //       getIt<RemoteLabels>().supportedLocales,
                      //   locale: getIt<RemoteLabels>().locale,
                      //   theme: AppTheme.theme.copyWith(),
                      //   routerDelegate: AppRouter.I.router.routerDelegate,
                      //   routeInformationProvider:
                      //       AppRouter.I.router.routeInformationProvider,
                      //   routeInformationParser:
                      //       AppRouter.I.router.routeInformationParser,
                      // ),
                      child: MaterialApp(
                        builder: (context, child) {
                          final theme = GlowThemeData(
                            glowColor: ColorManager()
                                .getColorBackgroundPrimaryCta()
                                .withOpacity(0.4),
                            spreadRadius: 1.5,
                            blurRadius: 12,
                            offset: const Offset(0, 0),
                          );

                          return MediaQuery(
                            data: MediaQuery.of(context).copyWith(
                                navigationMode: NavigationMode.directional),
                            child: ResponsiveBreakpoints.builder(
                              child: GlowTheme(
                                lightTheme: theme,
                                child: child!,
                              ),
                              useShortestSide: true,
                              debugLog: true,
                              breakpoints: [
                                const Breakpoint(
                                    start: 801, end: 1920, name: DESKTOP),
                                const Breakpoint(
                                  start: 1921,
                                  end: double.infinity,
                                  name: '4K',
                                ),
                              ],
                            ),
                          );
                        },
                        localizationsDelegates: const [
                          GlobalMaterialLocalizations.delegate,
                          GlobalWidgetsLocalizations.delegate,
                          GlobalCupertinoLocalizations.delegate,
                          DefaultWidgetsLocalizations.delegate,
                        ],
                        supportedLocales:
                            getIt<RemoteLabels>().supportedLocales,
                        locale: getIt<RemoteLabels>().locale,
                        theme: AppTheme.theme.copyWith(),
                        home: SplashScreenPage(),
                      ),
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
