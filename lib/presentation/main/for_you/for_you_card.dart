import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/core/utils/utility.dart';
import 'package:open_learning_smart_tv/domain/entities/detail/detail_page_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/cards/topic_list.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_button.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/ol_alert_dialog.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/icon_text.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/common/course_logic.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/common/lo_types.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/cubit/detail_page_cubit.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/ecm/registration/ecm_registration_page.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/widgets/image/faded_banner_image.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';

import '../../../../theme/app_theme.dart';

class ForYouCard extends StatefulWidget {
  final LearningObjectModel data;
  final DetailPageModel? parentDetailPageModel;
  final String? parentId;
  final String? grandParentId;
  final bool enable;
  final bool isGridViewItem;
  final VoidCallback? returnFromDetailCallback;
  final void Function(bool)? onFocusChange;

  const ForYouCard({
    super.key,
    required this.data,
    this.parentDetailPageModel,
    this.parentId,
    this.grandParentId,
    this.enable = true,
    this.isGridViewItem = false,
    this.returnFromDetailCallback,
    this.onFocusChange,
  });

  @override
  State<ForYouCard> createState() => _ForYouCardState();
}

class _ForYouCardState extends State<ForYouCard> {
  late FocusScopeNode focusNode;

  @override
  void initState() {
    super.initState();

    focusNode = FocusScopeNode(debugLabel: '${widget.grandParentId} ----- 1');
  }

  @override
  Widget build(BuildContext context) {
    final c = CourseLogic().loCharacterizationNew(
      status: widget.data.status ?? "",
      learningObjectType: widget.data.learningObjectType,
      learningObjectTypology: widget.data.learningObjectTypology,
      percentageOfCompletion: widget.data.percentageOfCompletion ?? "0",
      enrollType: widget.data.enrollType ?? EnrollType.autoEnroll,
      ecmSpecialization: widget.data.ecmSpecialization ?? false,
      ecmRegistration: widget.data.ecmRegistration ?? false,
    );

    print('widget.courseId: ${widget.data.courseId}');
    print('widget.parentId: ${widget.data.parentId}');
    print('widget.grandParentId: ${widget.data.grandParentId}');
    return FocusScope(
      node: focusNode,
      onFocusChange: (value) {
        widget.onFocusChange?.call(value);
        setState(() {});
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: widget.enable
              ? () async {
                  await context.pushNamed(DetailPage.routeName,
                      extra: DetailPageArgs(
                        object: widget.data,
                        id: widget.data.id.toString(),
                        typology: widget.data.learningObjectTypology,
                        parentId: widget.parentId?.isNotEmpty == true
                            ? widget.parentId
                            : widget.data.parentId?.toString(),
                        grandParentId: widget.grandParentId?.isNotEmpty == true
                            ? widget.grandParentId
                            : widget.data.grandParentId?.toString(),
                        parent: widget.parentDetailPageModel,
                      ));
                  if (context.mounted &&
                      widget.returnFromDetailCallback != null) {
                    widget.returnFromDetailCallback?.call();
                  }
                }
              : null,
          child: AspectRatio(
            aspectRatio: Dimens.learningCardRatio,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 140),
                  child: FadedBannerImage(
                    urlImage: widget.data.coverPublicURL,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: Dimens.hViewPadding,
                    right: Dimens.hViewPadding,
                    bottom: 60,
                    top: 80,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      iconByCardStatus(),
                      const SizedBox(height: 6),
                      Text(
                        (widget.data.title ?? 'No title').toUpperCase(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextTheme.body(
                          color: ColorManager().getColorTextPrimary(),
                          weight: FontWeight.bold,
                          size: 56,
                        ),
                      ),
                      if ((widget.data.topicTags ?? []).isNotEmpty) ...[
                        const SizedBox(height: 28),
                        TopicList(
                          widget.data.topicTags ?? [],
                          color: ColorManager()
                              .getColorSystemSecondary05()
                              .withOpacity(.6),
                        ),
                      ],
                      const SizedBox(height: 20),
                      // descrizione
                      Text(
                        'This is considered an error condition because it indicates that there is content that cannot be seen. If the content is legitimately bigger than the available space, consider clipping it with a ClipRect widget before putting it in the flex, or using a scrollable container rather than a Flex, like a ListView.The specific RenderFlex in question is: RenderFlex#70f97 OVERFLOWING', //widget.data.shortDescription ?? '',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: ColorManager().getColorTextPrimary(),
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 32),
                      const Spacer(),
                      buildDurationTag(),
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          FocusTraversalOrder(
                            order: const NumericFocusOrder(0),
                            child: OLButton(
                              debugLabel: 'START-BUTTON-0',
                              title: c.buttonTitle,
                              onPressed: c.buttonEnabled ? openCourse : null,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> openCourse() async {
    // TODO(UmbertoGrimaldi): Complete this logic
    // int idToAE = widget.model.id!;
    // if (widget.args.grandParentId != null) {
    //   idToAE = int.parse(widget.args.grandParentId!);
    // } else if (widget.args.parentId != null) {
    //   idToAE = int.parse(widget.args.parentId!);
    // }
    // switch (c.objLOAction) {
    //   case ObjLOAction.none:
    //   case ObjLOAction.notApplicable:
    //     break;
    //   case ObjLOAction.startFruition:
    //     String parentId = (widget.args.parentId == null ||
    //             widget.args.parentId!.toLowerCase() == "null")
    //         ? widget.model.id!.toString()
    //         : widget.args.parentId!;
    //     context
    //         .read<DetailPageCubit>()
    //         .getStartOrResumeModel(widget.model.id!, parentId, widget.model);
    //     break;
    //   case ObjLOAction.autoEnrollmentBottom:
    //     context.read<DetailPageCubit>().executeAutoEnrollment(
    //         widget.args, idToAE, "BOTTOM", widget.model, false);
    //     break;
    //   case ObjLOAction.autoEnrollmentAuto:
    //     context.read<DetailPageCubit>().executeAutoEnrollment(
    //         widget.args, idToAE, "AUTO", widget.model, true);
    //     break;
    //   case ObjLOAction.autoEnrollmentWithPatch:
    //   case ObjLOAction.seeEditions:
    //     context
    //         .read<DetailPageCubit>()
    //         .selectEditionsIfPresentIndex(widget.args, widget.model);
    //     break;
    //   case ObjLOAction.ecmNotRegistered:
    //     final res = await context.pushNamed<bool?>(
    //       EcmRegistrationPage.routeName,
    //       extra: EcmRegistrationPageArgs(
    //         enrollId: widget.model.enrollId,
    //         loId: widget.model.id,
    //         sponsors: widget.model.sponsors ?? [],
    //       ),
    //     );
    //     if (res != null && res && context.mounted) {
    //       context.read<DetailPageCubit>().init(widget.args);
    //     }
    //     break;
    //   case ObjLOAction.showDetailMaterials:
    //   case ObjLOAction.showDetailGoals:
    //   case ObjLOAction.showDetailFinalBalance:
    //     String parentId = (widget.args.parentId == null ||
    //             widget.args.parentId!.toLowerCase() == "null")
    //         ? widget.model.id!.toString()
    //         : widget.args.parentId!;
    //     context
    //         .read<DetailPageCubit>()
    //         .getStartOrResumeModel(widget.model.id!, parentId, widget.model);
    //     break;
    //   case ObjLOAction.showDetailMeeting:
    //     OlAlertDialog.show(
    //       context,
    //       title: LabelsManager()
    //           .getRemoteStringFromLabelKeys(RemoteLabelKeys.show_info),
    //       message: LabelsManager()
    //           .getRemoteStringFromLabelKeys(RemoteLabelKeys.from_meeting_info),
    //       actionLabel:
    //           LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.ok),
    //     );
    //     break;
    // }
  }

  Color getBorderFocusColor() {
    if (widget.data.iconStatus != IconStatus.idle) {
      return widget.data.iconStatus.color;
    }

    return OLColors.textPrimary;
  }

  Widget buildDurationTag() {
    return Row(
      children: [
        if (widget.data.duration != null) ...[
          IconText(
            bkColor: ColorManager().getColorTextPrimary(),
            text: convertMinutesToHours(widget.data.duration ?? 0),
            textColor: ColorManager().getColorTextPrimary(),
            image: 'assets/icons/clock.svg',
            iconSize: 24,
          ),
          const SizedBox(width: 24),
        ],
        if (widget.data.expirationDate != null) ...[
          IconText(
            bkColor: ColorManager().getColorTextPrimary(),
            text: DateFormat('dd/MM/yyyy').format(widget.data.expirationDate!),
            textColor: ColorManager().getColorTextPrimary(),
            image: 'assets/icons/calendar.svg',
            iconSize: 24,
          ),
          const SizedBox(width: 24),
        ],
      ],
    );
  }

  Widget iconByCardStatus() {
    if (widget.data.iconStatus == IconStatus.idle) {
      return const SizedBox.shrink();
    }
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
          decoration: BoxDecoration(
            color: widget.data.iconStatus.color,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(4),
              bottomRight: Radius.circular(4),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                SvgPicture.asset(
                  widget.data.iconStatus.svgPath!,
                  height: 18,
                  width: 18,
                  colorFilter: ColorFilter.mode(
                    ColorManager().getColorBackgroundPrimary(),
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  widget.data.iconStatus.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextTheme.caption(
                    weight: FontWeight.w500,
                    color: ColorManager().getColorBackgroundPrimary(),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        RichText(
          text: TextSpan(
            children: [
              /// Type Label
              TextSpan(
                text: 'Digitale'.toUpperCase(),
                style: AppTextTheme.body(
                  color: ColorManager().getColorTextMandatory(),
                  weight: FontWeight.bold,
                  size: 20,
                ),
              ),
              TextSpan(
                text: ' | ',
                style: AppTextTheme.body(
                  color: ColorManager().getColorTextPrimary(),
                  weight: FontWeight.bold,
                  size: 20,
                ),
              ),
              TextSpan(
                text: widget.data.learningObjectType
                    .getTranslatedValue()
                    .toUpperCase(),
                style: AppTextTheme.body(
                  color: ColorManager().getColorTextPrimary(),
                  weight: FontWeight.bold,
                  size: 20,
                ),
              ),
            ],
          ),
          maxLines: 1,
        ),
      ],
    );
  }
}

class LearningCardShimmer extends StatelessWidget {
  const LearningCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: Dimens.learningCardRatio,
      child: Container(
        clipBehavior: Clip.none,
        margin: const EdgeInsets.only(bottom: 10, right: 24, left: 5),
        padding: const EdgeInsets.fromLTRB(24.0, 8.0, 16.0, 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white.withOpacity(.2),
          border: Border.all(
            color: OLColors.border,
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: (MediaQuery.of(context).size.width /
                        Dimens.learningCardRatio) *
                    .4,
                height: 28,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.5),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const Spacer(),
            Container(
              width: (MediaQuery.of(context).size.width /
                      Dimens.learningCardRatio) *
                  .5,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.5),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 4),
              width: (MediaQuery.of(context).size.width /
                      Dimens.learningCardRatio) *
                  .6,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.5),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
