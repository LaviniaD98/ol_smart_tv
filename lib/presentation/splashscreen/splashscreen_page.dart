import 'package:open_learning_smart_tv/core/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_learning_smart_tv/presentation/splashscreen/cubit/splash_screen_cubit.dart';

import '../corporate_code/corporate_code_page.dart';

class SplashScreenPage extends StatefulWidget {
  static String routeName = 'splashscreen';
  const SplashScreenPage({super.key});
  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      context.read<SplashScreenCubit>().videoEnd();
    } else if (state == AppLifecycleState.paused) {}
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size * 0.8;
    var aspectRatio = 0.15;

    return Container(
      alignment: Alignment.center,
      color: Colors.transparent,
      child: BlocConsumer<SplashScreenCubit, SplashScreenState>(
        listener: (context, state) => state.whenOrNull(
          error: () => SvgPicture.asset(
            "assets/images/app_logo.svg",
            width: size.width,
            height: size.width * aspectRatio,
          ),
          end: (enterOffline) {
            Nav.pushAndRemoveUntil(
              context,
              screen: const CorporateCodePage(),
            );
            return;
          },
        ),
        builder: (context, state) => state.maybeWhen(
          initial: () {
            Future.delayed(const Duration(milliseconds: 2000), () {
              if (context.mounted) {
                context.read<SplashScreenCubit>().videoEnd();
              }
            });

            return SvgPicture.asset(
              "assets/images/app_logo.svg",
              width: size.width,
              height: size.width * aspectRatio,
            );
          },
          /* NativeVideoView(
                    keepAspectRatio: true,
                    showMediaController: false,
                    onCreated: (controller) {
                      onVideoControllerCreated(controller);
                      controller.setVideoSource(
                        'assets/videos/video.mp4',
                        sourceType: VideoSourceType.asset,
                      );
                    },
                    onPrepared: (controller, info) {
                      controller.play();
                    },
                    onError: (controller, what, extra, message) {
                      context.read<SplashScreenCubit>().videoError();
                    },
                    onCompletion: (controller) {
                      context.read<SplashScreenCubit>().videoEnd();
                    },
                    onProgress: (progress, duration) {},
                  ),*/
          orElse: () => SvgPicture.asset(
            "assets/images/app_logo.svg",
            width: size.width,
            height: size.width * aspectRatio,
          ),
        ),
      ),
    );
  }
}
