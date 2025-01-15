import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_learning_smart_tv/core/utils/utility.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_button.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_image.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/tag/status_tag.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/cubit/detail_page_cubit.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/widgets/badge_icon.dart';
import 'package:flutter/material.dart';
import '../../../color_management/color_manager.dart';
import '../../../remote_theming/labels/labels_manager.dart';
import '../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../theme/app_theme.dart';
import 'glow_progress_bar/glow_progress_bar.dart';
import 'icon_text.dart';

enum ButtonFocusedType {
  resume,
  learningActivities,
}

class CardModulo extends StatefulWidget {
  final int index;
  final String tipoText;
  final double progressPercentage;
  final String titolo;
  final String descrizione;
  final String imageUrl;
  final String buttonTitle;
  final Function(int) onButtonPressed;
  final Function(int) onDownloadPressed;
  final int? durataMinuti;
  final int? numAttivita;
  final int? numRisorse;
  final bool isEnabled;
  final bool hasBadge;
  final bool isCompleted;
  final bool showDivider;
  final String? status;
  final void Function(bool)? onFocusChange;
  final FocusScopeNode? parentFocus;
  final LearningObjectTypology type;
  final void Function(ButtonFocusedType?)? onModuleButtonFocused;
  final bool isSubActivities;

  const CardModulo({
    super.key,
    required this.index,
    required this.tipoText,
    required this.progressPercentage,
    required this.titolo,
    required this.descrizione,
    required this.imageUrl,
    required this.buttonTitle,
    required this.onButtonPressed,
    required this.onDownloadPressed,
    this.durataMinuti,
    this.numAttivita,
    this.numRisorse,
    this.isEnabled = true,
    this.hasBadge = false,
    this.isCompleted = false,
    this.showDivider = true,
    this.status = "",
    this.onFocusChange,
    this.parentFocus,
    this.type = LearningObjectTypology.path,
    this.onModuleButtonFocused,
    this.isSubActivities = false,
  });

  @override
  State<CardModulo> createState() => _CardModuloState();
}

class _CardModuloState extends State<CardModulo>
    with AutomaticKeepAliveClientMixin {
  late OlFocusScopeNode _focusNode;
  final OrderedTraversalPolicy _policy = OrderedTraversalPolicy();

  bool isActivityButtonLastFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = OlFocusScopeNode(
      id: 'CardModulo - ${widget.index} - ${widget.type}',
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    const double vPadding = 16;

    return Column(
      children: [
        Container(
          height: (widget.type == LearningObjectTypology.path ||
                  widget.type == LearningObjectTypology.course)
              ? 380
              : null,
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
              if (widget.type == LearningObjectTypology.path ||
                  widget.type == LearningObjectTypology.course) ...[
                buildVerticalImage(),
                const SizedBox(width: 32),
              ],
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
                                    text: widget.tipoText.toUpperCase(),
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
                                    text: widget.type
                                        .getTranslatedValue()
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

                      // Immagine e testi risorse e attività
                      /* Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      widget.numAttivita != null &&
                                              widget.numAttivita != 0
                                          ? IconText(
                                              bkColor: ColorManager()
                                                  .getColorTextPrimary(),
                                              text: LabelsManager()
                                                  .getRemoteStringFromLabelKeys(
                                                      RemoteLabelKeys.activity_other)
                                                  .replaceFirst('{{count}}',
                                                      widget.numAttivita.toString()),
                                              textColor: ColorManager()
                                                  .getColorTextPrimary(),
                                              icon: Icons.account_tree_outlined,
                                              iconSize: 16,
                                            )
                                          : const SizedBox.shrink(),
                                      const SizedBox(height: vPadding),
                                      widget.numRisorse != null &&
                                              widget.numRisorse != 0
                                          ? IconText(
                                              bkColor: ColorManager()
                                                  .getColorTextPrimary(),
                                              text: LabelsManager()
                                                  .getRemoteStringFromLabelKeys(
                                                      RemoteLabelKeys.resource_other)
                                                  .replaceFirst(
                                                    '{{count}}',
                                                    widget.numRisorse.toString(),
                                                  ),
                                              textColor: ColorManager()
                                                  .getColorTextPrimary(),
                                              icon: Icons.folder_copy_outlined,
                                              iconSize: 16,
                                            )
                                          : const SizedBox.shrink(),
                                    ],
                                  ),
                                ),
                              ],
                            ),*/
                      //const SizedBox(height: 45),

                      Text(
                        widget.titolo.toUpperCase(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextTheme.body(
                          color: ColorManager().getColorTextPrimary(),
                          weight: FontWeight.bold,
                          size: 32,
                        ),
                      ),
                      const SizedBox(height: 16),
                      if (widget.type == LearningObjectTypology.path ||
                          widget.type == LearningObjectTypology.course) ...[
                        // descrizione
                        Text(
                          widget.descrizione,
                          style: TextStyle(
                            color: ColorManager().getColorTextPrimary(),
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: vPadding),
                        const Spacer(),
                      ],

                      buildButtons(),
                      const SizedBox(height: 24),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                    color: ColorManager().getColorTextPrimary(),
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      ' ${widget.progressPercentage.toStringAsFixed(0)}%',
                                  style: AppTextTheme.body(
                                    color: ColorManager().getColorTextPrimary(),
                                    weight: FontWeight.bold,
                                    size: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GlowProgressBar(
                            percentage: widget.progressPercentage,
                          ),
                          const SizedBox(height: 4),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        if (widget.showDivider) ...[
          Divider(
            height: 1,
            thickness: 1,
            color: ColorManager().getColorBorder(),
          ),
        ],
      ],
    );
  }

  Widget buildButtons() {
    // pulsante e icona
    return SizedBox(
      child: FocusTraversalGroup(
        key: LabeledGlobalKey('BUTTONS TRAVERSAL - Main'),
        policy: _policy,
        child: FocusScope(
          node: _focusNode,
          onFocusChange: (hasFocus) {
            widget.onFocusChange?.call(hasFocus);

            if (_focusNode.focusedChild == null) {
              Future.delayed(const Duration(milliseconds: 100), () {
                final f = _focusNode.descendants.firstWhereOrNull(
                  (element) {
                    return element.id == 'BUTTON-0';
                  },
                );
                f?.requestFocus();
              });
            }
          },
          child: CallbackShortcuts(
            bindings: <ShortcutActivator, VoidCallback>{
              const SingleActivator(LogicalKeyboardKey.arrowLeft): () {
                final f = FocusManager.instance.primaryFocus;

                if (widget.isSubActivities) {
                  context
                      .read<DetailPageCubit>()
                      .detailsFocusNode
                      ?.requestFocus();
                } else if (f?.id == 'BUTTON-0') {
                  context.read<DetailPageCubit>().leftPanelNode?.requestFocus();
                } else {
                  _policy.previous(_focusNode);
                }
              },
              const SingleActivator(LogicalKeyboardKey.arrowRight): () {
                final f = FocusManager.instance.primaryFocus;
                if (f?.id == 'BUTTON-1') {
                  context
                      .read<DetailPageCubit>()
                      .subActivitiesFocusNode
                      ?.requestFocus();
                } else {
                  _policy.next(_focusNode);
                }
              },
            },
            child: Row(
              children: [
                Expanded(
                  child: FocusTraversalOrder(
                    order: const NumericFocusOrder(0),
                    child: OLButton(
                      id: 'BUTTON-0',
                      title: widget.buttonTitle,
                      onFocusChanded: (p0) {
                        if (widget.isSubActivities) {
                          return;
                        }
                        if (p0) {
                          isActivityButtonLastFocused = false;
                          widget.onModuleButtonFocused?.call(
                            ButtonFocusedType.resume,
                          );
                        }
                      },
                      onPressed: !widget.isEnabled
                          ? null
                          : () {
                              widget.onButtonPressed(widget.index);
                            },
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                if (widget.numAttivita != null && widget.numAttivita != 0) ...[
                  Expanded(
                    child: FocusTraversalOrder(
                      order: const NumericFocusOrder(1),
                      child: OLButton(
                        id: 'BUTTON-1',
                        title: LabelsManager().getRemoteStringFromLabelKeys(
                            RemoteLabelKeys.learning_activities),
                        outline: true,
                        onFocusChanded: (p0) {
                          if (widget.isSubActivities) {
                            return;
                          }
                          if (p0) {
                            if (isActivityButtonLastFocused == false) {
                              isActivityButtonLastFocused = true;
                              widget.onModuleButtonFocused?.call(
                                ButtonFocusedType.learningActivities,
                              );
                            }
                          }
                        },
                        onPressed: !widget.isEnabled
                            ? null
                            : () {
                                widget.onButtonPressed(widget.index);
                              },
                      ),
                    ),
                  ),
                ] else ...[
                  const Expanded(child: SizedBox())
                ],
                const SizedBox(width: 8),
                BadgeIcon(
                  hasBadge: widget.hasBadge,
                  isCompleted: widget.isCompleted,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDurationTag() {
    if (widget.durataMinuti == null || widget.durataMinuti == 0) {
      return const SizedBox.shrink();
    }

    return IconText(
      bkColor: ColorManager().getColorTextPrimary(),
      text: convertMinutesToHours(widget.durataMinuti ?? 0),
      textColor: ColorManager().getColorTextPrimary(),
      icon: Icons.watch_later_outlined,
      iconSize: 16,
    );
  }

  Widget buildVerticalImage() {
    return SizedBox(
      width: 162,
      height: 330,
      child: Stack(
        children: [
          OLImage(
            imageURL: widget.imageUrl,
            cacheWidth: 450,
          ),
          if (widget.status == 'C')
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

  @override
  bool get wantKeepAlive => true;
}
