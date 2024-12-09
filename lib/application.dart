import 'package:flutter/services.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/text_field_input.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/cubit/favorites_content_cubit.dart';
import 'package:open_learning_smart_tv/presentation/main/main_state_cubit.dart';
import 'package:open_learning_smart_tv/presentation/splashscreen/cubit/splash_screen_cubit.dart';

import 'package:open_learning_smart_tv/presentation/splashscreen/splashscreen_page.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_learning_smart_tv/core/dependency_injection/dependency_injection.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:open_learning_smart_tv/theme/glow/theme/glow_theme.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'presentation/app_state/cubit/app_cubit.dart';
import 'presentation/corporate_code/cubit/corporate_code_cubit.dart';
import 'presentation/dynamic_content/strip/continue_learning/cubit/continue_learning_strip_cubit.dart';
import 'presentation/dynamic_content/strip/favourites/cubit/favourites_strip_cubit.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  void initState() {
    super.initState();
  }

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
        BlocProvider<FavouritesStripCubit>(
          create: (_) => getIt<FavouritesStripCubit>(),
        ),
        BlocProvider<ContinueLearningStripCubit>(
          create: (_) => getIt<ContinueLearningStripCubit>(),
        ),
        BlocProvider<SplashScreenCubit>(
            create: (_) => getIt<SplashScreenCubit>()),
        BlocProvider(
          create: (_) => getIt<CorporateCodeCubit>()..init(false),
        ),
        BlocProvider(
          create: (_) => getIt<FavoritesContentCubit>(),
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
                  return Shortcuts(
                    shortcuts: <LogicalKeySet, Intent>{
                      LogicalKeySet(LogicalKeyboardKey.select):
                          const ActivateIntent(),
                      LogicalKeySet(LogicalKeyboardKey.enter):
                          const ActivateIntent(),
                      LogicalKeySet(LogicalKeyboardKey.goBack):
                          const BackIntent(),
                    },
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
                      supportedLocales: getIt<RemoteLabels>().supportedLocales,
                      locale: getIt<RemoteLabels>().locale,
                      theme: AppTheme.theme.copyWith(),
                      home: const SplashScreenPage(),
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
