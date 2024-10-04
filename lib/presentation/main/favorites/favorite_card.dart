import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_learning_smart_tv/app_manager.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/core/dependency_injection/dependency_injection.dart';
import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/core/utils/utility.dart';
import 'package:open_learning_smart_tv/domain/entities/detail/detail_page_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_button.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_image.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/glow_progress_bar/glow_progress_bar.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/icon_text.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/tag/status_tag.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/common/course_logic.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/cubit/detail_page_cubit.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/detail_page.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/favorites/cubit/favourite_cubit.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/favorites/favourite_button_page.dart';
import 'package:open_learning_smart_tv/presentation/main/main_state_cubit.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import '../../../../theme/app_theme.dart';

class FavoriteCard extends StatefulWidget {
  final LearningObjectModel data;
  final DetailPageModel? parentDetailPageModel;
  final int index;
  final String? parentId;
  final String? grandParentId;
  final void Function(bool)? onFocusChange;

  const FavoriteCard({
    super.key,
    required this.data,
    required this.index,
    this.parentDetailPageModel,
    this.parentId,
    this.grandParentId,
    this.onFocusChange,
  });

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  late OlFocusScopeNode buttonsFocusNode;

  @override
  void initState() {
    super.initState();

    buttonsFocusNode =
        OlFocusScopeNode(id: 'FAVORITE BUTTONS FOCUS ${widget.index}:1');
  }

  @override
  Widget build(BuildContext context) {
    const double vPadding = 16;
    final c = CourseLogic().loCharacterizationNew(
      status: widget.data.status ?? "",
      learningObjectType: widget.data.learningObjectType,
      learningObjectTypology: widget.data.learningObjectTypology,
      percentageOfCompletion: widget.data.percentageOfCompletion ?? "0",
      enrollType: widget.data.enrollType ?? EnrollType.autoEnroll,
      ecmSpecialization: widget.data.ecmSpecialization ?? false,
      ecmRegistration: widget.data.ecmRegistration ?? false,
    );

    return Column(
      children: [
        Container(
          height: 320,
          padding: const EdgeInsets.only(top: 25, bottom: 25),
          child: Row(
            children: [
              SizedBox(
                width: 90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      (widget.index + 1).toString(),
                      textAlign: TextAlign.center,
                      style:
                          AppTextTheme.body(weight: FontWeight.bold, size: 32),
                    ),
                  ],
                ),
              ),
              buildVerticalImage(),
              const SizedBox(width: 32),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  /// Type Label
                                  TextSpan(
                                    text: 'Digitale'.toUpperCase(),
                                    style: AppTextTheme.body(
                                      color: ColorManager()
                                          .getColorTextMandatory(),
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' | ',
                                    style: AppTextTheme.body(
                                      color:
                                          ColorManager().getColorTextPrimary(),
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: widget.data.learningObjectType.name
                                        .toUpperCase(),
                                    style: AppTextTheme.body(
                                      color:
                                          ColorManager().getColorTextPrimary(),
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              maxLines: 1,
                            ),
                          ),
                          buildDurationTag(),
                        ],
                      ),
                      Text(
                        widget.data.title?.toUpperCase() ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextTheme.body(
                          color: ColorManager().getColorTextPrimary(),
                          weight: FontWeight.bold,
                          size: 32,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // descrizione
                      Text(
                        widget.data.shortDescription ?? '',
                        style: TextStyle(
                          color: ColorManager().getColorTextPrimary(),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: vPadding),
                      const Spacer(),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: CallbackShortcuts(
                              bindings: <ShortcutActivator, VoidCallback>{
                                const SingleActivator(
                                    LogicalKeyboardKey.arrowLeft): () {
                                  final res = buttonsFocusNode.focusInDirection(
                                      TraversalDirection.left);
                                  if (res == false) {
                                    context
                                        .read<MainStateCubit>()
                                        .state
                                        .requestFocus();
                                  }
                                },
                              },
                              child: FocusScope(
                                node: buttonsFocusNode,
                                onFocusChange: (v) {
                                  widget.onFocusChange?.call(v);

                                  if (v) {
                                    if (buttonsFocusNode.focusedChild == null) {
                                      Future.delayed(
                                          const Duration(milliseconds: 100),
                                          () {
                                        buttonsFocusNode.children.firstOrNull
                                            ?.requestFocus();
                                      });
                                    }
                                  }
                                },
                                child: Row(
                                  children: [
                                    FocusTraversalOrder(
                                      order: const NumericFocusOrder(0),
                                      child: OLButton(
                                        id: 'START-BUTTON-0',
                                        title: c.buttonTitle,
                                        onPressed: c.buttonEnabled
                                            ? () =>
                                                pushDetails(item: widget.data)
                                            : null,
                                      ),
                                    ),
                                    const SizedBox(width: 32),
                                    BlocProvider(
                                      create: (_) => getIt<FavouriteCubit>()
                                        ..init(widget.data),
                                      child: FavoriteButton(
                                        object: widget.data,
                                        parentId: widget.parentId,
                                        grandParentId: widget.grandParentId,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 357,
                            child: Builder(
                              builder: (context) {
                                double glowPercentage = double.tryParse(
                                        (widget.data.percentageOfCompletion ??
                                                "0.0")
                                            .replaceAll("%", "")) ??
                                    0.0;

                                return Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                '${LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.percentageOfCompletion)}:',
                                            style: AppTextTheme.body(
                                              weight: FontWeight.w500,
                                              size: 14,
                                              color: ColorManager()
                                                  .getColorTextPrimary(),
                                            ),
                                          ),
                                          TextSpan(
                                            text: ' $glowPercentage%',
                                            style: AppTextTheme.body(
                                              color: ColorManager()
                                                  .getColorTextPrimary(),
                                              weight: FontWeight.bold,
                                              size: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    GlowProgressBar(percentage: glowPercentage),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: ColorManager().getColorBorder(),
        ),
      ],
    );
  }

  void pushDetails({required LearningObjectModel item}) async {
    final args = DetailPageArgs(
      id: item.id.toString(),
      object: item,
      parentId: item.parentId?.toString(),
      grandParentId: item.grandParentId?.toString(),
      typology: item.learningObjectTypology,
    );

    manager.pushOnStack(
      screen: BlocProvider(
        create: (_) => getIt<DetailPageCubit>()..init(args),
        child: DetailPage(args: args),
      ),
    );
  }

  Widget buildVerticalImage() {
    return SizedBox(
      width: 162,
      height: 330,
      child: Stack(
        children: [
          OLImage(
            imageURL: widget.data.coverPublicURL,
            cacheHeight: 350,
          ),
          Positioned(
            top: 8,
            left: 10,
            child: StatusTag.svg(
              backgroundColor: ColorManager().getColorSystemSecondary02(),
              svgPath: IconStatus.completed.svgPath ?? '',
            ),
          ),
        ],
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
    if (widget.data.duration == null) {
      return const SizedBox.shrink();
    }

    return IconText(
      bkColor: ColorManager().getColorTextPrimary(),
      text: convertMinutesToHours(widget.data.duration ?? 0),
      textColor: ColorManager().getColorTextPrimary(),
      icon: Icons.watch_later_outlined,
      iconSize: 24,
    );
  }

  Widget get _backgroundImage {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: OLColors.backgroundCard,
        borderRadius: BorderRadius.circular(12),
      ),
      child: widget.data.coverPublicURL != null &&
              widget.data.coverPublicURL!.isNotEmpty
          ? CachedNetworkImage(
              imageUrl: widget.data.coverPublicURL!,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(.05),
                ),
              ),
            )
          : DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(.05),
              ),
            ),
    );
  }

  Border? get _borderForeground {
    double width = 1.0;
    switch (widget.data.iconStatus) {
      case IconStatus.mandatory:
        return Border.all(
          width: width,
          color: ColorManager().getColorBorderAccent(),
        );
      case IconStatus.completed:
        return Border.all(
          width: width,
          color: ColorManager().getColorBorderSecondaryComplete(),
        );
      case IconStatus.expired:
        return Border.all(
          width: width,
          color: ColorManager().getColorBorderWarning(),
        );
      case IconStatus.suggestedAI:
      case IconStatus.suggestedHR:
        return Border.all(
          width: width,
          color: ColorManager().getColorBorderSecondaryComplete(),
        );
      case IconStatus.idle:
      default:
        return null;
    }
  }

  Widget iconByCardStatus() {
    return StatusTag.svg(
      backgroundColor: widget.data.iconStatus.color,
      svgPath: widget.data.iconStatus.svgPath!,
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
