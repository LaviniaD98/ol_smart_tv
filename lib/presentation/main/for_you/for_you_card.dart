import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:open_learning_smart_tv/app_manager.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/core/dependency_injection/dependency_injection.dart';
import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/core/utils/nav.dart';
import 'package:open_learning_smart_tv/core/utils/utility.dart';
import 'package:open_learning_smart_tv/domain/entities/detail/detail_page_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/cards/topic_list.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_button.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/icon_text.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/common/course_logic.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/cubit/detail_page_cubit.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/widgets/image/faded_banner_image.dart';
import 'package:open_learning_smart_tv/presentation/main/main_state_cubit.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../theme/app_theme.dart';

class ForYouCard extends StatefulWidget {
  final LearningObjectModel data;
  final DetailPageModel? parentDetailPageModel;
  final String? parentId;
  final String? grandParentId;
  final bool enable;
  final bool isGridViewItem;
  final bool isFirst;
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
    this.isFirst = false,
    this.returnFromDetailCallback,
    this.onFocusChange,
  });

  @override
  State<ForYouCard> createState() => _ForYouCardState();
}

class _ForYouCardState extends State<ForYouCard> {
  late OlFocusScopeNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = OlFocusScopeNode(id: 'FOR-YOU-CARD-${widget.data.id}');

    if (widget.isFirst) {
      context.read<MainStateCubit>().firstForYouCardFocus = focusNode;
    }
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

    // print('widget.courseId: ${widget.data.title}');
    // print('widget.parentId: ${widget.data.parentId}');
    // print('widget.grandParentId: ${widget.data.grandParentId}');

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
                  Nav.push(
                    context,
                    screen: DetailPage(
                      args: DetailPageArgs(
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
                        source: DetailsPresentingSource.forYou,
                      ),
                    ),
                  );

                  if (context.mounted &&
                      widget.returnFromDetailCallback != null) {
                    widget.returnFromDetailCallback?.call();
                  }
                }
              : null,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: 0,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 70),
                  child: FadedBannerImage(
                    urlImage: widget.data.coverPublicURL,
                  ),
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
                      (widget.data.title ?? 'No title'),
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
                            .withValues(alpha: .6),
                      ),
                    ],
                    const SizedBox(height: 20),
                    // descrizione
                    Container(
                      constraints: const BoxConstraints(minHeight: 100),
                      child: Text(
                        widget.data.shortDescription ?? '',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: ColorManager().getColorTextPrimary(),
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    buildDurationTag(),
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        FocusTraversalOrder(
                          order: const NumericFocusOrder(0),
                          child: OLButton(
                            id: 'START-BUTTON-0',
                            title: c.buttonTitle,
                            onPressed: c.buttonEnabled
                                ? () => pushDetails(item: widget.data)
                                : null,
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
    );
  }

  void pushDetails({required LearningObjectModel item}) async {
    final args = DetailPageArgs(
      id: item.id.toString(),
      object: item,
      parentId: item.parentId?.toString(),
      grandParentId: item.grandParentId?.toString(),
      typology: item.learningObjectTypology,
      source: DetailsPresentingSource.forYou,
    );

    manager.pushOnStack(
      screen: BlocProvider(
        create: (_) => getIt<DetailPageCubit>()..init(args),
        child: DetailPage(args: args),
      ),
    );
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
        if (widget.data.expirationDate != null &&
            widget.data.expirationDate?.year != 9999) ...[
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
                  widget.data.iconStatus.getLocalizedLabel(),
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
                text: widget.data.learningObjectType
                    .getTranslatedValue()
                    .toUpperCase(),
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
                text: widget.data.learningObjectTypology
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
        padding: const EdgeInsets.only(
          left: Dimens.hViewPadding,
          right: Dimens.hViewPadding,
          bottom: 60,
          top: 80,
        ),
        child: Shimmer.fromColors(
          enabled: true,
          baseColor: AppColors.white.withValues(alpha: .09),
          highlightColor: AppColors.primaryFaded,
          period: const Duration(seconds: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 40,
                  width: 160,
                  decoration: BoxDecoration(
                    color: ColorManager()
                        .getColorSystemSecondary05()
                        .withValues(alpha: .6),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  color: ColorManager()
                      .getColorSystemSecondary05()
                      .withValues(alpha: .6),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'Aknlcknlvdfvòòòlmvdfmpovvdf',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextTheme.body(
                    color: Colors.transparent,
                    weight: FontWeight.bold,
                    size: 56,
                  ).copyWith(height: 1),
                ),
              ),

              const SizedBox(height: 28),
              TopicList(
                const ['Testingcdcfd', 'Testing csdc ce'],
                textColor: Colors.transparent,
                color: ColorManager()
                    .getColorSystemSecondary05()
                    .withValues(alpha: .6),
              ),

              const SizedBox(height: 20),
              // descrizione

              Container(
                height: 20,
                decoration: BoxDecoration(
                  color: ColorManager()
                      .getColorSystemSecondary05()
                      .withValues(alpha: .6),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 20,
                decoration: BoxDecoration(
                  color: ColorManager()
                      .getColorSystemSecondary05()
                      .withValues(alpha: .6),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 20,
                  width: 200,
                  decoration: BoxDecoration(
                    color: ColorManager()
                        .getColorSystemSecondary05()
                        .withValues(alpha: .6),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),

              const SizedBox(height: 2),
              const Spacer(),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 20,
                  width: 200,
                  decoration: BoxDecoration(
                    color: ColorManager()
                        .getColorSystemSecondary05()
                        .withValues(alpha: .6),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const Row(
                children: [
                  ExcludeFocus(
                    excluding: true,
                    child: FocusTraversalOrder(
                      order: NumericFocusOrder(0),
                      child: OLButton(
                        id: 'START-BUTTON-0',
                        title: 'Button',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
