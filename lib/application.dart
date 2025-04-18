import 'package:flutter/services.dart';
import 'package:open_learning_smart_tv/app_manager.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/core/utils/nav.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/text_field_input.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/ol_alert_dialog.dart';
import 'package:open_learning_smart_tv/presentation/corporate_code/corporate_code_page.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/cubit/favorites_content_cubit.dart';
import 'package:open_learning_smart_tv/presentation/languages/cubit/languages_cubit.dart';
import 'package:open_learning_smart_tv/presentation/languages/languages_page.dart';
import 'package:open_learning_smart_tv/presentation/main/main_state_cubit.dart';
import 'package:open_learning_smart_tv/presentation/splashscreen/cubit/splash_screen_cubit.dart';

import 'package:open_learning_smart_tv/presentation/splashscreen/splashscreen_page.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_learning_smart_tv/core/dependency_injection/dependency_injection.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:open_learning_smart_tv/theme/glow/theme/glow_theme.dart';

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
        BlocProvider(
          create: (_) => getIt<LanguagesCubit>()
            ..init(
              LanguagesPageArgs(
                onChanged: () {
                  getIt<RemoteLabels>().refresh();
                },
              ),
            ),
        ),
      ],
      child: ListenableBuilder(
          listenable: getIt<RemoteLabels>(),
          builder: (context, child) {
            return BlocConsumer<AppCubit, AppState>(
              listener: (context, state) {
                state.maybeMap(
                  initial: (value) {
                    if (value.showPopup == true) {
                      Future.delayed(const Duration(milliseconds: 300), () {
                        OlAlertDialog.show(
                          manager.navKey.currentState!.context,
                          title: LabelsManager().getRemoteStringFromLabelKeys(
                              RemoteLabelKeys.info),
                          message: LabelsManager().getRemoteStringFromLabelKeys(
                              RemoteLabelKeys.session_expired),
                          actionLabel: LabelsManager()
                              .getRemoteStringFromLabelKeys(
                                  RemoteLabelKeys.session_expired_ok_button),
                        ).then((_) {
                          Nav.pushAndRemoveUntil(
                            manager.navKey.currentState!.context,
                            screen: const CorporateCodePage(),
                          );
                        });
                      });
                    }
                  },
                  orElse: () {},
                );
              },
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
                      navigatorKey: manager.navKey,
                      builder: (context, child) {
                        final theme = GlowThemeData(
                          glowColor: ColorManager()
                              .getColorBackgroundPrimaryCta()
                              .withValues(alpha: 0.4),
                          spreadRadius: 1.5,
                          blurRadius: 12,
                          offset: const Offset(0, 0),
                        );

                        return MediaQuery(
                          data: MediaQuery.of(context).copyWith(
                              navigationMode: NavigationMode.directional),
                          child: GlowTheme(
                            lightTheme: theme,
                            child: child ?? const SizedBox(),
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

/*
class MediaKitPlayerWidget extends StatefulWidget {
  final String url;
  const MediaKitPlayerWidget({super.key, required this.url});

  @override
  State<MediaKitPlayerWidget> createState() => _MediaKitPlayerWidgetState();
}

class _MediaKitPlayerWidgetState extends State<MediaKitPlayerWidget> {
  static const videoUrl =
      'https://manifest.prod.boltdns.net/manifest/v1/hls/v4/clear/5660549830001/7b3ac284-e5bc-4daa-a993-1eb94d6ea3f1/10s/master.m3u8?fastly_token=NjgyMmY5ZGRfNmExMzNmZmFiNzhmMGJhMjcyOWNhOTViMWI3M2RmNjRhNzkyNTcwMDhmODdhNTNiZDM2Njg2ODM0MjRlMWU3OA%3D%3D';
  late final Player player;
  late final VideoController controller;

  @override
  void initState() {
    super.initState();
    player = Player();
    controller = VideoController(player);
    player.open(Media(videoUrl));
    player.play();
  }

  void _restart() {
    player.seek(Duration.zero);
    player.play();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Center(child: Video(controller: controller))),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.replay_10),
              onPressed: () => player.seek(
                player.state.position - const Duration(seconds: 10),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.pause),
              onPressed: () => player.pause(),
            ),
            IconButton(
              icon: const Icon(Icons.play_arrow),
              onPressed: () => player.play(),
            ),
            IconButton(
              icon: const Icon(Icons.forward_10),
              onPressed: () => player.seek(
                player.state.position + const Duration(seconds: 10),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.restart_alt),
              onPressed: _restart,
            ),
          ],
        ),
      ],
    );
  }
}
*/
