import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/core/dependency_injection/dependency_injection.dart';
import 'package:open_learning_smart_tv/core/utils/nav.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/course_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_icon_button.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/ol_alert_dialog.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/common/course_logic.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/common/lo_types.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/course_detail_horizontal_modules.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/cubit/detail_page_cubit.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/detail_page.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/favorites/favourite_button_page.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/rating/rating_cubit.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:open_learning_smart_tv/theme/glow/widget/glow_container.dart';
import 'package:video_player/video_player.dart';

import '../../../color_management/color_manager.dart';
import '../../../theme/app_theme.dart';
import '../../course_detail/rating/rating_button_page.dart';
import 'video_player_widget.dart';
import 'video_progress_widget.dart';
import 'video_scrubber_widget.dart';

class VideoOverlayWidget extends StatefulWidget {
  final VideoPlayerController controller;

  final VoidCallback? onFullScreen;
  final VideoPlayerArgs args;
  final ScrubberActionsArgs? scrubberActionsArgs;

  const VideoOverlayWidget({
    super.key,
    required this.controller,
    required this.args,
    this.scrubberActionsArgs,
    this.onFullScreen,
  });

  @override
  State<VideoOverlayWidget> createState() => VideoOverlayWidgetState();
}

class VideoOverlayWidgetState extends State<VideoOverlayWidget> {
  static const _iconSize = 28.0;
  late bool isPortrait;
  ValueNotifier<bool> showInfo = ValueNotifier(false);
  ValueNotifier<bool> bottomListHasFocus = ValueNotifier(false);
  ValueNotifier<bool> isPlaying = ValueNotifier(false);
  ValueNotifier<int> progressNotifier = ValueNotifier(0);
  FocusScopeNode focusNode = FocusScopeNode();

  Timer? _hideTimer;

  bool isSeeking = false;

  @override
  void initState() {
    super.initState();

    isPlaying.value = widget.controller.value.isPlaying;
    progressNotifier.value = widget.controller.value.position.inMilliseconds;

    Future.delayed(const Duration(milliseconds: 300), () {
      focusNode.requestFocus();
      setTimer();
    });

    widget.controller.addListener(handleProgressUpdate);
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    _hideTimer = null;
    widget.controller.removeListener(handleProgressUpdate);
    super.dispose();
  }

  void handleProgressUpdate() {
    isPlaying.value = widget.controller.value.isPlaying;
    progressNotifier.value = widget.controller.value.position.inMilliseconds;
  }

  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: <ShortcutActivator, VoidCallback>{
        const SingleActivator(LogicalKeyboardKey.play): () {
          widget.controller.play();
          setTimer();
        },
        const SingleActivator(LogicalKeyboardKey.pause): () {
          widget.controller.pause();
          showInfo.value = true;
        },
        const SingleActivator(LogicalKeyboardKey.arrowLeft): () {
          setTimer();

          if (focusNode.focusedChild?.id == 'VIDEO-PROGRESS') {
            widget.controller.seekTo(
                widget.controller.value.position - const Duration(seconds: 10));
          } else {
            focusNode.focusInDirection(TraversalDirection.left);
          }
        },
        const SingleActivator(LogicalKeyboardKey.arrowRight): () {
          setTimer();

          if (focusNode.focusedChild?.id == 'VIDEO-PROGRESS') {
            widget.controller.seekTo(
                widget.controller.value.position + const Duration(seconds: 10));
          } else {
            focusNode.focusInDirection(TraversalDirection.right);
          }
        },
        // const SingleActivator(LogicalKeyboardKey.select): handleEnterButton,
        // const SingleActivator(LogicalKeyboardKey.enter): handleEnterButton,
        const SingleActivator(LogicalKeyboardKey.arrowUp): () {
          setTimer();
          focusNode.focusInDirection(TraversalDirection.up);
        },
        const SingleActivator(LogicalKeyboardKey.arrowDown): () {
          setTimer();
          focusNode.focusInDirection(TraversalDirection.down);
        },
      },
      child: FocusScope(
        node: focusNode,
        child: ValueListenableBuilder<bool>(
            valueListenable: showInfo,
            builder: (context, show, _) {
              return AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: 1, // show ? 1 : 0,
                child: IgnorePointer(
                  ignoring: !show,
                  child: ValueListenableBuilder(
                      valueListenable: bottomListHasFocus,
                      builder: (context, value, _) {
                        return Stack(
                          children: [
                            Column(
                              children: [
                                _topOverlay,
                                const Spacer(),
                              ],
                            ),
                            AnimatedPositioned(
                              bottom: value ? 0 : -190,
                              left: 0,
                              right: 0,
                              duration: const Duration(milliseconds: 200),
                              child: _bottomOverlay,
                            ),
                          ],
                        );
                      }),
                ),
              );
            }),
      ),
    );
  }

  void handleEnterButton() {
    if (focusNode.focusedChild?.id == 'VIDEO-CONTROLS') {
      if (widget.controller.value.isPlaying) {
        widget.controller.pause();
      } else {
        widget.controller.play();
      }
    } else if (focusNode.focusedChild?.id == 'VIDEO-DETAILS') {
      OlAlertDialog.showDetails(
        context,
        color: OLColors.backgroundPrimary.withValues(alpha: 0.8),
        title: 'Dettagli del modulo',
        subtitle: LabelsManager()
            .getRemoteStringFromLabelKeys(RemoteLabelKeys.what_to_expect),
        message: widget.args.currentObject?.longDescription ?? '',
        actionsHidden: true,
        minHeight: 500,
        actionLabel:
            LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.retry),
      );
    }
    setTimer();
  }

  void setTimer() {
    if (!showInfo.value) {
      showInfo.value = true;
    }

    _hideTimer?.cancel();
    _hideTimer = null;
    _hideTimer = Timer(const Duration(seconds: 10), () {
      showInfo.value = false;
    });
  }

  Widget get _topOverlay {
    return Container(
      height: 257,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            AppColors.black.withValues(alpha: 0),
            AppColors.black,
          ],
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 84,
        vertical: 71,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if (widget.args.type != null && widget.args.typology != null)
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: widget.args.type!.value.toUpperCase(),
                    style: AppTextTheme.caption(
                      weight: FontWeight.w700,
                      size: 20,
                      color: ColorManager().getColorTextMandatory(),
                    ),
                  ),
                  TextSpan(
                    text: ' | ',
                    style: AppTextTheme.caption(weight: FontWeight.w700),
                  ),
                  TextSpan(
                    text: widget.args.typology!.value.toUpperCase(),
                    style: AppTextTheme.caption(
                      weight: FontWeight.w700,
                      size: 20,
                      color: ColorManager().getColorTextPrimary(),
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: Dimens.spacingXXS),
          Text(
            widget.args.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextTheme.caption(
              weight: FontWeight.w700,
              size: 48,
            ),
          ),
        ],
      ),
    );
  }

  Widget get _bottomOverlay {
    return Container(
      height: 530,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.black.withValues(alpha: 0),
            AppColors.black,
          ],
        ),
      ),
      //padding: const EdgeInsets.all(Dimens.spacingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const SizedBox(height: 32),
          Row(
            children: [
              const SizedBox(width: Dimens.hViewPadding),
              controls,
              const SizedBox(width: 32),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    details,
                    const SizedBox(width: 16),
                    if (widget.args.detailModel != null) ...[
                      BlocProvider(
                        create: (_) => getIt<RatingCubit>()
                          ..init(widget.args.detailModel!),
                        child: RatingButton(
                          detailPageModel: widget.args.detailModel!,
                          parentId: widget.args.parentId,
                          grandParentId: widget.args.grandParentId,
                          size: 70,
                          radius: 8,
                          iconSize: 54,
                          outline: false,
                          completion: () {
                            setTimer();
                          },
                        ),
                      ),
                    ],
                    if (widget.args.currentObject != null) ...[
                      const SizedBox(width: 16),
                      FavoriteButton(
                        object: widget.args.currentObject!,
                        parentId: widget.args.parentId,
                        grandParentId: widget.args.grandParentId,
                        size: 70,
                        radius: 8,
                        outline: false,
                        iconSize: 30,
                        completion: () {
                          setTimer();
                        },
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 55),
              const SizedBox(width: Dimens.hViewPadding),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              const SizedBox(width: Dimens.hViewPadding),
              Expanded(
                child: VideoProgressWidget(
                  widget.controller,
                  scrubberActionsArgs: widget.scrubberActionsArgs,
                  colors: VideoProgressColors(
                    backgroundColor: ColorManager().getColorBorder(),
                    bufferedColor: ColorManager().getColorSystemPrimary01(),
                    playedColor: ColorManager().getColorSystemSecondary01(),
                  ),
                ),
              ),
              const SizedBox(width: 84),
              ValueListenableBuilder<int>(
                valueListenable: progressNotifier,
                builder: (context, value, _) {
                  return SizedBox(
                    width: 200,
                    child: Text(
                      getPosition(value),
                      style: AppTextTheme.caption(
                        color: ColorManager().getColorTextPrimary(),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(width: Dimens.hViewPadding),
            ],
          ),
          Expanded(child: getHorizontalList())
        ],
      ),
    );
  }

  Widget getHorizontalList() {
    if (widget.args.detailModel != null) {
      if ((widget.args.detailModel!.courses?.isNotEmpty == true) ||
          (widget.args.detailModel!.learningActivities?.isNotEmpty == true)) {
        var loCharacterization = CourseLogic().loCharacterizationNew(
          status: widget.args.detailModel?.status ?? "",
          learningObjectType: widget.args.detailModel!.learningObjectType,
          learningObjectTypology:
              widget.args.detailModel!.learningObjectTypology,
          percentageOfCompletion:
              widget.args.detailModel?.percentageOfCompletion ?? "0",
          enrollType:
              widget.args.detailModel?.enrollType ?? EnrollType.autoEnroll,
          ecmSpecialization: widget.args.detailModel!.ecmSpecialization,
          ecmRegistration: widget.args.detailModel!.ecmRegistration,
        );

        final count = (widget.args.detailModel?.courses?.length ?? 0) +
            (widget.args.detailModel!.learningActivities?.length ?? 0);

        final label = LabelsManager()
            .getRemoteStringFromLabelKeys(RemoteLabelKeys.activity_other)
            .replaceFirst('{{count}}', count.toString());
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 56),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: IntrinsicWidth(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: AppTextTheme.body(
                        color: ColorManager().getColorTextPrimary(),
                        weight: FontWeight.w500,
                        size: 24,
                      ),
                    ),
                    const SizedBox(height: 4),
                    GlowContainer(
                      height: 4,
                      width: 240,
                      color: ColorManager().getColorTextPrimary(),
                      glowColor: ColorManager().getColorTextPrimary(),
                      borderRadius: BorderRadius.circular(8),
                      child: const SizedBox(height: 4),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: Divider(
                height: 1,
                thickness: 1,
                color: Colors.white,
              ),
            ),
            FocusScope(
              onFocusChange: (value) {
                bottomListHasFocus.value = value;
              },
              child: CourseDetailHorizontalModules(
                model: widget.args.detailModel!,
                isSubActivitites: false,
                parentId: widget.args.parentId,
                onResumeButtonFocused: (ll, cc, _) {},
                onLearningActivityFocused: (cc) async {},
                onButtonPressed: (
                  int index,
                  bool isACourse,
                  LearningObjectModel? ll,
                  CourseModel? cc,
                ) {
                  if (!showInfo.value) {
                    return;
                  }
                  if (widget.args.currentObject != null &&
                      widget.args.currentObject?.id == ll?.id) {
                    return;
                  }
                  if (loCharacterization.buttonEnabled &&
                      (loCharacterization.objLOAction != ObjLOAction.none &&
                          loCharacterization.objLOAction !=
                              ObjLOAction.notApplicable)) {
                    int idToAE = widget.args.detailModel!.id!;
                    if (widget.args.grandParentId != null) {
                      idToAE = int.parse(widget.args.grandParentId!);
                    } else if (widget.args.parentId != null) {
                      idToAE = int.parse(widget.args.parentId!);
                    }

                    switch (loCharacterization.objLOAction) {
                      case ObjLOAction.none:
                      case ObjLOAction.notApplicable:
                        //do nothing
                        break;
                      case ObjLOAction.startFruition:
                        if (isACourse) {
                          CourseModel cm = widget.args.detailModel!.courses!
                              .where((element) => element.id == index)
                              .single;
                          startOrResumeCheck(context, cm.id!);
                        } else {
                          LearningObjectModel lm = widget
                              .args.detailModel!.learningActivities!
                              .where((element) => element.id == index)
                              .single;
                          startOrResumeCheck(context, lm.id);
                        }
                        break;
                      case ObjLOAction.autoEnrollmentBottom:
                        context.read<DetailPageCubit>().executeAutoEnrollment(
                            widget.args.args,
                            idToAE,
                            "BOTTOM",
                            widget.args.detailModel!,
                            false);
                        break;
                      case ObjLOAction.autoEnrollmentAuto:
                        context.read<DetailPageCubit>().executeAutoEnrollment(
                            widget.args.args,
                            idToAE,
                            "AUTO",
                            widget.args.detailModel!,
                            true);
                        break;
                      case ObjLOAction.autoEnrollmentWithPatch:
                      case ObjLOAction.seeEditions:
                        String? id =
                            ll != null ? ll.id.toString() : cc?.id.toString();
                        if (id != null) {
                          Nav.push(
                            context,
                            screen: DetailPage(
                              args: DetailPageArgs(
                                id: id,
                                object: ll,
                                parentId:
                                    widget.args.detailModel?.id.toString(),
                                typology: widget
                                    .args.detailModel!.learningObjectTypology,
                                grandParentId: widget.args.parentId,
                                parent: widget.args.detailModel!,
                                source: widget.args.args.source,
                              ),
                            ),
                          );
                        }
                        break;
                      case ObjLOAction.ecmNotRegistered:
                        if (kDebugMode) print('ECM module');
                        break;
                      case ObjLOAction.showDetailMaterials:
                      case ObjLOAction.showDetailGoals:
                      case ObjLOAction.showDetailFinalBalance:
                        int? id = ll != null ? ll.id : cc?.id;

                        if (id != null) {
                          context.read<DetailPageCubit>().getStartOrResumeModel(
                                id,
                                '${widget.args.detailModel?.id}',
                                widget.args.detailModel!,
                                context,
                              );
                        }

                        break;
                      case ObjLOAction.showDetailMeeting:
                        OlAlertDialog.show(
                          context,
                          title: LabelsManager().getRemoteStringFromLabelKeys(
                              RemoteLabelKeys.show_info),
                          message: LabelsManager().getRemoteStringFromLabelKeys(
                              RemoteLabelKeys.from_meeting_info),
                          actionLabel: LabelsManager()
                              .getRemoteStringFromLabelKeys(RemoteLabelKeys.ok),
                        );
                        break;
                    }
                  }
                },
              ),
            ),
          ],
        );
      }
    }

    return const SizedBox.shrink();
  }

  void startOrResumeCheck(
    BuildContext context,
    int loId,
  ) {
    String parentId = (widget.args.parentId == null ||
            widget.args.parentId!.toLowerCase() == "null")
        ? loId.toString()
        : widget.args.parentId!;
    context.read<DetailPageCubit>().getStartOrResumeModel(
          loId,
          parentId,
          widget.args.detailModel!,
          context,
        );
  }

  Widget get controls {
    return ValueListenableBuilder(
      valueListenable: isPlaying,
      builder: (context, isPlaying, _) {
        return OLIconButton(
          id: 'VIDEO-CONTROLS',
          size: 85,
          radius: 12,
          iconColor: Colors.white,
          image: isPlaying ? 'assets/icons/pause.svg' : 'assets/icons/play.svg',
          onPressed: () {
            if (isPlaying) {
              widget.controller.pause();
            } else {
              widget.controller.play();
            }
            setTimer();
          },
          outline: true,
        );
      },
    );
  }

  Widget get audio {
    final isMute = widget.controller.value.volume < 1.0;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => widget.controller.setVolume(isMute ? 1 : 0),
      child: SvgPicture.asset(
        isMute ? 'assets/icons/audio_off.svg' : 'assets/icons/audio_on.svg',
        height: _iconSize,
        colorFilter: ColorFilter.mode(
            ColorManager().getColorSystemPrimary01(), BlendMode.srcIn),
      ),
    );
  }

  Widget get details {
    return OLIconButton(
      id: 'VIDEO-DETAILS',
      size: 70,
      radius: 8,
      image: 'assets/icons/info.svg',
      onPressed: () {
        OlAlertDialog.showDetails(
          context,
          title: 'Dettagli del modulo',
          subtitle: LabelsManager()
              .getRemoteStringFromLabelKeys(RemoteLabelKeys.what_to_expect),
          message: widget.args.currentObject?.longDescription ?? '',
          actionsHidden: true,
          minHeight: 500,
          actionLabel: LabelsManager()
              .getRemoteStringFromLabelKeys(RemoteLabelKeys.retry),
        );
      },
      outline: false,
    );
  }

  String getPosition(int milliseconds) {
    final position = formatDuration(
      Duration(milliseconds: milliseconds.round()),
    );
    final total = formatDuration(widget.controller.value.duration);
    return '$position / $total';
  }

  String formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;

    final hoursString = '$hours'.padLeft(2, '0');
    final minutesString = '$minutes'.padLeft(2, '0');
    final secondsString = '$seconds'.padLeft(2, '0');
    return '$hoursString:$minutesString:$secondsString';
  }
}
