import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_learning_smart_tv/app_manager.dart';
import 'package:open_learning_smart_tv/core/dependency_injection/dependency_injection.dart';
import 'package:open_learning_smart_tv/core/utils/nav.dart';
import 'package:open_learning_smart_tv/domain/entities/smart_configurator/smart_configurator_model.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_button.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/favorites/favourite_button_page.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/rating/rating_button_page.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/rating/rating_cubit.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/widgets/image/faded_banner_image.dart';
import 'package:open_learning_smart_tv/presentation/main/main_state_cubit.dart';

import '../../../color_management/color_manager.dart';
import '../../../domain/entities/detail/detail_page_model.dart';
import '../../../domain/enums/types.dart';
import '../../../remote_theming/labels/labels_manager.dart';
import '../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../theme/app_theme.dart';
import '../../common/widgets/dialog/ol_alert_dialog.dart';
import '../../common/widgets/glow_progress_bar/glow_progress_bar.dart';
import '../../common/widgets/tag/status_tag.dart';
import '../../common/widgets/tag/topic_tag.dart';
import '../common/course_logic.dart';
import '../common/lo_types.dart';
import '../cubit/detail_page_cubit.dart';
import '../detail_page.dart';
import '../ecm/registration/ecm_registration_page.dart';
import 'badge_icon.dart';
import '../../../core/utils/extension.dart';

class DynamicSliverDetailHeader extends StatefulWidget {
  final DetailPageModel model;
  final DetailPageArgs args;
  final bool isSliver;
  final SmartConfiguratorModel? smartConfig;
  final ValueNotifier<RightPanelState> rightPanelState;

  const DynamicSliverDetailHeader({
    super.key,
    this.isSliver = true,
    required this.model,
    required this.args,
    required this.rightPanelState,
    this.smartConfig,
  });

  @override
  DynamicSliverDetailHeaderState createState() =>
      DynamicSliverDetailHeaderState();
}

class DynamicSliverDetailHeaderState extends State<DynamicSliverDetailHeader> {
  final GlobalKey _childKey = GlobalKey();
  double? height;

  final focusNode = OlFocusScopeNode(id: 'DetailHeaderActionButtons');

  objLOCharacterization get _loCharacterization =>
      CourseLogic().loCharacterizationNew(
        status: widget.model.status ?? "",
        learningObjectType: widget.model.learningObjectType,
        learningObjectTypology: widget.model.learningObjectTypology,
        percentageOfCompletion: widget.model.percentageOfCompletion ?? "0",
        enrollType: widget.model.enrollType ?? EnrollType.autoEnroll,
        ecmSpecialization: widget.model.ecmSpecialization,
        ecmRegistration: widget.model.ecmRegistration,
      );

  String get _durationString =>
      CourseLogic().getDurationString(widget.model.duration);

  String get _dateString {
    if (widget.model.ecmSpecialization == true) {
      return CourseLogic().getEcmDurationStringDate(
          widget.model.ecmStartDate, widget.model.ecmEndDate);
    }
    if (widget.model.isToj() && widget.model.meetingDetails != null) {
      return CourseLogic().getTojDurationStringDate(
          widget.model.meetingDetails?.startDate,
          widget.model.meetingDetails?.endDate);
    }
    final date =
        CourseLogic().getExpirationStringDate(widget.model.expirationDate);

    if (date.contains('9999')) {
      return '';
    }
    return date;
  }

  bool get showStatus => (widget.model.iconStatus != IconStatus.idle ||
      widget.model.status == "E");

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (mounted) {
        setState(() {
          height = (_childKey.currentContext?.findRenderObject() as RenderBox?)
              ?.size
              .height;
        });
      }
    });

    widget.args.object?.isFavourite = widget.model.isFavourite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final child = SizedBox(
      height: height,
      width: 870,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 200,
            right: 0,
            top: 50,
            bottom: 200,
            child: _background,
          ),
          _foreground()
        ],
      ),
    );
    if (widget.isSliver) {
      return SliverToBoxAdapter(child: child);
    }
    return child;
  }

  Widget _foreground() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.hViewPadding),
      child: Column(
        key: _childKey,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Type - Typology - Title
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 12,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  /// Status tag
                  _getStatusTag,
                  RichText(
                    text: TextSpan(
                      children: [
                        /// Type Label
                        TextSpan(
                          text: (widget.model.ecmSpecialization
                                  ? widget.model.ecmType ?? ''
                                  : widget.model.learningObjectType
                                      .getTranslatedValue())
                              .toUpperCase(),
                          style: AppTextTheme.body(
                            color: ColorManager().getColorTextMandatory(),
                            weight: FontWeight.bold,
                          ),
                        ),
                        if (!widget.model.ecmSpecialization) ...[
                          TextSpan(
                            text: ' | ',
                            style: AppTextTheme.body(
                              color: ColorManager().getColorTextPrimary(),
                              weight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: widget.model.learningObjectTypology
                                .getTranslatedValue()
                                .toUpperCase(),
                            style: AppTextTheme.body(
                              color: ColorManager().getColorTextPrimary(),
                              weight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ],
                    ),
                    maxLines: 1,
                  ),
                ],
              ),

              /// Title
              if (widget.model.title != null) ...[
                const SizedBox(height: 6),
                Text(
                  widget.model.title!,
                  style: AppTextTheme.title(
                    color: ColorManager().getColorTextPrimary(),
                    weight: FontWeight.bold,
                    size: 56,
                  ),
                ),
              ],
            ],
          ),

          /// Topics
          if (widget.model.topicTags != null &&
              widget.model.topicTags!.isNotEmpty) ...[
            const SizedBox(height: 32),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                ...(widget.model.topicTags ?? []).map(
                  (e) => TopicTag(
                    label: e,
                    isBig: true,
                    boxFit: BoxFit.fitWidth,
                    color: ColorManager()
                        .getColorSystemSecondary05()
                        .withValues(alpha: .6),
                  ),
                ),
              ],
            ),
          ],

          /// Short description
          if (widget.model.shortDescription != null) ...[
            const SizedBox(height: 32),
            Text(
              widget.model.shortDescription!,
              style: AppTextTheme.body(
                color: ColorManager().getColorTextPrimary(),
                size: 24,
                weight: FontWeight.w500,
              ),
            )
          ],

          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Wrap(
              spacing: 24,
              children: [
                if (_durationString.isNotEmpty) ...[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox.square(
                        dimension: Dimens.spacingL,
                        child: SvgPicture.asset(
                          'assets/icons/detail/dettaglio_tempo.svg',
                          colorFilter: ColorFilter.mode(
                            ColorManager().getColorTextPrimary(),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      const SizedBox(width: Dimens.spacingXS),
                      Text(
                        _durationString,
                        style: AppTextTheme.caption(
                          color: ColorManager().getColorTextPrimary(),
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ],
                if (_dateString.isNotEmpty) ...[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox.square(
                        dimension: 22.0,
                        child: SvgPicture.asset(
                          'assets/icons/calendar.svg',
                          colorFilter: ColorFilter.mode(
                            ColorManager().getColorTextPrimary(),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      const SizedBox(width: Dimens.spacingXS),
                      Text(
                        _dateString,
                        style: AppTextTheme.caption(
                          color: ColorManager().getColorTextPrimary(),
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),

          if (widget.model.isToj() &&
              widget.model.meetingDetails?.meetingNumber != null) ...[
            Padding(
              padding: const EdgeInsets.only(top: Dimens.spacingXXS),
              child: Row(
                children: [
                  SizedBox.square(
                    dimension: 22.0,
                    child: SvgPicture.asset(
                      'assets/icons/meeting.svg',
                      colorFilter: ColorFilter.mode(
                        ColorManager().getColorTextPrimary(),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  const SizedBox(width: Dimens.spacingXS),
                  Expanded(
                    child: Text(
                      CourseLogic().getMeetingString(
                          widget.model.meetingDetails?.meetingNumber),
                      style: AppTextTheme.caption(
                        color: ColorManager().getColorTextPrimary(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],

          CallbackShortcuts(
            bindings: <ShortcutActivator, VoidCallback>{
              const SingleActivator(LogicalKeyboardKey.arrowRight): () {
                final hasNextFocus =
                    focusNode.focusInDirection(TraversalDirection.right);

                if (!hasNextFocus) {
                  context
                      .read<DetailPageCubit>()
                      .rightPanelNode
                      ?.requestFocus();
                }
              },
              const SingleActivator(LogicalKeyboardKey.arrowLeft): () {
                final res = focusNode.focusInDirection(TraversalDirection.left);

                if (res == false) {
                  if (manager.currentTabNavKey?.currentState?.canPop() ??
                      false) {
                    final mainState = context.read<MainStateCubit>();
                    mainState.setNestedFocusNode(focusNode);
                    final focus = mainState.state;
                    focus.requestFocus();
                  }
                }
              }
            },
            child: FocusScope(
              node: focusNode,
              onFocusChange: (value) {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      //if (widget.smartConfig?.funcFavourites == true) ...[

                      if (widget.args.object != null) ...[
                        FavoriteButton(
                          object: widget.args.object!,
                          parentId: widget.args.parentId,
                          grandParentId: widget.args.grandParentId,
                        ),
                      ],

                      const SizedBox(width: 24),
                      //],

                      //if (widget.smartConfig?.funcRating == true) ...[
                      BlocProvider(
                        create: (_) => getIt<RatingCubit>()..init(widget.model),
                        child: RatingButton(
                          detailPageModel: widget.model,
                          parentId: widget.args.parentId,
                          grandParentId: widget.args.grandParentId,
                        ),
                      ),
                      //],

                      /// Progress bar and info
                      if (CourseLogic().getCompletionPercentageFromString(
                              widget.model.percentageOfCompletion) >
                          0) ...[
                        Expanded(
                          child: Column(
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: LabelsManager()
                                          .getRemoteStringFromLabelKeys(
                                        RemoteLabelKeys.percentageOfCompletion,
                                      ),
                                      style: AppTextTheme.body(
                                        color: ColorManager()
                                            .getColorTextPrimary(),
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          ' ${double.parse(widget.model.percentageOfCompletion!.replaceAll("%", "")).toStringAsFixed(0)}%',
                                      style: AppTextTheme.body(
                                        color: ColorManager()
                                            .getColorTextPrimary(),
                                        weight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: Dimens.spacingXS),
                              GlowProgressBar(
                                percentage: CourseLogic()
                                    .getCompletionPercentageFromString(
                                  widget.model.percentageOfCompletion,
                                ),
                                withFactor: .8,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 32),

                  /// Buttons
                  buildActionButtons(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.only(top: Dimens.spacingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              OLButton(
                width: 340,
                key: const Key('loginForm_continue_raisedButton'),
                onFocusChanded: (hasFocus) {
                  if (hasFocus) {
                    widget.rightPanelState.value = RightPanelState.start;
                  }
                },
                id: 'BUTTON DETAILS CONTINUE',
                title: CourseLogic()
                    .loCharacterizationNew(
                      status: widget.model.status ?? "",
                      learningObjectType: widget.model.learningObjectType,
                      learningObjectTypology:
                          widget.model.learningObjectTypology,
                      percentageOfCompletion:
                          widget.model.percentageOfCompletion ?? "0",
                      enrollType:
                          widget.model.enrollType ?? EnrollType.autoEnroll,
                      // TODO(UmbertoGrimaldi): FARE AGGIUNGERE QUESTI
                      ecmSpecialization: widget.model.ecmSpecialization,
                      ecmRegistration: widget.model.ecmRegistration,
                    )
                    .buttonTitle,
                onPressed: !_loCharacterization.buttonEnabled
                    ? null
                    : () async {
                        int idToAE = widget.model.id!;
                        if (widget.args.grandParentId != null) {
                          idToAE = int.parse(widget.args.grandParentId!);
                        } else if (widget.args.parentId != null) {
                          idToAE = int.parse(widget.args.parentId!);
                        }
                        switch (_loCharacterization.objLOAction) {
                          case ObjLOAction.none:
                          case ObjLOAction.notApplicable:
                            break;
                          case ObjLOAction.startFruition:
                            String parentId = (widget.args.parentId == null ||
                                    widget.args.parentId!.toLowerCase() ==
                                        "null")
                                ? widget.model.id!.toString()
                                : widget.args.parentId!;
                            context
                                .read<DetailPageCubit>()
                                .getStartOrResumeModel(widget.model.id!,
                                    parentId, widget.model, null);
                            break;
                          case ObjLOAction.autoEnrollmentBottom:
                            context
                                .read<DetailPageCubit>()
                                .executeAutoEnrollment(widget.args, idToAE,
                                    "BOTTOM", widget.model, false);
                            break;
                          case ObjLOAction.autoEnrollmentAuto:
                            context
                                .read<DetailPageCubit>()
                                .executeAutoEnrollment(widget.args, idToAE,
                                    "AUTO", widget.model, true);
                            break;
                          case ObjLOAction.autoEnrollmentWithPatch:
                          case ObjLOAction.seeEditions:
                            context
                                .read<DetailPageCubit>()
                                .selectEditionsIfPresentIndex(
                                    widget.args, widget.model);
                            break;
                          case ObjLOAction.ecmNotRegistered:
                            final res = await Nav.push(context,
                                screen: EcmRegistrationPage(
                                  EcmRegistrationPageArgs(
                                    enrollId: widget.model.enrollId,
                                    loId: widget.model.id,
                                    sponsors: widget.model.sponsors ?? [],
                                  ),
                                ));

                            if (res != null && res && context.mounted) {
                              // ignore: use_build_context_synchronously
                              context.read<DetailPageCubit>().init(widget.args);
                            }
                            break;
                          case ObjLOAction.showDetailMaterials:
                          case ObjLOAction.showDetailGoals:
                          case ObjLOAction.showDetailFinalBalance:
                            String parentId = (widget.args.parentId == null ||
                                    widget.args.parentId!.toLowerCase() ==
                                        "null")
                                ? widget.model.id!.toString()
                                : widget.args.parentId!;
                            context
                                .read<DetailPageCubit>()
                                .getStartOrResumeModel(widget.model.id!,
                                    parentId, widget.model, null);
                            break;
                          case ObjLOAction.showDetailMeeting:
                            OlAlertDialog.show(
                              context,
                              title: LabelsManager()
                                  .getRemoteStringFromLabelKeys(
                                      RemoteLabelKeys.show_info),
                              message: LabelsManager()
                                  .getRemoteStringFromLabelKeys(
                                      RemoteLabelKeys.from_meeting_info),
                              actionLabel: LabelsManager()
                                  .getRemoteStringFromLabelKeys(
                                      RemoteLabelKeys.ok),
                            );
                            break;
                        }
                      },
              ),

              const SizedBox(width: Dimens.spacingS),

              /// Button
              BadgeIcon(
                  hasBadge: (widget.model.badge != null ||
                      widget.model.certificate != null),
                  isCompleted: widget.model.status == "C"),
            ],
          ),
          const SizedBox(height: 16),
          if (!widget.model.isLearningActivity()) ...[
            Align(
              alignment: Alignment.centerLeft,
              child: CallbackShortcuts(
                bindings: <ShortcutActivator, VoidCallback>{
                  const SingleActivator(LogicalKeyboardKey.arrowRight): () {},
                },
                child: OLButton(
                  title: 'Dettagli',
                  width: 340,
                  outline: true,
                  onFocusChanded: (hasFocus) {
                    if (hasFocus) {
                      widget.rightPanelState.value = RightPanelState.details;
                    }
                  },
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget get _background {
    const placeholder = SizedBox.shrink();
    if (widget.model.coverVideoPublicURL?.isNotEmpty == true) {
      return FadedBannerImage(
        urlVideo: widget.model.coverVideoPublicURL!,
        source: 'DynamicSliverDetailHeader - VIDEO',
      );
    } else if (widget.model.coverPublicURL != null &&
        widget.model.coverPublicURL!.isNotEmpty) {
      return FadedBannerImage(
        source: 'DynamicSliverDetailHeader',
        urlImage: widget.model.coverPublicURL!,
      );
    } else {
      return placeholder;
    }
  }

  Widget get _getStatusTag {
    if (widget.model.status == "E" &&
        (widget.model.learningObjectTypology ==
                LearningObjectTypology.physicalClass ||
            widget.model.learningObjectTypology ==
                LearningObjectTypology.virtualClass)) {
      return StatusTag(
        backgroundColor: ColorManager().getColorBorderAccent(),
        height: 40,
        width: 100,
        child: Text(
          LabelsManager()
              .getRemoteStringFromLabelKeys(RemoteLabelKeys.registered),
          style: AppTextTheme.body(
            color: ColorManager().getColorTextPrimaryAlternative(),
            weight: FontWeight.w500,
            size: 16,
          ),
        ),
      );
    }
    if (widget.model.iconStatus == IconStatus.idle) {
      return const SizedBox.shrink();
    }

    return StatusTag.svg(
      backgroundColor: widget.model.iconStatus.color,
      svgPath: widget.model.iconStatus.svgPath!,
      height: 40.0,
      width: 40.0,
    );
  }
}
