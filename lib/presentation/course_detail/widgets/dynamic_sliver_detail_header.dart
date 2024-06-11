import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../color_management/color_manager.dart';
import '../../../core/dependency_injection/dependency_injection.dart';
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
import '../trailer/video_player_trailer.dart';
import 'badge_icon.dart';
import 'download_button/cubit/download_item_cubit.dart';
import 'download_button/download_button.dart';
import '../../../core/utils/extension.dart';

class DynamicSliverDetailHeader extends StatefulWidget {
  final DetailPageModel model;
  final DetailPageArgs args;

  const DynamicSliverDetailHeader({
    super. key,
    required this.model,
    required this.args,
  });

  @override
  DynamicSliverDetailHeaderState createState() => DynamicSliverDetailHeaderState();
}

class DynamicSliverDetailHeaderState extends State<DynamicSliverDetailHeader> {
  final GlobalKey _childKey = GlobalKey();
  double? height;

  objLOCharacterization get _loCharacterization => CourseLogic().loCharacterizationNew(
        status: widget.model.status ?? "",
        learningObjectType: widget.model.learningObjectType,
        learningObjectTypology: widget.model.learningObjectTypology,
        percentageOfCompletion: widget.model.percentageOfCompletion ?? "0",
        enrollType: widget.model.enrollType ?? EnrollType.autoEnroll,
        ecmSpecialization: widget.model.ecmSpecialization,
        ecmRegistration: widget.model.ecmRegistration,
      );

  String get _durationString => CourseLogic().getDurationString(widget.model.duration);

  String get _dateString {
    if (widget.model.ecmSpecialization == true) {
      return CourseLogic().getEcmDurationStringDate(widget.model.ecmStartDate, widget.model.ecmEndDate);
    }
    if (widget.model.isToj() && widget.model.meetingDetails != null) {
      return CourseLogic().getTojDurationStringDate(widget.model.meetingDetails?.startDate, widget.model.meetingDetails?.endDate);
    }
    return CourseLogic().getExpirationStringDate(widget.model.expirationDate);
  }

  bool get showStatus => (widget.model.iconStatus != IconStatus.idle || widget.model.status == "E");

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        height = (_childKey.currentContext?.findRenderObject() as RenderBox?)?.size.height;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height,
        child: Stack(
          fit: height != null ? StackFit.expand : StackFit.loose,
          children: [
            if(height != null) _background,
            _overlay,
            _foreground()
          ],
        ),
      ),
    );
  }

  Widget get _overlay {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ColorManager().getColorGradient05Start(),
            ColorManager().getColorBackgroundPrimaryLighter(),
          ],
        ),
      ),
    );
  }

  Widget _foreground() {
    return Column(
      key: _childKey,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        /// Status tag
        Padding(
          padding: EdgeInsets.only(top: 120.0 + kToolbarHeight + MediaQuery.of(context).viewInsets.top),
          child: _getStatusTag,
        ),
        /// Type - Typology - Title
        Padding(
          padding: EdgeInsets.fromLTRB(
            Dimens.spacingL,
            showStatus ? Dimens.spacingXXL : 0.0,
            Dimens.spacingL,
            Dimens.spacingXXXS,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    /// Type Label
                    TextSpan(
                      text: (widget.model.ecmSpecialization ? widget.model.ecmType ?? '' : widget.model.learningObjectType.getTranslatedValue()).toUpperCase(),
                      style: AppTextTheme.body(
                        color: ColorManager().getColorTextMandatory(),
                        weight: FontWeight.bold,
                      ),
                    ),
                    if(!widget.model.ecmSpecialization) ...[
                      TextSpan(
                        text: ' | ',
                        style: AppTextTheme.body(
                          color: ColorManager().getColorTextPrimary(),
                          weight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: widget.model.learningObjectTypology.getTranslatedValue().toUpperCase(),
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
              /// Title
              if(widget.model.title != null) ...[
                const SizedBox(height: Dimens.spacingXXS),
                Text(
                  widget.model.title!,
                  style: AppTextTheme.title(
                    color: ColorManager().getColorTextPrimary(),
                    weight: FontWeight.bold,
                  ),
                ),
              ],
            ],
          ),
        ),
        /// Topics
        if(widget.model.topicTags != null && widget.model.topicTags!.isNotEmpty) ...[
          const SizedBox(height: Dimens.spacingXXS),
          SizedBox(
            height: 22.0,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.spacingL),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => TopicTag(
                label: widget.model.topicTags![index],
                boxFit: BoxFit.fitWidth,
                color: ColorManager().getColorSystemSecondary05().withOpacity(.6),
              ),
              separatorBuilder: (context, index) => const SizedBox(width: Dimens.spacingXXS),
              itemCount:  widget.model.topicTags!.length,
            ),
          ),
        ],
        /// Duration info
        if(_durationString.isNotEmpty) Padding(
          padding: const EdgeInsets.only(
            left: Dimens.spacingL,
            right: Dimens.spacingL,
            top: Dimens.spacingS,
          ),
          child: Row(
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
              Expanded(
                child: Text(
                  _durationString,
                  style: AppTextTheme.caption(color: ColorManager().getColorTextPrimary(),
                  ),
                ),
              ),
            ],
          ),
        ),
        /// Expiration info
        if(_dateString.isNotEmpty) Padding(
          padding: const EdgeInsets.only(
            left: Dimens.spacingL,
            right: Dimens.spacingL,
            top: Dimens.spacingXXS,
          ),
          child: Row(
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
              Expanded(
                child: Text(
                  _dateString,
                  style: AppTextTheme.caption(
                    color: ColorManager().getColorTextPrimary(),
                  ),
                ),
              ),
            ],
          ),
        ),
        if(widget.model.isToj() && widget.model.meetingDetails?.meetingNumber != null) Padding(
          padding: const EdgeInsets.only(
            left: Dimens.spacingL,
            right: Dimens.spacingL,
            top: Dimens.spacingXXS,
          ),
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
                  CourseLogic().getMeetingString(widget.model.meetingDetails?.meetingNumber),
                  style: AppTextTheme.caption(
                    color: ColorManager().getColorTextPrimary(),
                  ),
                ),
              ),
            ],
          ),
        ),/// Progress bar and info
        if(CourseLogic().getCompletionPercentageFromString(widget.model.percentageOfCompletion) > 0)
          Padding(
            padding: const EdgeInsets.only(
              left: Dimens.spacingL,
              right: Dimens.spacingL,
              top: Dimens.spacingS,
            ),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.percentageOfCompletion),
                        style: AppTextTheme.body(color: ColorManager().getColorTextPrimary()),
                      ),
                      TextSpan(
                        text: ' ${double.parse(widget.model.percentageOfCompletion!.replaceAll("%", "")).toStringAsFixed(0)}%',
                        style: AppTextTheme.body(color: ColorManager().getColorTextPrimary(), weight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: Dimens.spacingXS),
                GlowProgressBar(
                  percentage: CourseLogic().getCompletionPercentageFromString(widget.model.percentageOfCompletion),
                  withFactor: .8,
                ),
              ],
            ),
          ),
        /// Buttons
        Padding(
          padding: const EdgeInsets.only(
            left: Dimens.spacingL,
            right: Dimens.spacingL,
            top: Dimens.spacingM,
          ),
          child:
          Row(
            children: [
              /// Download Button
              BlocProvider(
                  create: (_) => getIt<DownloadItemCubit>()..init(widget.model),
                  child: Row(children: [
                    DownloadButton(detailPageModel: widget.model, parentId: widget.args.parentId ?? '', buildContext: context, args: widget.args,),
                  ],)
              ),
              /// Button
              ElevatedButton(
                onPressed: !_loCharacterization.buttonEnabled ? null :  () async {
                  int idToAE = widget.model.id!;
                  if(widget.args.grandParentId != null) {
                    idToAE = int.parse(widget.args.grandParentId!);
                  } else if(widget.args.parentId != null) {
                    idToAE = int.parse(widget.args.parentId!);
                  }
                  switch(_loCharacterization.objLOAction) {
                    case ObjLOAction.none:
                    case ObjLOAction.notApplicable:
                      break;
                    case ObjLOAction.startFruition:
                      String parentId = (widget.args.parentId == null || widget.args.parentId!.toLowerCase() == "null") ? widget.model.id!.toString(): widget.args.parentId!;
                      context.read<DetailPageCubit>().getStartOrResumeModel(widget.model.id!, parentId, widget.model);
                      break;
                    case ObjLOAction.autoEnrollmentBottom:
                      context.read<DetailPageCubit>().executeAutoEnrollment(widget.args, idToAE, "BOTTOM", widget.model, false);
                      break;
                    case ObjLOAction.autoEnrollmentAuto:
                      context.read<DetailPageCubit>().executeAutoEnrollment(widget.args, idToAE, "AUTO", widget.model, true);
                      break;
                    case ObjLOAction.autoEnrollmentWithPatch:
                    case ObjLOAction.seeEditions:
                      context.read<DetailPageCubit>().selectEditionsIfPresentIndex(widget.args, widget.model);
                      break;
                    case ObjLOAction.ecmNotRegistered:
                      final res = await context.pushNamed<bool?>(
                        EcmRegistrationPage.routeName,
                        extra: EcmRegistrationPageArgs(
                          enrollId: widget.model.enrollId,
                          loId: widget.model.id,
                          sponsors: widget.model.sponsors ?? [],
                        ),
                      );
                      if(res != null && res && context.mounted) {
                        context.read<DetailPageCubit>().init(widget.args);
                      }
                      break;
                    case ObjLOAction.showDetailMaterials:
                    case ObjLOAction.showDetailGoals:
                    case ObjLOAction.showDetailFinalBalance:
                      String parentId = (widget.args.parentId == null || widget.args.parentId!.toLowerCase() == "null") ? widget.model.id!.toString(): widget.args.parentId!;
                      context.read<DetailPageCubit>().getStartOrResumeModel(widget.model.id!, parentId, widget.model);
                      break;
                    case ObjLOAction.showDetailMeeting:
                      OlAlertDialog.show(
                        context,
                        title: LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.show_info),
                        message: LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.from_meeting_info),
                        actionLabel: LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.ok),
                      );
                      break;
                  }
                },
                child: Text(
                    CourseLogic().loCharacterizationNew(
                      status: widget.model.status ?? "",
                      learningObjectType: widget.model.learningObjectType,
                      learningObjectTypology: widget.model.learningObjectTypology,
                      percentageOfCompletion: widget.model.percentageOfCompletion ?? "0",
                      enrollType: widget.model.enrollType ?? EnrollType.autoEnroll,
                      ecmSpecialization: widget.model.ecmSpecialization,
                      ecmRegistration: widget.model.ecmRegistration,
                    ).buttonTitle
                ),
              ),
              const SizedBox(width: Dimens.spacingS),
              /// Button
              BadgeIcon(hasBadge: (widget.model.badge != null || widget.model.certificate != null), isCompleted: widget.model.status == "C"),
            ],
          ),
        ),
        /// Short description
        if(widget.model.shortDescription != null) Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.spacingL,
            vertical: Dimens.spacingS,
          ),
          child: Text(
            widget.model.shortDescription!,
            style: AppTextTheme.body(color: ColorManager().getColorTextPrimary(),
            ),
          ),
        )
      ],
    );
  }

  Widget get _background {
    const placeholder = SizedBox.shrink();
    if (widget.model.coverVideoPublicURL?.isNotEmpty == true) {
      return VideoPlayerTrailerWidget(
        widget.model.coverVideoPublicURL!,
        key: ValueKey(widget.model.id),
      );
    } else if (widget.model.coverPublicURL != null &&
        widget.model.coverPublicURL!.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: widget.model.coverPublicURL!,
        fit: BoxFit.cover,
        placeholder: (context, url) => const Center(
          child: SizedBox.square(
            dimension: 24.0,
            child: CircularProgressIndicator(),
          ),
        ),
        errorWidget: (context, url, error) => placeholder,
      );
    } else {
      return placeholder;
    }
  }

  Widget get _getStatusTag {
    if (widget.model.status == "E" &&
      (widget.model.learningObjectTypology == LearningObjectTypology.physicalClass || widget.model.learningObjectTypology == LearningObjectTypology.virtualClass)) {
      return StatusTag(
        backgroundColor: ColorManager().getColorBorderAccent(),
        height: 40,
        width: 100,
        child: Text(
          LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.registered),
          style: AppTextTheme.body(
            color: ColorManager().getColorTextPrimaryAlternative(),
            weight: FontWeight.w500,
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